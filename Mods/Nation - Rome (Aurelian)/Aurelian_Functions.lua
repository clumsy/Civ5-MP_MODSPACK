local gSaveData	= Modding.OpenSaveData();

function tcm_aurelianTrait(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"] then 
		if bIsCapital == true then
			local oldcapital = player:GetCapitalCity()
			oldcapital:SetWeLoveTheKingDayCounter(20)
			for unit in player:Units() do
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_RESTORER_BONUS"], true)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(tcm_aurelianTrait)

function tcm_AurelianReset(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"] and player:IsEverAlive() then
		if Teams[player:GetTeam()]:GetAtWarCount(true) == 0 then
			for unit in player:Units() do
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_RESTORER_BONUS"], false)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_AurelianReset)

function tcm_TemplumSolisPantheon(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"] and player:IsEverAlive() then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TEMPLUM_SOLIS"]) then 
				if not(city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_AURELIANDUMMY_TEMPLUMBUILT"])) then 
					if not(city:IsHolyCityAnyReligion()) then
						city:AdoptReligionFully(GameInfoTypes["RELIGION_PANTHEON"])
					end
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_AURELIANDUMMY_TEMPLUMBUILT"], 1)
				end
				if city:IsCapital() then
					local numBonuses = 0
					for otherCity in player:Cities() do
						if otherCity:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] and not(otherCity:IsCapital()) then
							numBonuses = numBonuses + 1
						end
					end
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_AURELIANDUMMY"], numBonuses)
				end
				local capital = player:GetCapitalCity()
				if capital:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
					for religion in GameInfo.Religions() do
						if city:IsReligionInCity(religion.ID) and not(city:IsHolyCityForReligion(religion.ID)) then
							city:ConvertPercentFollowers(GameInfoTypes["RELIGION_PANTHEON"], religion.ID, 25)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_TemplumSolisPantheon)

function tcm_CleanDalmatian(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_DALMATIAN_CAVALRY"] then	
			SaveDalmatian(unit:GetID(), 0) 
			unit:SetMoves(unit:GetMoves())
			local unitPlot = unit:GetPlot()
			if unitPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CITADEL"] or unitPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_FORT"] then	
			else
				unit:SetBaseCombatStrength(13)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_CleanDalmatian)

function tcm_DalmatianBonuses(playerID)
	local player = Players[playerID]
	local teamID = player:GetTeam();
	local pTeam = Teams[teamID];
	for unit in player:Units() do
		if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_DALMATIAN_CAVALRY"] then	
			local unitPlot = unit:GetPlot()
			for greatgeneral in player:Units() do
				if greatgeneral:GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_GENERAL"] then	
					local generalPlot = greatgeneral:GetPlot()
					if Map.PlotDistance(unit:GetX(), unit:GetY(), generalPlot:GetX(), generalPlot:GetY()) <= 1 then		
						if not(GetDalmatian(unit:GetID()) == 1) then
							unit:SetMoves(unit:GetMoves() + 1)
						end
						SaveDalmatian(unit:GetID(), 1) 
					end
				end
			end
			if unitPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CITADEL"] or unitPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_FORT"] then
				-- From Leugi Cuban Civilization
				local WGLevel2Prereq = GameInfo.Technologies["TECH_IRON_WORKING"].ID
				local WGLevelPikePrereq = GameInfo.Technologies["TECH_CIVIL_SERVICE"].ID
				local WGLevel3Prereq = GameInfo.Technologies["TECH_STEEL"].ID
				local WGLevel4Prereq = GameInfo.Technologies["TECH_GUNPOWDER"].ID
				local WGLevel5Prereq = GameInfo.Technologies["TECH_RIFLING"].ID
				local WGLevel6Prereq = GameInfo.Technologies["TECH_REPLACEABLE_PARTS"].ID
				local WGLevel7Prereq = GameInfo.Technologies["TECH_PLASTIC"].ID
				local WGLevel8Prereq = GameInfo.Technologies["TECH_MOBILE_TACTICS"].ID
				local WGLevel9Prereq = GameInfo.Technologies["TECH_NANOTECHNOLOGY"].ID
				local strengthValue = 13
				if (pTeam:IsHasTech(WGLevel2Prereq)) then
					strengthValue = 14
				end
				if (pTeam:IsHasTech(WGLevelPikePrereq)) then
					strengthValue = 16
				end
				if (pTeam:IsHasTech(WGLevel3Prereq)) then
					strengthValue = 21
				end
				if (pTeam:IsHasTech(WGLevel4Prereq)) then
					strengthValue = 24
				end
				if (pTeam:IsHasTech(WGLevel5Prereq)) then
					strengthValue = 34
				end
				if (pTeam:IsHasTech(WGLevel6Prereq)) then
					strengthValue = 50
				end
				if (pTeam:IsHasTech(WGLevel7Prereq)) then
					strengthValue = 70
				end
				if (pTeam:IsHasTech(WGLevel8Prereq)) then
					strengthValue = 90
				end
				if (pTeam:IsHasTech(WGLevel9Prereq)) then
					strengthValue = 100
				end
				unit:SetBaseCombatStrength(strengthValue)
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_DALMATIAN_BONUS"], true)
			else
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_DALMATIAN_BONUS"], false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(tcm_DalmatianBonuses)
GameEvents.PlayerDoTurn.Add(tcm_DalmatianBonuses)

--------------------------------------------------------------
function SaveDalmatian(unit, gotBonus)
	SetPersistentProperty(string.format("Unit%iDalmatianBonus", unit), gotBonus)
end
--------------------------------------------------------------
function GetDalmatian(unit)
	return GetPersistentProperty(string.format("Unit%iDalmatianBonus", unit)) or 0
end
--------------------------------------------------------------
function GetPersistentProperty(name)
	if(g_Properties == nil) then
		g_Properties = {};
	end
	
	if(g_Properties[name] == nil) then
		g_Properties[name] = gSaveData.GetValue(name);
	end
	
	return g_Properties[name];
end
--------------------------------------------------------------
function SetPersistentProperty(name, value)
	if(g_Properties == nil) then
		g_Properties = {};
	end
	
	gSaveData.SetValue(name, value);
	g_Properties[name] = value;
end