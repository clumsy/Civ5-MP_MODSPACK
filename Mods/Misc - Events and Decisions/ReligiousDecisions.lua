-- Religious Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Religious Decisions: loaded")

--=======================================================================================================================
-- Commission Holy Book
--=======================================================================================================================
-- Commission Holy Book: Data
--------------------------------------------------------------------------------------------------------------------------
tReligion_HolyBook = {}

tReligion_HolyBook.RELIGIONGROUP_BUDDHISM = "BUDDHISM"
tReligion_HolyBook.RELIGIONGROUP_CHRISTIANITY = "CHRISTIANITY"
tReligion_HolyBook.RELIGIONGROUP_CONFUCIANISM = "CONFUCIANISM"
tReligion_HolyBook.RELIGIONGROUP_JUDAISM = "JUDAISM"
tReligion_HolyBook.RELIGIONGROUP_ISLAM = "ISLAM"
tReligion_HolyBook.RELIGIONGROUP_HINDUISM = "HINDUISM"
tReligion_HolyBook.RELIGIONGROUP_SHINTO = "SHINTO"
tReligion_HolyBook.RELIGIONGROUP_SIKHISM = "SIKHISM"
tReligion_HolyBook.RELIGIONGROUP_TENGRIISM = "TENGRIISM"
tReligion_HolyBook.RELIGIONGROUP_TAOISM = "TAOISM"
tReligion_HolyBook.RELIGIONGROUP_ZOROASTRIANISM = "ZOROASTRIANISM"

for Religion in GameInfo.Religions() do
	local sReligion = Religion.Type
	local sReligionGroup = tReligiousGroups[sReligion]
	if tReligion_HolyBook[sReligionGroup] ~= nil then
		tReligion_HolyBook[sReligion] = tReligion_HolyBook[sReligionGroup]
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- Commission Holy Book: Function
--------------------------------------------------------------------------------------------------------------------------
local Decisions_HolyBook = {}
	Decisions_HolyBook.Name = "TXT_KEY_DECISIONS_HOLYBOOK"
	Decisions_HolyBook.Desc = "TXT_KEY_DECISIONS_HOLYBOOK_DESC"
	Decisions_HolyBook.Type = "Religious"
	Decisions_HolyBook.CanFunc = (
	function(pPlayer)
	
		local bEnacted = false
		local sReligion = nil

		local iReligion = load(pPlayer, "Decisions_HolyBook")
		if iReligion ~= nil then
			bEnacted = true
		--If the decision is yet unenacted, grab majority religion
		else
			iReligion = GetPlayerMajorityReligion(pPlayer)
			
			--If no majority religion; just end the function (false, false)
			if iReligion == nil then return false, false end
		end
		
		local iCost = math.ceil(500 * iMod)
		local iReward = math.ceil(300 * iMod)
		
		if pPlayer:IsHuman() then
			--=========================================================
			--Generate Name and Description
			--For the sake of efficiency, skip for non-humans
			--=========================================================
			local sReligion = GameInfo.Religions[iReligion].Type
			
			Decisions_HolyBook.Name = "TXT_KEY_DECISIONS_HOLYBOOK"
			local sFlavor = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HOLYBOOK_DESC", Game.GetReligionName(iReligion))
			local sCost = ""
			local sReward = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HOLYBOOK_REWARD", iReward)
			
			if tReligion_HolyBook[sReligion] ~= nil then
				local sKey = tReligion_HolyBook[sReligion]
				Decisions_HolyBook.Name = "TXT_KEY_DECISIONS_HOLYBOOK_" .. sKey
				sFlavor = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HOLYBOOK_DESC_" .. sKey)
			end
			if not(bEnacted) then 
				sCost = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HOLYBOOK_COST", Game.GetReligionName(iReligion), iCost)
			end
			
			HookDecisionReligionIcon(Decisions_HolyBook, iReligion)
			Decisions_HolyBook.Desc = sFlavor .. sCost .. sReward
		end
		
		if bEnacted then return false, false, true end
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PRINTING_PRESS)) then return false, false end
		if (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_ANCIENT) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		return true, true
	end
	)
	
	Decisions_HolyBook.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		local iReward = math.ceil(300 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeFaith(iReward)
		save(pPlayer, "Decisions_HolyBook", GetPlayerMajorityReligion(pPlayer))
	end
	)
	
tDecisions.Decisions_HolyBook = Decisions_HolyBook

--=======================================================================================================================
-- Decisions_ReligionEvents_1
--=======================================================================================================================
-- Decisions_ReligionEvents_1: Data
-------------------------------------------------------------------------------------------------------------------------

tReligionEvents_1 = {}
tReligionEvents_1.RELIGIONGROUP_BUDDHISM = {GameInfo.Yields.YIELD_CULTURE.ID, GameInfo.Yields.YIELD_SCIENCE.ID, "BUDDHISM"}
tReligionEvents_1.RELIGIONGROUP_CHRISTIANITY = {GameInfo.Yields.YIELD_CULTURE.ID, GameInfo.Yields.YIELD_CULTURE.ID, "CHRISTIANITY"}
	tReligionEvents_1.RELIGIONGROUP_PROTESTANTISM = {GameInfo.Yields.YIELD_PRODUCTION.ID, GameInfo.Yields.YIELD_CULTURE.ID, "PROTESTANTISM"}
tReligionEvents_1.RELIGIONGROUP_ISLAM = {GameInfo.Yields.YIELD_CULTURE.ID, GameInfo.Yields.YIELD_FAITH.ID, "ISLAM"}
tReligionEvents_1.RELIGIONGROUP_HINDUISM = {GameInfo.Yields.YIELD_FOOD.ID, GameInfo.Yields.YIELD_FOOD.ID, "HINDUISM"}

for Religion in GameInfo.Religions() do
	local sReligion = Religion.Type
	local sReligionGroup = tReligiousGroups[sReligion]
	if tReligionEvents_1[sReligionGroup] ~= nil then
		tReligionEvents_1[sReligion] = tReligionEvents_1[sReligionGroup]
	end
end

--Buddhism
if bBuddhismSect then 
	tReligionEvents_1.RELIGION_BUDDHISM = {GameInfo.Yields.YIELD_SCIENCE.ID, GameInfo.Yields.YIELD_SCIENCE.ID, "THERAVADA"}
	tReligionEvents_1.RELIGION_VAJRAYANA = {GameInfo.Yields.YIELD_FAITH.ID, GameInfo.Yields.YIELD_SCIENCE.ID, "VAJRAYANA"}
end
--Christianity
if bChristianitySect then 
	tReligionEvents_1.RELIGION_CHRISTIANITY = {GameInfo.Yields.YIELD_GOLD.ID, GameInfo.Yields.YIELD_CULTURE.ID, "CATHOLICISM"}
	tReligionEvents_1.RELIGION_ORTHODOXY = {GameInfo.Yields.YIELD_FAITH.ID, GameInfo.Yields.YIELD_CULTURE.ID, "ORTHODOXY"}
	tReligionEvents_1.RELIGION_PROTESTANTISM = tReligionEvents_1.RELIGIONGROUP_PROTESTANTISM
	tReligionEvents_1.RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX = {[3] = "CHRISTIAN_ORIENTAL_ORTHODOX"}
	if bProtestantSect then
		tReligionEvents_1.RELIGION_PROTESTANT_CALVINISM = tReligionEvents_1.RELIGIONGROUP_PROTESTANTISM
		tReligionEvents_1.RELIGION_PROTESTANT_METHODISM = tReligionEvents_1.RELIGIONGROUP_PROTESTANTISM
		tReligionEvents_1.RELIGION_PROTESTANT_BAPTIST = tReligionEvents_1.RELIGIONGROUP_PROTESTANTISM
	end
end
--Judaism
tReligionEvents_1.RELIGION_JUDAISM = {GameInfo.Yields.YIELD_SCIENCE.ID, GameInfo.Yields.YIELD_GOLD.ID, "JUDAISM"}
--Other Vanilla Religions
tReligionEvents_1.RELIGION_CONFUCIANISM = {[3] = "CONFUCIANISM"}
tReligionEvents_1.RELIGION_SHINTO = {[3] = "SHINTO"}
tReligionEvents_1.RELIGION_SIKHISM = {[3] = "SIKHISM"}
tReligionEvents_1.RELIGION_TENGRIISM = {[3] = "TENGRIISM"}
tReligionEvents_1.RELIGION_TAOISM = {[3] = "TAOISM"}
tReligionEvents_1.RELIGION_ZOROASTRIANISM = {[3] = "ZOROASTRIANISM"}

--ETC
tReligionEvents_1.RELIGION_FORN_SIDR = {[3] = "FORN_SIDR"}
tReligionEvents_1.RELIGION_PESEDJET = {[3] = "PESEDJET"}
tReligionEvents_1.RELIGION_HELLENISM = {[3] = "HELLENISM"}
tReligionEvents_1.RELIGION_CHALDEANISM = {[3] = "CHALDEANISM"}
tReligionEvents_1.RELIGION_PACHISM = {[3] = "PACHISM"}

tReligionEvents_1.RELIGION_ORENDA = {[3] = "ORENDA"}
tReligionEvents_1.RELIGION_POHAKANTENNA = {[3] = "POHAKANTENNA"}
tReligionEvents_1.RELIGION_AMATONGO = {[3] = "AMATONGO"}
tReligionEvents_1.RELIGION_DRUIDISM = {[3] = "DRUIDISM"}
tReligionEvents_1.RELIGION_MANAISM = {[3] = "MANAISM"}

tReligionEvents_1.RELIGION_CANAANISM = {[3] = "CANAANISM"}
tReligionEvents_1.RELIGION_WAKAN_TANKA = {[3] = "WAKAN_TANKA"}
tReligionEvents_1.RELIGION_LIIM_DINGERMES = {[3] = "LIIM_DINGERMES"}
tReligionEvents_1.RELIGION_NZAMBIISM = {[3] = "NZAMBIISM"}
tReligionEvents_1.RELIGION_NOAIDEVUOHTA = {[3] = "NOAIDEVUOHTA"}

tReligionEvents_1.RELIGION_ITAN = {[3] = "ITAN"}
tReligionEvents_1.RELIGION_WILTRAN_MAPU = {[3] = "WILTRAN_MAPU"}
tReligionEvents_1.RELIGION_TLATEOMATILIZTLI = {[3] = "TLATEOMATILIZTLI"}

tReligionEvents_1[GameInfo.Yields.YIELD_FOOD.ID] = 0.6
tReligionEvents_1[GameInfo.Yields.YIELD_PRODUCTION.ID] = 1
tReligionEvents_1[GameInfo.Yields.YIELD_GOLD.ID] = 1.2
tReligionEvents_1[GameInfo.Yields.YIELD_SCIENCE.ID] = 0.5
tReligionEvents_1[GameInfo.Yields.YIELD_CULTURE.ID] = 0.6
tReligionEvents_1[GameInfo.Yields.YIELD_FAITH.ID] = 1

--=======================================================================================================================
--Decisions_ReligionEvents_1: Functions
--=======================================================================================================================

local Decisions_ReligionEvents_1 = {}
	Decisions_ReligionEvents_1.Name = "TXT_KEY_DECISIONS_RELIGIONEVENTS_1"
	Decisions_ReligionEvents_1.Desc = "TXT_KEY_DECISIONS_RELIGIONEVENTS_1_DESC"
	Decisions_ReligionEvents_1.Type = "Religious"
	Decisions_ReligionEvents_1.CanFunc = (
	function(pPlayer)
		local bAvailable = false
		local bEnactable = false
		local bEnacted = false
		
		local iEra = load(pPlayer, "Decisions_ReligionEvents_1")
		local iCurrentEra = pPlayer:GetCurrentEra() + 1
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_ReligionEvents_1", nil)
				save(pPlayer, "Decisions_ReligionEvents_1Religion", nil)
			else
				--Decision is enacted, grab saved religion
				bEnacted = true
				iReligion = load(pPlayer, "Decisions_ReligionEvents_1Religion")
			end
		end
		
		--If the decision is yet unenacted, grab majority religion
		if not bEnacted then
			iReligion = GetPlayerMajorityReligion(pPlayer)
			if iReligion ~= nil then
				bAvailable = true
			-- No majority religion; so just end the function (false, false)
			else
				return bAvailable, bEnactable
			end
		end
		
	--=========================================================
	--Load religious bonuses
	--=========================================================
		local sReligion = GameInfo.Religions[iReligion].Type
		local tBonuses = tReligionEvents_1[sReligion]
		--=========================================================
		--Bonuses undefined, try loading save variables
		--=========================================================
		if tBonuses == nil then tBonuses = {} end
		local sKey = tBonuses[3]
		
		if tBonuses[1] == nil then
			tBonuses =	{
						load(pPlayer, "Decisions_ReligionEvents_1Religion" .. sReligion .. "Minor"), 
						load(pPlayer, "Decisions_ReligionEvents_1Religion" .. sReligion .. "Major")
						}
						
			tReligionEvents_1[sReligion] = {tBonuses[1], tBonuses[2], sKey}
			--=========================================================
			--New completely undefined religion, generate random yields
			--=========================================================
			if tBonuses[1] == nil then
				local tGIYields = 	{	
									GameInfo.Yields.YIELD_FOOD.ID, 
									GameInfo.Yields.YIELD_PRODUCTION.ID, 
									GameInfo.Yields.YIELD_GOLD.ID, 
									GameInfo.Yields.YIELD_SCIENCE.ID,
									GameInfo.Yields.YIELD_CULTURE.ID,
									GameInfo.Yields.YIELD_FAITH.ID
									}
				local iRand1 = GetRandom(1, #tGIYields)
				local iRand2 = GetRandom(1, #tGIYields)
				tBonuses = {tGIYields[iRand1], tGIYields[iRand2]}
				tReligionEvents_1[sReligion] = {tBonuses[1], tBonuses[2], sKey}
				save(pPlayer, "Decisions_ReligionEvents_1Religion" .. sReligion .. "Minor", tBonuses[1])
				save(pPlayer, "Decisions_ReligionEvents_1Religion" .. sReligion .. "Major", tBonuses[2])
			end
		end
		
		if pPlayer:IsHuman() then
		--=========================================================
		--Generate Name and Description
		--For the sake of efficiency, skip for non-humans
		--=========================================================
			local sFlavor = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RELIGIONEVENTS_1_DESC")
			local sCost = ""
			local sReward = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RELIGIONEVENTS_1_REWARD")
			local sBonus1 = ""
			local sBonus2 = ""
			local sNote = ""
			if tReligionEvents_1[sReligion][3] ~= nil then
				Decisions_ReligionEvents_1.Name = "TXT_KEY_DECISIONS_RELIGIONEVENTS_1" .. tReligionEvents_1[sReligion][3]
				sFlavor = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RELIGIONEVENTS_1_DESC" .. tReligionEvents_1[sReligion][3])
			end
			if bEnacted then
				sBonus1 = ("[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_LUMPSUM") .. GameInfo.Yields[tBonuses[1]].IconString .. " " .. Locale.ConvertTextKey(GameInfo.Yields[tBonuses[1]].Description))
				if tBonuses[1] ~= tBonuses[2] then
					sBonus2 = ("[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_LUMPSUM") .. GameInfo.Yields[tBonuses[2]].IconString .. " " .. Locale.ConvertTextKey(GameInfo.Yields[tBonuses[2]].Description))
				end
			else
				local iUnity = GetReligiousUnity(pPlayer, iReligion)
				sCost = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RELIGIONEVENTS_1_COST", Game.GetReligionName(iReligion))
				sNote = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RELIGIONEVENTS_1_NOTE", math.ceil(iUnity * 100))
				local iDelta1 = math.ceil((iCurrentEra * 5 + 35) * iCurrentEra * tReligionEvents_1[tBonuses[1]] * iUnity * iMod * 0.6)
				local iDelta2 = math.ceil((iCurrentEra * 5 + 35) * iCurrentEra * tReligionEvents_1[tBonuses[2]] * iUnity * iMod)
				sBonus1 = ("[NEWLINE][ICON_BULLET]" .. (iDelta1 + iDelta2) .. " " .. GameInfo.Yields[tBonuses[1]].IconString .. " " .. Locale.ConvertTextKey(GameInfo.Yields[tBonuses[1]].Description))
				if tBonuses[1] ~= tBonuses[2] then
					sBonus1 = ("[NEWLINE][ICON_BULLET]" .. iDelta1 .. " " .. GameInfo.Yields[tBonuses[1]].IconString .. " " .. Locale.ConvertTextKey(GameInfo.Yields[tBonuses[1]].Description))
					sBonus2 = ("[NEWLINE][ICON_BULLET]" .. iDelta2 .. " " .. GameInfo.Yields[tBonuses[2]].IconString .. " " .. Locale.ConvertTextKey(GameInfo.Yields[tBonuses[2]].Description))
				end
			end
			Decisions_ReligionEvents_1.Desc = (sFlavor .. sCost .. sReward .. sBonus1 .. sBonus2 .. sNote)
		end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) >= 1) then bEnactable = true end
		HookDecisionReligionIcon(Decisions_ReligionEvents_1, iReligion)
		return bAvailable, bEnactable, bEnacted
	end
	)
	
	Decisions_ReligionEvents_1.DoFunc = (
	function(pPlayer)
		local iReligion = GetPlayerMajorityReligion(pPlayer)
		local sReligion = GameInfo.Religions[iReligion].Type
		local iUnity = GetReligiousUnity(pPlayer, iReligion)
		local iCurrentEra = pPlayer:GetCurrentEra() + 1
		local tBonuses = {tReligionEvents_1[sReligion][1], tReligionEvents_1[sReligion][2]}
		local iDelta1 = math.ceil((iCurrentEra * 5 + 35) * iCurrentEra * tReligionEvents_1[tBonuses[1]] * iUnity * iMod * 0.5)
		local iDelta2 = math.ceil((iCurrentEra * 5 + 35) * iCurrentEra * tReligionEvents_1[tBonuses[2]] * iUnity * iMod)
		for i = 1,2 do
			local iYield = tBonuses[i]
			local iDelta = iDelta1
			if i == 2 then
				iDelta = iDelta2
			end
			--Food
			if iYield == GameInfo.Yields.YIELD_FOOD.ID then
				iDelta = math.ceil(iDelta/pPlayer:GetNumCities())
				for pCity in pPlayer:Cities() do
					pCity:ChangeFood(iDelta)
				end
			--Production
			elseif iYield == GameInfo.Yields.YIELD_PRODUCTION.ID then
				iDelta = math.ceil(iDelta/pPlayer:GetNumCities())
				for pCity in pPlayer:Cities() do
					pCity:SetOverflowProduction(pCity:GetOverflowProduction() + iDelta)
				end
			--Gold
			elseif iYield == GameInfo.Yields.YIELD_GOLD.ID then
				pPlayer:ChangeGold(iDelta)
			--Science	
			elseif iYield == GameInfo.Yields.YIELD_SCIENCE.ID then
				LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iDelta)
			--Culture
			elseif iYield == GameInfo.Yields.YIELD_CULTURE.ID then
				pPlayer:ChangeJONSCulture(iDelta)
			--Faith
			elseif iYield == GameInfo.Yields.YIELD_FAITH.ID then
				pPlayer:ChangeFaith(iDelta)
			end
		end
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_ReligionEvents_1", iCurrentEra)
		save(pPlayer, "Decisions_ReligionEvents_1Religion", iReligion)
	end
	)
	
tDecisions.Decisions_ReligionEvents_1 = Decisions_ReligionEvents_1