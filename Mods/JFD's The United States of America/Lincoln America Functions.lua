-- Lincoln America Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- GetRandom
--------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
include( "IconSupport" )
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockMonitor
----------------------------------------------------------------------------------------------------------------------------	
function JFD_BlockMonitor(playerID, unitID)
	local player = Players[playerID]
	if not Teams[player:GetTeam()]:GetTeamTechs():HasTech(GameInfoTypes["TECH_STEAM_POWER"]) and unitID == GameInfoTypes["UNIT_JFD_MONITOR_RANGED"] then 
		return
	end
	
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockMonitor)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_LincolnCapitalism
----------------------------------------------------------------------------------------------------------------------------	
local goldBuildings = {
	GameInfoTypes["BUILDING_HARBOR"],
	GameInfoTypes["BUILDING_SEAPORT"],
	GameInfoTypes["BUILDING_MARKET"],
	GameInfoTypes["BUILDING_MINT"],
	GameInfoTypes["BUILDING_BANK"],
	GameInfoTypes["BUILDING_STOCK_EXCHANGE"],
	GameInfoTypes["BUILDING_CARAVANSARY"]
	}
	
function JFD_GetPrereqTech(buildingID)
	local prereqTech = GameInfo.Buildings[buildingID].PrereqTech
	
	return prereqTech
end

function JFD_GetResourceInBorders(city, resourceType)
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot(cityPlot)
		if plot then
			if plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_MINE"] and plot:GetResourceType() == GameInfoTypes[resourceType] then
				return true
			end
		end
	end
end

function JFD_AddGoldBuilding(playerID, city, buildingType, description, production)
	if city:GetBuildingProductionTurnsLeft(GameInfoTypes[buildingType]) == 1 and not city:IsHasBuilding(GameInfoTypes[buildingType]) then
		local capitalistType
		if Players[playerID]:GetCurrentEra() >= GameInfoTypes["ERA_INDUSTRIAL"] then
			capitalistType = "Investors"
		else
			capitalistType = "Merchants"
		end
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_CAPITALIST_BUILDING_SHORT", description, city:GetName())
		local description = Locale.ConvertTextKey("TXT_KEY_JFD_CAPITALIST_BUILDING", capitalistType, description, city:GetName())
		
		city:SetNumRealBuilding(GameInfoTypes[buildingType], 1)
		if Players[playerID]:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
		end
	else
		city:ChangeBuildingProduction(GameInfoTypes[buildingType], production)
	end
end	
	
function JFD_LincolnCapitalism(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"] and player:IsAlive() then
		for city in player:Cities() do
			local currentProductionYield = city:GetBaseYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) 
			local currentProductionModifiers = city:GetBuildingProductionModifier()
			local trueProduction
			if currentProductionModifiers > 0 then
				trueProduction = currentProductionYield * currentProductionModifier / 100
			else
				trueProduction = currentProductionYield
			end
			
			local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
					
			if teamTechs:HasTech(GameInfoTypes[JFD_GetPrereqTech(GameInfoTypes["BUILDING_CARAVANSARY"])]) then 
				JFD_AddGoldBuilding(playerID, city, "BUILDING_CARAVANSARY", "Caravansary", trueProduction)
			end

			if teamTechs:HasTech(GameInfoTypes[JFD_GetPrereqTech(GameInfoTypes["BUILDING_MARKET"])]) then 
				JFD_AddGoldBuilding(playerID, city, "BUILDING_MARKET", "Market", trueProduction)
			end
			
			if teamTechs:HasTech(GameInfoTypes[JFD_GetPrereqTech(GameInfoTypes["BUILDING_BANK"])]) and city:IsHasBuilding(GameInfoTypes["BUILDING_MARKET"]) then 
				JFD_AddGoldBuilding(playerID, city, "BUILDING_BANK", "Bank", trueProduction)
			end
			
			if teamTechs:HasTech(GameInfoTypes[JFD_GetPrereqTech(GameInfoTypes["BUILDING_STOCK_EXCHANGE"])]) and city:IsHasBuilding(GameInfoTypes["BUILDING_BANK"]) then 
				JFD_AddGoldBuilding(playerID, city, "BUILDING_STOCK_EXCHANGE", "Stock Exchange", trueProduction)
			end

			if teamTechs:HasTech(GameInfoTypes[JFD_GetPrereqTech(GameInfoTypes["BUILDING_HARBOR"])]) and city:IsCoastal() then 
				JFD_AddGoldBuilding(playerID, city, "BUILDING_HARBOR", "Harbor", trueProduction)
			end
			
			if teamTechs:HasTech(GameInfoTypes[JFD_GetPrereqTech(GameInfoTypes["BUILDING_SEAPORT"])]) and city:IsCoastal() and city:IsHasBuilding(GameInfoTypes["BUILDING_HARBOR"]) then 
				JFD_AddGoldBuilding(playerID, city, "BUILDING_SEAPORT", "Seaport", trueProduction)
			end
			
			if teamTechs:HasTech(GameInfoTypes[JFD_GetPrereqTech(GameInfoTypes["BUILDING_MINT"])]) and city:IsHasResourceLocal(GameInfoTypes["RESOURCE_GOLD"]) or city:IsHasResourceLocal(GameInfoTypes["RESOURCE_SILVER"]) then
				JFD_AddGoldBuilding(playerID, city, "BUILDING_MINT", "Mint", trueProduction)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_LincolnCapitalism)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ParrottRifleDefense
----------------------------------------------------------------------------------------------------------------------------	
local direction_types = {
	DirectionTypes["DIRECTION_NORTHEAST"],
	DirectionTypes["DIRECTION_NORTHWEST"],
	DirectionTypes["DIRECTION_EAST"],
	DirectionTypes["DIRECTION_SOUTHEAST"],
	DirectionTypes["DIRECTION_SOUTHWEST"],
	DirectionTypes["DIRECTION_WEST"]
	}

function JFD_ParrottRifleDefense(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"] and player:IsAlive() then
		local unit = player:GetUnitByID(unitID)
		local adjacentToParrottRifle = false
		if Map.GetPlot(unitX, unitY) then
			for loop, direction in ipairs(direction_types) do
				local adjPlot = Map.PlotDirection(unitX, unitY, direction)
				if adjPlot then
					if adjPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_FORT"] or adjPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CITADEL"] then
						if adjPlot:GetUnit() then
							if adjPlot:GetUnit():IsHasPromotion(GameInfoTypes["PROMOTION_JFD_PARROTT_RIFLE"]) then
								adjacentToParrottRifle = true
							end
						end
					end
				end
			end
		end
		
		if adjacentToParrottRifle then
			if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_PARROTT_DEFENSE"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_PARROTT_DEFENSE"], true)
			end
		else
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_PARROTT_DEFENSE"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_PARROTT_DEFENSE"], false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_ParrottRifleDefense)
----------------------------------------------------------------------------------------------------------------------------
--JFD_LincolnOration
----------------------------------------------------------------------------------------------------------------------------
lincoln = nil

local otherCiv
local lincolnSpeeches = {
	GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_ONE"],
	GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_TWO"],
	GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_THREE"],
	GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_FOUR"],
	GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_FIVE"],
	GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_SIX"]
	}
	
function JFD_AISpeech(num)
	if num == 1 then
		JFD_LincolnSpeechOne()
	elseif num == 2 then
		JFD_LincolnSpeechTwo()
	elseif num == 3 then
		JFD_LincolnSpeechThree()
	elseif num == 4 then
		JFD_LincolnSpeechFour()
	elseif num == 5 then
		JFD_LincolnSpeechFive()
	end
end

function JFD_GetLincoln()
	if lincoln == nil then	
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local player = Players[iPlayer]			
			if player ~= nil and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"] then
				lincoln = player
				break
			end
		end
	end
	
	return lincoln
end

warTable = {}

function JFD_LincolnOration(teamOne, teamTwo, war)
	local lincoln = JFD_GetLincoln()
	if lincoln then
		if not war then
			for _, policyID in pairs(lincolnSpeeches) do
				if lincoln:HasPolicy(policyID) then
					lincoln:SetHasPolicy(policyID, false)
				end	
			end	
		
			return
		end
	
		if (warTable[teamOne] ~= nil) then
			warTable[teamOne] = nil
		else
			warTable[teamTwo] = teamOne
	
			for attackingPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do			
				for defendingPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
					attackingPlayer = Players[attackingPlayerID]
					defendingPlayer = Players[defendingPlayerID]
					if attackingPlayer:IsAlive() and not attackingPlayer:IsMinorCiv() and defendingPlayer:IsAlive() and not defendingPlayer:IsMinorCiv() then
						if attackingPlayer:GetTeam() == teamOne and defendingPlayer:GetTeam() == teamTwo then
							print(attackingPlayer:GetCivilizationShortDescription() .. " declared war on " .. defendingPlayer:GetCivilizationShortDescription())
							if defendingPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"] and Teams[defendingPlayer:GetTeam()]:GetAtWarCount() == 1 then 
								otherCiv = attackingPlayer
								if lincoln:IsHuman() then
									JFD_ShowLincolnSpeechesPopup()
								else
									local random = GetRandom(1, 5)
									JFD_AISpeech(random)
								end
							elseif attackingPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"] and Teams[attackingPlayer:GetTeam()]:GetAtWarCount() == 1 then 
								otherCiv = defendingPlayer
								if lincoln:IsHuman() then
									JFD_ShowLincolnSpeechesPopup()
								else
									local random = GetRandom(1, 5)
									JFD_AISpeech(random)
								end
							end
						end
					end
				end	
			end
		end
	end
end
Events.WarStateChanged.Add(JFD_LincolnOration)

function JFD_RemoveRedundantEffects(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_AMERICA_LINCOLN"] and player:IsAlive() then
		if not player:HasPolicy(GameInfoTypes["POLICY_JFD_LINCOLN_SPEECH_ONE"]) then
			for unit in player:Units() do
				if unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_LINCOLN_SPEECH_ONE"]) then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_LINCOLN_SPEECH_ONE"], false)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_RemoveRedundantEffects)

function JFD_AddPolicy(player, policyType)
	player:SetNumFreePolicies(1)
	player:SetNumFreePolicies(0)
	player:SetHasPolicy(GameInfoTypes[policyType], true)
end

function JFD_LincolnSpeechOne()
	local lincoln = JFD_GetLincoln()
	JFD_AddPolicy(lincoln, "POLICY_JFD_LINCOLN_SPEECH_ONE")
	if lincoln:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_ONE', otherCiv:GetCivilizationShortDescription())
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SHORT")
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end
	
	if popupOpen then
		JFD_HideLincolnSpeechesPopup()
	end
end
Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeechOne)

function JFD_LincolnSpeechTwo()
	local lincoln = JFD_GetLincoln()
	JFD_AddPolicy(lincoln, "POLICY_JFD_LINCOLN_SPEECH_TWO")
	if lincoln:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_TWO', otherCiv:GetCivilizationShortDescription())
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SHORT")
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end
	
	if popupOpen then
		JFD_HideLincolnSpeechesPopup()
	end
end
Controls.Button2:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeechTwo)

function JFD_LincolnSpeechThree()
	local lincoln = JFD_GetLincoln()
	JFD_AddPolicy(lincoln, "POLICY_JFD_LINCOLN_SPEECH_THREE")
	if lincoln:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_THREE', otherCiv:GetCivilizationShortDescription())
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SHORT")
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end
	
	if popupOpen then
		JFD_HideLincolnSpeechesPopup()
	end
end
Controls.Button3:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeechThree)

function JFD_LincolnSpeechFour()
	local lincoln = JFD_GetLincoln()
	JFD_AddPolicy(lincoln, "POLICY_JFD_LINCOLN_SPEECH_FOUR")
	if lincoln:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_FOUR', otherCiv:GetCivilizationShortDescription())
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SHORT")
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end
	
	if popupOpen then
		JFD_HideLincolnSpeechesPopup()
	end
end
Controls.Button4:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeechFour)

function JFD_LincolnSpeechFive()
	local lincoln = JFD_GetLincoln()
	JFD_AddPolicy(lincoln, "POLICY_JFD_LINCOLN_SPEECH_FIVE")
	if lincoln:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_FIVE', otherCiv:GetCivilizationShortDescription())
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SHORT")
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end
	
	if popupOpen then
		JFD_HideLincolnSpeechesPopup()
	end
end
Controls.Button5:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeechFive)

function JFD_LincolnSpeechSix()
	local lincoln = JFD_GetLincoln()
	JFD_AddPolicy(lincoln, "POLICY_JFD_LINCOLN_SPEECH_SIX")
	if lincoln:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SIX', otherCiv:GetCivilizationShortDescription())
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_LINCOLN_SPEECH_NOTIFICATION_SHORT")
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end
	
	if popupOpen then
		JFD_HideLincolnSpeechesPopup()
	end
end
Controls.Button6:RegisterCallback(Mouse.eLClick, JFD_LincolnSpeechSix)

function JFD_ShowLincolnSpeechesPopup()
	CivIconHookup( Game.GetActivePlayer(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	Controls.Summary:LocalizeAndSetText("TXT_KEY_JFD_LINCOLN_SPEECHES_MESSAGE", otherCiv:GetCivilizationDescription())
	Controls.ButtonStack:CalculateSize();
	Controls.JFDLincolnSpeechesUI:DoAutoSize();
	Controls.JFDLincolnSpeechesUIBG:SetHide(false)
	Controls.JFDLincolnSpeechesUI:SetHide(false)
	popupOpen = true
end

function JFD_HideLincolnSpeechesPopup()
	Controls.JFDLincolnSpeechesUIBG:SetHide(true)
	Controls.JFDLincolnSpeechesUI:SetHide(true)
end
--==========================================================================================================================
--==========================================================================================================================