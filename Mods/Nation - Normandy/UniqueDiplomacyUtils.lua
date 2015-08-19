-- ============================================================================
-- This Lua file contains functions that are intended to allow for unique
-- responses from AI-controlled leaders depending on what leader the player is.
-- Feel free to make use of this file in your own mods.
-- Thanks to JFD and Ryoga for their work on Unique Cultural Influence, which
-- I based this off
-- Many SQL checks removed for performance on Vice Virtuoso's advice. Make sure
-- you know what you're doing, okay?
-- ============================================================================

-- ============================================================================
-- Response change functions
-- These alter the references in the Diplomacy_Responses table. They do not
-- overwrite diplomacy lines directly.
-- ============================================================================

-- Replaces a response in the Diplomacy_Responses table
-- It will only add it if the new response text you are specifying exists.
function ChangeDiplomacyResponse(leaderType, targetResponseType, targetResponse, newResponse, bias)
	if (leaderType and targetResponseType and targetResponse and newResponse) then
		if (bias == nil) then bias = 1 end;
		local locale = "Language_" ..Locale.GetCurrentLanguage().Type;
		local text;
		for _ in DB.Query("SELECT Text FROM " ..locale .." WHERE Tag LIKE '" ..newResponse.."'") do text = _.Text end
		if text then
			for _ in DB.Query("UPDATE Diplomacy_Responses SET Response = '" .. newResponse .. "', Bias = " .. bias .." WHERE LeaderType = '" ..leaderType.. "' AND ResponseType = '" ..targetResponseType .. "' AND Response= '" .. targetResponse .. "'") do end
			--print(leaderType .. "'s " .. targetResponseType .. " with Response " .. targetResponse .. " changed to use " .. newResponse .. "!");
		end
	end
end

-- Adds a new response to a set of diplomacy responses. It will only add it if
-- the response you're trying to add doesn't already exist, and the response
-- text exists
function AddDiplomacyResponse(leaderType, targetResponseType, newResponse, bias)	
	if (leaderType and targetResponseType and newResponse) then
		if (bias == nil) then bias = 1 end;
		local locale = "Language_" ..Locale.GetCurrentLanguage().Type;
		local response;
		for _ in DB.Query("SELECT Response FROM Diplomacy_Responses WHERE LeaderType = '" ..leaderType.. "' AND ResponseType = '" ..targetResponseType .. "' AND Response= '" .. newResponse .. "'") do response = _.Response end
		if response == nil then
			local text;
			for _ in DB.Query("SELECT Text FROM " ..locale .." WHERE Tag LIKE '" .. newResponse .. "'") do text = _.Text end
			if text then
				for _ in DB.Query("INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('" .. leaderType .. "','" .. targetResponseType.. "','" .. newResponse .. "'," .. bias .. ")") do end
				--print(leaderType .. "'s " .. targetResponseType .. " with Response " .. newResponse .. " added!");
			end
		end
	end
end

-- Removes an existing response. This will never actually fail, since trying to
-- delete something that doesn't exist won't do anything
function RemoveDiplomacyResponse(leaderType, targetResponseType, targetResponse)
	if (leaderType and targetResponseType and targetResponse) then
		for _ in DB.Query("DELETE FROM Diplomacy_Responses WHERE LeaderType = '" ..leaderType.. "' AND ResponseType = '" ..targetResponseType .. "' AND Response= '" .. targetResponse .. "'") do end
		--print(leaderType .. "'s " .. targetResponseType .. " with Response " .. targetResponse .. " deleted if it exists!");
	end
end

-- ============================================================================
-- Line change functions
-- These alter Game Text entries directly (i.e. the Language_??_?? entries).
-- Also, these automatically escape apostrophes in the line to avoid errors
-- while parsing the SQL.
-- I don't recommend you use Change/Add/RemoveDiplomacyGameText anymore, it's
-- better to change the responses using the above. However, I will keep them
-- there for compatibility and if you REALLY want to use them.
-- ============================================================================

-- (technically, you could use these to alter Game Text entries not related to
-- diplomacy. I won't stop you if you want to repurpose the code for that!)

-- This function replaces a specific diplomacy line with another from the
-- current locale.
-- Please remember that you will lose the line you're replacing, so bear that
-- in mind if you need it later.
function ChangeDiplomacyGameText(targetText, newText)
    if (targetText and newText) then
        local locale = "Language_" ..Locale.GetCurrentLanguage().Type;        
        local newTextTest;
        for _ in DB.Query("SELECT Text FROM " ..locale .." WHERE Tag='" .. newText .. "'") do newTextTest = _.Text end
        if newTextTest then
            -- gsub escapes the apostrophes so that we don't get an error
            for _ in DB.Query("UPDATE " .. locale .. " SET Text = '" .. string.gsub(newTextTest, "'", "''") .."' WHERE Tag='" ..targetText .."'") do end
            Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type );
            --print(targetText .. " changed to " .. newText .. " in " .. locale .. "!");
        end
    end
end

-- This function adds a specific diplomacy line from the current locale. It
-- will not add anything if you try to add a TXT_KEY that already exists.
-- Essentially it copies the entry. If you want to use a completely new string
-- then use the AddDiplomacyGameTextFromString function.
function AddDiplomacyGameText(targetText, newText)
    if (targetText and newText) then
        local locale = "Language_" ..Locale.GetCurrentLanguage().Type;
        local newTextTest;
        for _ in DB.Query("SELECT Text FROM " ..locale .." WHERE Tag='" .. newText .. "'") do newTextTest = _.Text end
        if newTextTest then
            -- gsub escapes the apostrophes so that we don't get an error
            for _ in DB.Query("INSERT OR IGNORE INTO " .. locale .. " (Text, Tag) VALUES ('" .. string.gsub(newTextTest, "'", "''") .."', '" ..targetText .."')") do end
            Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type );
            --print(newText .. " copied to " .. targetText .. " in " .. locale .. "!");
        end
    end
end

-- This function removes a specific diplomacy line from the current locale.
-- This will never actually fail, since trying to delete something that doesn't
-- exist won't do anything.
-- Please remember that you will lose the line you're removing, so bear that in
-- mind if you need it later.
function RemoveDiplomacyGameText(targetText)
    if (targetText) then
        local locale = "Language_" ..Locale.GetCurrentLanguage().Type;
        --print("Current locale is " .. locale .. ".");
        for _ in DB.Query("DELETE FROM " .. locale .. " WHERE Tag='" .. targetText .. "'") do end
        --print(targetText .. " deleted from " .. locale .. "!");
    end
end

-- This function replaces a specific diplomacy line from the specified locale
-- with a string. It will fail if the target entry doesn't exist in the
-- specified locale. You need to specify the locale while calling this since it
-- is impossible to get it from a string. It is assumed you will pass a valid 
-- one (it expects it in the form "Language_??_??").
-- Please remember that you will lose the line you're replacing, so bear that
-- in mind if you need it later.
function ChangeDiplomacyGameTextToString(targetText, newString, locale)
	if (type(newString) == "string" and targetText and locale) then
		local targetTextTest;
		for _ in DB.Query("SELECT Text FROM " .. locale .." WHERE Tag='" .. targetText .. "'") do targetTextTest = _.Text end
		if targetTextTest then
			-- gsub escapes the apostrophes so that we don't get an error
			for _ in DB.Query("UPDATE " .. locale .. " SET Text = '" .. string.gsub(newString, "'", "''") .."' WHERE Tag='" ..targetText .."'") do end
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type );
			--print(targetText .. " changed to " .. newString .. " in " .. locale .. "!");
		end
	end
end

-- This function adds a specific diplomacy line from a string in the specified 
-- locale. It will fail if the target entry already exists in the specified
-- locale. You need to specify the locale while calling this since it is 
-- impossible to get it from a string. It is assumed you will pass a valid one 
-- (it expects it in the form "Language_??_??").
function AddDiplomacyGameTextFromString(targetText, newString, locale)
	if (type(newString) == "string" and targetText and locale) then
		local targetTextTest;
		for _ in DB.Query("SELECT Text FROM " ..locale .." WHERE Tag='" .. targetText .. "'") do targetTextTest = _.Text end
		if targetTextTest == nil then
			-- gsub escapes the apostrophes so that we don't get an error
			for _ in DB.Query("INSERT INTO " .. locale .. " (Text, Tag) VALUES ('" .. string.gsub(newString, "'", "''") .."', '" ..targetText .."')") do end
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type );
			--print(newString .. " added to " .. locale .. " in " .. targetText .. "!");
		end
	end
end