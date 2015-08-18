-- Lua Script1
-- Author: Tarcísio
-- DateCreated: 11/13/2014 2:18:36 AM
--------------------------------------------------------------
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "TarcisioCMIberianFunctions";
print("iberia loaded")
-- Trait Functions

function GetIberia()
	if iberia == nil then	
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local player = Players[iPlayer];			
			if player ~= nil and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"] then
				iberia = player
				break
			end
		end
	end
	
	return iberia
end

function tcm_IberianSculptureDecision(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"] then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_SCULPTOR_WORKSHOP"]) then
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_5"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_GOLDFROM"], 1)
				end
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_8"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_MAINTENANCE"], 1)
				end
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_9"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_MAINTENANCE"], 1)
				end
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_14"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_MAINTENANCE"], 1)
				end
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_10"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_MAINTENANCE"], 2)
				end
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_11"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_MAINTENANCE"], 2)
				end
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_12"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_MAINTENANCE"], 2)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianSculptureDecision)

function tcm_IberianToledoSteel(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"] then
		if player:HasPolicy(GameInfoTypes["POLICY_TCM_TOLEDO_STEEL"]) then
			for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
				local newOwner = Players[iPlayer]
				for unit in newOwner:Units() do	
					if unit:IsCombatUnit() and not(unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SCOUT"]) then
						if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_SOLDIER"]) and not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_GIFTED_UNIT"])) then
							unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_TOLEDO_STEEL"], true)
						end
					end	
				end
			end
			for city in player:Cities() do
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_TOLEDO_STEEL"], 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianToledoSteel)

function tcm_IberianTrade(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"] then
		local numBonus = 0
		local zimdata = Players[playerID]:GetTradeRoutesToYou();
		for i,v in ipairs(zimdata) do
			if v.FromCity:GetOwner() ~= player then
				numBonus = numBonus + 1
			end
		end
		local iberia = GetIberia()
		local capital = iberia:GetCapitalCity()
		numBonus = numBonus * 100
		if capital then
			capital:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_ARTIST"], numBonus)
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianTrade)

function tcm_IberianMercenaries(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"] then
		for unit in player:Units() do
			if unit:IsCombatUnit() and not(unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SCOUT"]) then
				if not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_SOLDIER"])) then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_SOLDIER"], true)
				end
				if player:HasPolicy(GameInfoTypes["POLICY_TCM_TOLEDO_STEEL"]) then
					if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_SOLDIER"]) and not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_GIFTED_UNIT"])) then
						unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_TOLEDO_STEEL"], true)
					end
				end
			end	
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianMercenaries)
GameEvents.UnitSetXY.Add(tcm_IberianMercenaries)

function tcm_IberianMercenariesCulture(playerID)
	local player = Players[playerID]
	if not(player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"]) then
		for unit in player:Units() do
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_SOLDIER"]) then
				local iberia = GetIberia()
				iberia:ChangeJONSCulture(1)
			end
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_TOLEDO_STEEL"]) then
				local iberia = GetIberia()
				iberia:ChangeGold(1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianMercenariesCulture)

function tcm_IberiansReturn(teamOne, teamTwo, bWar)
	if bWar then
		local iberia = GetIberia()
		local iberiaAtWar = false
		if iberia then
			if Teams[teamOne]:IsMinorCiv() or Teams[teamOne]:IsBarbarian() then return end
			if Teams[teamTwo]:IsMinorCiv() or Teams[teamTwo]:IsBarbarian() then return end
			if teamOne == iberia:GetTeam() then
				if Teams[teamOne]:GetAtWarCount() == 1 then
					iberiaAtWar = true
				end
			elseif teamTwo == iberia:GetTeam() then
				if Teams[teamTwo]:GetAtWarCount() == 1 then
					iberiaAtWar = true
				end			
			end
		end
		if iberiaAtWar == true then	
			for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
				local player = Players[iPlayer];		
				if not(player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"]) then
					local atWar = false
					if teamOne == player:GetTeam() then
						if Teams[teamOne]:GetAtWarCount() == 1 then
							atWar = true
						end
					elseif teamTwo == player:GetTeam() then
						if Teams[teamTwo]:GetAtWarCount() == 1 then
							atWar = true
						end
					end
					if atWar == true then
						-- there might be a better way to do this run only once but I HAVE NO IDEA
						if load ( player, "ActivateOnlyOnce" ) == 2 then
							save( player, "ActivateOnlyOnce", 0 ) 
						end
						if load ( player, "ActivateOnlyOnce" ) == 0 or load ( player, "ActivateOnlyOnce" ) == nil then
						-- end of bullshit
							for unit in player:Units() do
								if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_SOLDIER"]) then
									if not(player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"]) then
										local capital = iberia:GetCapitalCity()
										local pNewUnit = iberia:InitUnit(unit:GetUnitType(), capital:GetX(), capital:GetY())
										pNewUnit:Convert(unit)
									end
								end
							end
						-- continuation of bullshit
							save( player, "ActivateOnlyOnce", 1 ) 
						elseif load ( player, "ActivateOnlyOnce" ) == 1 then
							save( player, "ActivateOnlyOnce", 2 ) 
						end
						-- end
					end
				end
			end
		end
	end
end
Events.WarStateChanged.Add(tcm_IberiansReturn)

-- Oppidium Functions

function tcm_ResetIberianOppidum(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_GUERRILA"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_GUERRILA"], false)
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_ResetIberianOppidum)

function tcm_IberianOppidum(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		local unitPlot = unit:GetPlot()
		if unitPlot then
			if unitPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_TCM_CASTRO"] then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_GUERRILA"], true)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianOppidum)
GameEvents.UnitSetXY.Add(tcm_IberianOppidum)

-- Sculptor Functions

function tcm_IberianSculptor(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_SCULPTOR_WORKSHOP"]) then
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY"], 0)
			for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
				local pPlot = Map.GetPlotByIndex(plotLoop)
				if pPlot:GetOwner() == playerID then
					if pPlot:GetResourceType() == GameInfoTypes["RESOURCE_IRON"] or pPlot:GetResourceType() == GameInfoTypes["RESOURCE_SILVER"] or pPlot:GetResourceType() == GameInfoTypes["RESOURCE_GOLD"] or pPlot:GetResourceType() == GameInfoTypes["RESOURCE_STONE"] or pPlot:GetResourceType() == GameInfoTypes["RESOURCE_MARBLE"] then
						if pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_MINE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_QUARRY"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CITADEL"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_HOLY_SITE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_MANUFACTORY"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_ACADEMY"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_LANDMARK"]) then
							if pPlot:GetWorkingCity() == city then
								local numBonus = city:GetNumBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY"]) + 1
								city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY"], numBonus)
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianSculptor)

-- Hardcode Gifting
-- Simple code that gifts Iberian units only to the human player.
function tcm_IberianHardcodeGifting(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"] and not(player:IsHuman()) and player:IsAlive() then
		if not(Teams[player:GetTeam()]:IsAtWar()) then
			if load ( player, "IberianGifting" ) == nil then
				save( player, "IberianGifting", 0 ) 
			end
			if load ( player, "IberianGifting" ) == 30 then
				local shouldIgiftMuhUnit = math.random(1,100)
				if shouldIgiftMuhUnit > 80 then
					for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
						local newOwner = Players[iPlayer]
						if newOwner:IsHuman() and newOwner:IsAlive() and (Teams[player:GetTeam()]:IsHasMet(newOwner:GetTeam())) then
							for unit in player:Units() do
								local unitPlot = unit:GetPlot()
								if unit:IsCombatUnit() and not(unit:GetDomainType() == DomainTypes.DOMAIN_SEA) and unitPlot:GetOwner() == playerID then
									local capital = newOwner:GetCapitalCity()
									local pNewUnit = newOwner:InitUnit(unit:GetUnitType(), capital:GetX(), capital:GetY())
									title = Locale.ConvertTextKey("TXT_KEY_TCM_GIFTED_UNIT_NOTIFICATION_TITLE");
									descr = Locale.ConvertTextKey("TXT_KEY_TCM_GIFTED_UNIT_NOTIFICATION");
									newOwner:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title);
									pNewUnit:Convert(unit)
									save( player, "IberianGifting", 0 ) 
									return
								end
							end
						end
					end
					save( player, "IberianGifting", 0 ) 
				else
					local IberianGiftingTurns = (load ( player, "IberianGifting" )) - 10
					save( player, "IberianGifting", IberianGiftingTurns ) 
				end
			else
				local IberianGiftingTurns = (load ( player, "IberianGifting" )) + 1
				save( player, "IberianGifting", IberianGiftingTurns ) 
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_IberianHardcodeGifting)
