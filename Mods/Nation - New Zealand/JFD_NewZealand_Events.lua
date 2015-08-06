-- JFD_NewZealand_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's New Zealand Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCommunityPatchDLL
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsCommunityPatchDLL()
	local communityPatchDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	local isUsingCPDLL = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == communityPatchDLLID) then
			isUsingCPDLL = true
			break
		end
	end

	return isUsingCPDLL
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_NEW_ZEALAND"]
local isUsingCPDLL		= JFD_IsCommunityPatchDLL()
local eraRenaissanceID  = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil 			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- New Zealand: World Heritage Site
--------------------------------------------------------------------------------------------------------------------------
local buildingWorldHeritageSiteCultureID = GameInfoTypes["BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE"]
local buildingWorldHeritageSiteGoldID	 = GameInfoTypes["BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD"]
local city							 
local plotMountainID					 = GameInfoTypes["PLOT_MOUNTAIN"]

local Event_JFDNewZealandWorldHeritageSite = {}
	Event_JFDNewZealandWorldHeritageSite.Name = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE"
	Event_JFDNewZealandWorldHeritageSite.Desc = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_DESC"
	Event_JFDNewZealandWorldHeritageSite.Weight = 10
	Event_JFDNewZealandWorldHeritageSite.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			if (not player:GetCapitalCity())				  then return false end
			if player:GetCurrentEra() < eraRenaissanceID	  then return false end

			local cities = {}
			local count = 1
			for city in player:Cities() do
				if ((not city:IsHasBuilding(buildingWorldHeritageSiteCultureID)) and (not city:IsHasBuilding(buildingWorldHeritageSiteGoldID))) then
					if isUsingCPDLL then
						if city:IsWithinDistanceOfPlotType(plotMountainID, 2) then
							cities[count] = city:GetID()
							count = count + 1
						elseif city:Plot():IsFeatureRiver() then
							cities[count] = city:GetID()
							count = count + 1
						end
					else
						local cityPlot = city:Plot()
						for loopPlot in PlotAreaSpiralIterator(cityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
							if loopPlot:IsMountain() or loopPlot:IsRiver() then
								cities[count] = city:GetID()
								count = count + 1
								break
							end
						end 
					end
				end
			end	
			
			local cityID = cities[JFD_GetRandom(1,#cities)]
			if (not cityID) then return false end
			city = player:GetCityByID(cityID)
			Event_JFDNewZealandWorldHeritageSite.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_DESC", city:GetName())
			return true
		end
		)
	Event_JFDNewZealandWorldHeritageSite.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDNewZealandWorldHeritageSite.Outcomes[1] = {}
	Event_JFDNewZealandWorldHeritageSite.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_1"
	Event_JFDNewZealandWorldHeritageSite.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_RESULT_1"
	Event_JFDNewZealandWorldHeritageSite.Outcomes[1].Weight = 5
	Event_JFDNewZealandWorldHeritageSite.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFDNewZealandWorldHeritageSite.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_RESULT_1", city:GetName())
			return true
		end
		)
	Event_JFDNewZealandWorldHeritageSite.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			city:SetNumRealBuilding(buildingWorldHeritageSiteGoldID, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE", city:GetName()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDNewZealandWorldHeritageSite.Outcomes[2] = {}
	Event_JFDNewZealandWorldHeritageSite.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_2"
	Event_JFDNewZealandWorldHeritageSite.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_RESULT_2"
	Event_JFDNewZealandWorldHeritageSite.Outcomes[2].Weight = 5
	Event_JFDNewZealandWorldHeritageSite.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFDNewZealandWorldHeritageSite.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_RESULT_2", city:GetName())
			return true
		end
		)
	Event_JFDNewZealandWorldHeritageSite.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			city:SetNumRealBuilding(buildingWorldHeritageSiteCultureID, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NEW_ZEALAND_WORLD_HERITAGE_SITE", city:GetName()))
		end)
Events_AddCivilisationSpecific(civilisationID, "Event_JFDNewZealandWorldHeritageSite", Event_JFDNewZealandWorldHeritageSite)
--------------------------------------------------------------------------------------------------------------------------
--  New Zealand: Naval Invasion
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDNewZealandNavalInvasion = {}
	Event_JFDNewZealandNavalInvasion.Name = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION"
	Event_JFDNewZealandNavalInvasion.Desc = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_DESC"
	Event_JFDNewZealandNavalInvasion.Weight = 10
	Event_JFDNewZealandNavalInvasion.CanFunc = (
		function(player)			
			if load(player, "Event_JFDNewZealandNavalInvasion") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if player:GetCurrentEra() < eraRenaissanceID 				then return false end
			local playerTeam = Teams[player:GetTeam()]
			
			local goldCost = mathCeil(1000 * iMod)
			if player:GetGold() < goldCost then return false end

			local alliedCivs = {}
			local alliedCivsCount = 1
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
					local otherTeamID = otherPlayer:GetTeam()
					if (playerTeam:IsHasMet(otherTeamID) and playerTeam:IsDefensivePact(otherTeamID) and (not playerTeam:IsAtWar(otherTeamID))) then
						alliedCivs[alliedCivsCount] = otherPlayerID
					end
				end
			end
			local civ1ID = alliedCivs[JFD_GetRandom(1,#alliedCivs)]
			if (not civ1ID) then return false end
			local civ1Player = Players[civ1ID]
			local civ1Description = civ1Player:GetCivilizationDescription()
			local civ1ShortDescription = civ1Player:GetCivilizationShortDescription()
			
			local neutralCivs = {}
			local neutralCivsCount = 1
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayerID ~= playerID and otherPlayerID ~= civ1ID) then
					local otherTeamID = otherPlayer:GetTeam()
					if (playerTeam:IsHasMet(otherTeamID) and (not playerTeam:IsAtWar(otherTeamID)) and (not Teams[civ1Player:GetTeam()]:IsAtWar(otherTeamID))) then
						neutralCivs[neutralCivsCount] = otherPlayerID
					end
				end
			end
			local civ2ID = neutralCivs[JFD_GetRandom(1,#neutralCivs)]
			if (not civ2ID) then return false end
			local civ2Description = Players[civ2ID]:GetCivilizationDescription()
			local civ2ShortDescription = Players[civ2ID]:GetCivilizationShortDescription()
			
			Event_JFDNewZealandNavalInvasion.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_DESC", civ1Description, civ2Description, civ1ShortDescription, civ2ShortDescription)			
			return true
		end
		)
	Event_JFDNewZealandNavalInvasion.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDNewZealandNavalInvasion.Outcomes[1] = {}
	Event_JFDNewZealandNavalInvasion.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_1"
	Event_JFDNewZealandNavalInvasion.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_RESULT_1"
	Event_JFDNewZealandNavalInvasion.Outcomes[1].Weight = 5
	Event_JFDNewZealandNavalInvasion.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil((50 * player:GetCurrentEra()) * iMod)
			local numCoastalCities = 1
			for city in player:Cities() do
				if city:IsCoastal() then
					numCoastalCities = numCoastalCities + 1
				end
			end
			goldCost = goldCost * numCoastalCities
			
			if player:GetGold() < goldCost then return false end
			local navalUnitToSpawnID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED")
			local navalUnitToSpawnClass = GameInfo.Units[navalUnitToSpawnID].Class
			local navalUnitToSpawnType = GameInfoTypes[JFD_GetUniqueUnit(player, navalUnitToSpawnClass)]
			local navalUnitToSpawnName = GameInfo.Units[navalUnitToSpawnID].Description
			Event_JFDNewZealandNavalInvasion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_RESULT_1", goldCost, navalUnitToSpawnName)
			return true
		end
		)
	Event_JFDNewZealandNavalInvasion.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil((50 * player:GetCurrentEra()) * iMod)
			local navalUnitToSpawnID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED")
			local navalUnitToSpawnClass = GameInfo.Units[navalUnitToSpawnID].Class
			local navalUnitToSpawnType = GameInfoTypes[JFD_GetUniqueUnit(player, navalUnitToSpawnClass)]
			local numCoastalCities = 0
			for city in player:Cities() do
				if city:IsCoastal() then
					numCoastalCities = numCoastalCities + 1
					player:InitUnit(navalUnitToSpawnType, city:GetX(), city:GetY())
				end
			end
			goldCost = goldCost * numCoastalCities
			player:ChangeGold(-goldCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDNewZealandNavalInvasion.Outcomes[2] = {}
	Event_JFDNewZealandNavalInvasion.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_2"
	Event_JFDNewZealandNavalInvasion.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_RESULT_2"
	Event_JFDNewZealandNavalInvasion.Outcomes[2].Weight = 2
	Event_JFDNewZealandNavalInvasion.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFDNewZealandNavalInvasion.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDNewZealandNavalInvasion.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NEW_ZEALAND_NAVAL_INVASION"))
		end)	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDNewZealandNavalInvasion", Event_JFDNewZealandNavalInvasion)	
--=======================================================================================================================
--=======================================================================================================================


