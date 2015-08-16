-- TableSaverLoader
-- Author: Pazyryk

print ("Loading TableSaverLoader.lua...")
------------------------------------------------------------------------------------------------------
-- 0.10 (Oct 6, 2011) Release version
-- 0.11 (Sep 23, 2012) Fixed a bug in 0.10 that caused a crash when a persisted variable changed type
-- 0.12 (May 1, 2013) Adds TableSave to LuaEvents so it can be called from another state
-- 0.13 (Jul 13, 2014) Fixed a bug in 0.12 that occured when a nested table was moved from one table index to another
--                     Recoded from ground-up for speed and robustness; there are some new table rules
-- 0.14 (Jul 14, 2014) Fixed error in 0.13 where it would load an empty table as nil
-- 0.15 (not released) More speed and memory optimizations: in particular, no longer stores a string representation of numbers
--					   TableLoad returns true (if save tables exist) or false, so can be used to detect a loaded game
-- 0.16 (Aug 7, 2014) Now allows apostrohe (') in string values and NaN, Inf and -Inf as numbers; more memory optimization
------------------------------------------------------------------------------------------------------

-- TableSave() recursively saves a table and all nested tables (at any level) to Civ5SavedGameDatabase.db
-- TableLoad() rebuilds the tables from Civ5SavedGameDatabase.db
--
-- Table rules:
--  * Your table nesting structure must be "tree-like" (see below)
--  * Keys must be integers or strings
--  * Avoid "$" and "#" anywhere in string keys
--  * Avoid international or other non-ascii characters in string keys (multi-byte chars may screw up key parsing)
--  * Don't use empty string ("") as a key
--  * Table values can include any value of type boolean, number, string or table (NOT function, userdata or thread)
--
-- "Tree-like" means that branches never reconnect in your table nesting structure. In other words, nested tables
-- (the branch tips) can only be reached following one path from the master table (the trunk). This violates my
-- original claim that you could have "tables of arbitrary structure", but allowed me to streamline the code and
-- make the whole thing faster and more robust in 0.13.
------------------------------------------------------------------------------------------------------
-- Usage:
--
-- You should hook up TableLoad() to run when your mod inits from a loaded game, and TableSave() to run right before
-- any game save (including quicksaves and autosaves). The latter is somewhat complicated, but is covered in detail
-- here: http://forums.civfanatics.com/showthread.php?t=442249.
--
-- Persisted tables can be set up as in the following example:
-- 
-- gT = {}
-- gValues = {}
-- gPlayers = {}
-- gReligions = {}
-- --these are global but they could just as well be local
--							
-- gT = { gValues =    gValues,			
--		  gPlayers =   gPlayers, 		
--		  gReligions = gReligions }   -- I've given keys the same name as the tables, but that's not necessary
--
-- Tables can be filled with whatever you want now, following rules above. For example, gPlayers can be indexed to
-- hold a table for each player, and those tables can hold more tables or values. Table fields containing values or
-- tables can be created, altered or deleted (table[key] = nil) at any time. If you want, gT itself can contain non-
-- table items.
--
-- Then your code should run these:
--
-- TableSave(gT, "MyMod")  --before all game saves (of any kind)
-- TableLoad(gT, "MyMod")  --after game load to rebuild gT as before
--
-- You should not add TableSave() in the logic of your mod except right before saves. Even if 10000 things change
-- and you have not saved for 50 turns (not even an autosave) no problem. TableSave() only needs to be called right
-- before the next save. Running it at any other time won't do you any good. This means that you only need to fuss
-- with TableSaverLoader once. After it is hooked up to run on game loads and game saves (and you have referenced
-- the tables you want to persist in your master table) then you can forget about TableSaverLoader forever.

------------------------------------------------------------------------------------------------------
-- USER SETTINGS
------------------------------------------------------------------------------------------------------

local bKeepDBChangeInfo = true		-- If true, MyMod_Info will keep a running record of all saves/loads
local bChecksum = true				-- Update a checksum for every value inserted, updated or deleted
local bAssertError = true			-- If true, assert Lua error if checksum fails on load (otherwise, just print error)
local bVerboseDB = false			-- If true, print all statements that change the DB

------------------------------------------------------------------------------------------------------
-- File Locals
------------------------------------------------------------------------------------------------------

--constants
local DUMMY_TABLE = {}				--use to represent generic table; TSL doesn't store any references to modder tables
local STR_NAN = tostring(0/0)		--these are valid numbers in Lua but tostring can be platform/version dependent
local STR_POS_INF = tostring(1/0)
local STR_NEG_INF = tostring(-1/0)

--DB table names
local DBTableData
local DBTableInfo

--init booleans
local bInited, bTableLoaded = false, false

--checksum
local checksum = 0

--Lua representation of the database data (so we know what to update, insert or delete)
local dbMaxID = 0
local dbLuaValueByK = {}
local dbIDbyK = {}
local dbFoundK = {}

--DB operation buffers; hold table keys that need to be inserted or updated
local insertBuffer = {}
local updateBuffer = {}

--counters
local inserts, updates, deletes, unchangeds = 0, 0, 0, 0

--max SQL statement size restrictions
local maxInsertsPerTransaction = 300			-- don't know limit
local maxUpdatesPerTransaction = 600			-- successful up to 1600 on 3 col table

--SQL string construction
local textStrTable = {}
local idTable = {}

--local functions
local DBQuery = Modding.OpenSaveData().Query
local DBChange
local SerializeValue
local Checksum
local BuildTable
local type = type
local tostring = tostring
local tonumber = tonumber
local byte = string.byte
local sub = string.sub
local gsub = string.gsub
local find = string.find
local concat = table.concat

------------------------------------------------------------------------------------------------------
-- Interface
------------------------------------------------------------------------------------------------------

function TableSave(masterTable, DBTablePrefix)
	local timer = os.clock()

	DBTableData = DBTablePrefix.."_Data"	--terminal error if no prefix supplied (good)
	DBTableInfo = DBTablePrefix.."_Info"

	local bCreateTables = false
	if not bInited then			-- this is the first TableSave after game start or game load
		bCreateTables = true
		for row in DBQuery("SELECT name FROM sqlite_master WHERE name='"..DBTableData.."'") do
			 bCreateTables = false
			 break
		end
		if bCreateTables then		--create table and table_SaveLoadInfo
			print("Creating SavedGameDB tables for new game: "..DBTableData.." and "..DBTableInfo)
			DBChange("CREATE TABLE ["..DBTableData.."] ('ID' INTEGER PRIMARY KEY, 'K' TEXT, 'V' TEXT)")
			DBChange("CREATE TABLE ["..DBTableInfo.."] ('ID' INTEGER PRIMARY KEY, 'turn' TEXT, 'bCreateTables' TEXT, 'inserts' TEXT, 'deletes' TEXT, 'updates' TEXT, 'unchangeds' TEXT, 'checksum' TEXT, 'saveTime' TEXT, 'loadTurn' TEXT, 'loadTime' TEXT, 'loadErrors' TEXT)")
		elseif not bTableLoaded then
			print("!!!! TableSaverLoader thinks you are using TableSave before TableLoad on a loaded game; are you sure you want to do that? !!!!")
		end
		bInited = true
	end

	--recursive call
	BuildTable(masterTable, "")

	--DB updates; process up to maxUpdatesPerTransaction at a time
	local nextToProcess, processed = 0, 0
	while processed < updates do
		nextToProcess = processed + 1
		processed = processed + maxUpdatesPerTransaction
		processed = processed < updates and processed or updates
		local count = 0

		for i = nextToProcess, processed do
			local keyString = updateBuffer[i]
			local valueString = SerializeLuaValue(dbLuaValueByK[keyString])
			local id = dbIDbyK[keyString]
			count = count + 1
			idTable[count] = id
			textStrTable[count] = "when ID=" .. id .. " then '" .. valueString .. "'"
		end
		DBChange("update ["..DBTableData.."] set V=case "..concat(textStrTable, " ", 1, count).." end where ID in ("..concat(idTable, "," , 1, count)..")")
	end

	--DB inserts; process up to maxInsertsPerTransaction at a time
	nextToProcess, processed = 0, 0
	while processed < inserts do
		nextToProcess = processed + 1
		processed = processed + maxInsertsPerTransaction
		processed = processed < inserts and processed or inserts
		local count = 0
		for i = nextToProcess, processed do
			local keyString = insertBuffer[i]
			local valueString = SerializeLuaValue(dbLuaValueByK[keyString])
			dbMaxID = dbMaxID + 1						--we won't ever run out of id's, really
			dbIDbyK[keyString] = dbMaxID
			count = count + 1
			textStrTable[count] = dbMaxID ..",'"..keyString.."','"..valueString.."'"
		end
		DBChange("insert into ["..DBTableData.."] (ID,K,V) values (" .. concat(textStrTable, "),(", 1, count) .. ")")
	end

	--DB deletions; delete all rows not seen in this save (assumes no limit on number of deletes)
	for keyString, bKeep in pairs(dbFoundK) do
		if bKeep then
			dbFoundK[keyString] = false	--reset for next save
		else
			deletes = deletes + 1
			local id = dbIDbyK[keyString]

			--remove from checksum
			if bChecksum then
				checksum = checksum - Checksum(dbLuaValueByK[keyString])
			end

			--remove from Lua representation of DB
			dbLuaValueByK[keyString] = nil
			dbIDbyK[keyString] = nil
			dbFoundK[keyString] = nil

			idTable[deletes] = id
		end
	end
	if 0 < deletes then
		DBChange("delete from [" .. DBTableData .. "] where ID in (" .. concat(idTable, ",", 1, deletes).. ")" )
	end

	local saveTime = os.clock() - timer

	if bKeepDBChangeInfo then
		DBChange("INSERT INTO ["..DBTableInfo.."] (turn, bCreateTables, inserts, deletes, updates, unchangeds, checksum, saveTime) VALUES ('"..Game.GetGameTurn().."','"..tostring(bCreateTables).."','"..inserts.."','"..deletes.."','"..updates.."','"..unchangeds.."','"..checksum.."','"..saveTime.."')")
	end

	print("TableSave time: " .. saveTime .. ", inserts: " .. inserts .. ", deletes: " .. deletes .. ", updates: " .. updates .. ", unchanged: " .. unchangeds .. ", checksum: " .. checksum)

	-- housekeeping to prepare for next call
	inserts, deletes, updates, unchangeds  = 0, 0, 0, 0
end

function TableLoad(masterTable, DBTablePrefix)
	local timer = os.clock()

	DBTableData = DBTablePrefix.."_Data"	--terminal error of no prefix supplied (good)
	DBTableInfo = DBTablePrefix.."_Info"

	local bExists = false
	for row in DBQuery("SELECT name FROM sqlite_master WHERE name='"..DBTableData.."'") do
		bExists = true	-- presence of Ea_Info tells us that game already in session
		break
	end
	if not bExists then return false end	--must be a new game assuming TableSave runs during init

	--reset in case modder calls again for some reason
	checksum = 0
	dbMaxID = 0
	for key in pairs(dbLuaValueByK) do
		dbLuaValueByK[key] = nil
	end
	for key in pairs(dbIDbyK) do
		dbIDbyK[key] = nil
	end
	for key in pairs(dbFoundK) do
		dbFoundK[key] = nil
	end

	--read in the DB table
	local errorStr = ""
	for row in DBQuery("SELECT * FROM ["..DBTableData.."]") do
		local keyString = row.K

		--debug unique key test
		if dbLuaValueByK[keyString] ~= nil then			--not enforced by DB column but something is very wrong if this happens
			errorStr = errorStr .. "Non-unique keyString in DB: " .. keyString .. "; "
		end

		local keyPos = 1
		local stepDownTable = masterTable

		-- Work through nested tables in keyString, referencing existing tables or creating new ones, until we get to last key
		while true do
			local bTextKey = sub(keyString, keyPos, keyPos) == "$"	
			local nextKeyPos = find(keyString, "[%#%$]", keyPos + 2)	-- +2 assumes that you don't use "" as key
			if nextKeyPos then
				--THIS key holds a nested table; use it to get existing table or create a new one
				local key = sub(keyString, keyPos + 1, nextKeyPos - 1)
				key = bTextKey and key or tonumber(key)
				stepDownTable[key] = stepDownTable[key] or {}
				stepDownTable = stepDownTable[key]		--step down one in table nesting
			else
				local valueString = row.V

				--convert valueString into proper Lua value and add to table
				local key = sub(keyString, keyPos + 1)
				key = bTextKey and key or tonumber(key)
				local value
				local firstByte = sub(valueString, 1, 1)
				if firstByte == "$" then
					value = sub(valueString, 2)						--surprisingly sub works for empty string ("$" -> "")
				elseif firstByte == "T" then
					value = true
				elseif firstByte == "F" then
					value = false
				elseif firstByte == "*" then						--needed in case we have an empty table
					value = stepDownTable[key]
					if not value or type(value) ~= "table" then
						value = {}
					end
				else
					value = tonumber(valueString)					--numbers have no prefix byte
					if not value then
						if valueString == STR_POS_INF then			--tonumber doesn't recognize these
							value = 1/0	
						elseif valueString == STR_NEG_INF then
							value = -1/0
						elseif valueString == STR_NAN then
							value = 0/0		
						else
							--Can only get here if x ~= tonumber(tostring(x)) where type(x) == "number", and not caught by elseif's above
							error("TableSaverLoader did not understand valueString from DB; keyString = " .. row.K .. "; valueString = " .. valueString)
						end
					end
				end
				stepDownTable[key] = value

				--checksum
				if bChecksum then
					checksum = checksum + Checksum(value)
				end

				--update Lua representation of database data			
				dbLuaValueByK[keyString] = value
				dbFoundK[keyString] = false
				local id = row.ID
				dbIDbyK[keyString] = id
				dbMaxID = dbMaxID < id and id or dbMaxID	--don't assume ordered by ID
				break
			end
 			keyPos = nextKeyPos
		end
	end

	-- write load info
	local lastInfoRow = 1
	if bKeepDBChangeInfo then
		for row in DBQuery("SELECT MAX(ID) FROM ["..DBTableInfo.."]") do
			lastInfoRow = row["MAX(ID)"]		--get current Info row ID
		end
	end

	if bChecksum then
		local checksumOld = 0
		for row in DBQuery("SELECT * FROM ["..DBTableInfo.."] WHERE ID="..lastInfoRow) do
			checksumOld = tonumber(row.checksum)
		end
		if checksum ~= checksumOld then
			errorStr = errorStr .. "Error loading tables: checksumOld="..checksumOld..", checksumNew="..checksum
		end
	end

	local loadTime = os.clock() - timer
	if bKeepDBChangeInfo then		-- write load info
		DBChange("UPDATE ["..DBTableInfo.."] SET loadTurn='"..Game.GetGameTurn().."', loadTime='"..loadTime.."', loadErrors='"..errorStr.."' WHERE ID="..lastInfoRow)
	end
	if errorStr == "" then
		print("TableLoad ran without error; time: " .. loadTime .. ", checksum: " .. checksum)
	elseif bAssertError then
		error(errorStr)
	else
		print(errorStr)
	end

	bTableLoaded = true
	return true
end

------------------------------------------------------------------------------------------------------
-- Local functions
------------------------------------------------------------------------------------------------------

BuildTable = function (table, tableName)
	for key, value in pairs(table) do

		--build the keyString
		local keyType = type(key)
		local keyString
		if keyType == "number" then			--a non-integer would work, but who does that?
			keyString = tableName .. "#" .. tostring(key)
		elseif keyType == "string" then
			if find(key, "[%#%$%']") or key == "" then			--no #, $ or ' allowed in string key
				error([[TableSave cannot process string keys that contain #, $ or ' or are empty (""); bad key: ]] .. key)
			end
			keyString = tableName .. "$" .. key
		else
			error("TableSave can only process keys that are integers or strings; bad key/type: " .. tostring(key) .. " " .. keyType)
		end

		--mark as found so we don't delete
		dbFoundK[keyString] = true

		--figure out what to do with this value
		local bTable = type(value) == "table"

		if dbLuaValueByK[keyString] == value or (bTable and dbLuaValueByK[keyString] == DUMMY_TABLE) then
			--this element has not changed since last TableSave; do nothing (most common)
			unchangeds = unchangeds + 1
		elseif dbLuaValueByK[keyString] ~= nil then
			--element exists but needs update
			updates = updates + 1
			updateBuffer[updates] = keyString
			if bChecksum then
				checksum = checksum - Checksum(dbLuaValueByK[keyString])	--decrement for old value
				checksum = checksum + Checksum(value)						--increment for new value
			end
			dbLuaValueByK[keyString] = bTable and DUMMY_TABLE or value
		else
			--element does not exists; insert as new DB row
			inserts = inserts + 1
			insertBuffer[inserts] = keyString
			if bChecksum then
				checksum = checksum + Checksum(value)						--increment for new value
			end
			dbLuaValueByK[keyString] = bTable and DUMMY_TABLE or value
		end

		if bTable then
			BuildTable(value, keyString)			--recursion
		end
	end
end

DBChange = function(str)	--for single DB commands when an iterator just looks confusing
	if bVerboseDB then
		local i = 1
		while i < #str do
			print(sub(str, i, i + 499))	--friendly print for Fire Tuner
			i = i + 500
		end
	end
	for _ in DBQuery(str) do end
end

SerializeLuaValue = function(value)
	local valueType = type(value)
	if valueType == "number" then
		return tostring(value)					--numbers stored as text with no prefix byte
	elseif valueType == "string" then
		return "$" .. gsub(value, "'", "''")	--strings have "$" as prefix byte; we need to escape apostrophe (with two apostrophes) for sql statement
	elseif valueType == "boolean" then
		return value and "T" or "F"				--booleans represented by "T" or "F"
	elseif valueType == "table" then
		return "*"								--table represented by "*"
	else
		error("TableSaverLoader doesn't know type ".. valueType)
	end
end

Checksum = function(value)
	local valueType = type(value)
	if valueType == "number" then
		return byte(value)			--gives left-most byte of tostring result
	elseif valueType == "string" then
		return byte(value) or 11	--or needed for empty string ("")
	elseif valueType == "boolean" then
		return value and 13 or 17	--whatever
	else
		return 19	--any table
	end
end
