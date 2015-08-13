--Tomatekh
print("Kongo Lua Scripts")

local RAFFIA = GameInfoTypes.BUILDING_KONGO_MOD_RAFFIA_MILL
local JUNGLE = GameInfoTypes.FEATURE_JUNGLE

local iTechCurrency = GameInfo.Technologies["TECH_CURRENCY"].ID
local iTechGuilds = GameInfo.Technologies["TECH_GUILDS"].ID
local iTechBanking = GameInfo.Technologies["TECH_BANKING"].ID
local iTechEconomics = GameInfo.Technologies["TECH_ECONOMICS"].ID
local iTechSteam = GameInfo.Technologies["TECH_STEAM_POWER"].ID
local iTechCivil = GameInfo.Technologies["TECH_CIVIL_SERVICE"].ID

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

--Raffia Mill
GameEvents.CityCanConstruct.Add(function(iPlayer, iCity, iBuilding) 
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity);
	local pCityPlot = pCity:Plot()
	if (pPlayer:IsAlive()) then
		if (iBuilding == RAFFIA) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KONGO_MOD) then
				if (pPlayer:IsHuman()) then
					local CongoJungleA = 0;
					for loop, direction in ipairs(directions) do
						local jPlot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), direction);
						if jPlot:GetFeatureType() == JUNGLE then
							CongoJungleA = 1;
							break
						end
					end
					if CongoJungleA >= 1 then
						return true
					else
						return false
					end
				elseif not (pPlayer:IsHuman()) then
					return false
				end
			else
				return false
			end
		end
	end
	return true
end)

--No Jungle
local RaffiaID = GameInfo.Buildings["BUILDING_KONGO_MOD_RAFFIA_MILL"].ID

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KONGO_MOD) then
			for pCity in pPlayer:Cities() do
				local cPlot = pCity:Plot();
				if (pCity:GetNumBuilding(RAFFIA) > 0) then
					local CongoJungleC = 0;
					for loop, direction in ipairs(directions) do
						local jPlot = Map.PlotDirection(cPlot:GetX(), cPlot:GetY(), direction);
						if jPlot:GetFeatureType() == JUNGLE then
							CongoJungleC = 1;
							break
						end
					end
					if CongoJungleC <= 0 then
						pCity:SetNumRealBuilding(RAFFIA, 0);
						local title = "Deforestation";
						local descr = "The city of " .. Locale.ConvertTextKey(pCity:GetName()) .. " can no longer support its Raffia Mill!";
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, pCity:GetX(), pCity:GetY(), RaffiaID, -1);
					end
				end
			end
		end
	end
end)

--Capture Changes
local bRaffiaMill = GameInfoTypes.BUILDING_KONGO_MOD_RAFFIA_MILL;
local bMint = GameInfoTypes.BUILDING_MINT;

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local kPlot = Map.GetPlot(iX, iY);
	local kCity = kPlot:GetPlotCity();
	local nPlayer = Players[iNewOwner];
	local iPreviousOwner = kCity:GetPreviousOwner();
	local lPlayer = Players[iPreviousOwner];
	if (nPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KONGO_MOD) then
		if kCity:IsHasBuilding(bRaffiaMill) then
			kCity:SetNumRealBuilding(bRaffiaMill, 0);
		end
		if kCity:IsHasBuilding(bMint) then
			kCity:SetNumRealBuilding(bMint, 0);
		end
	end
	if (lPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KONGO_MOD) then
		if kCity:IsHasBuilding(bMint) then
			kCity:SetNumRealBuilding(bMint, 0);
		end
	end
end)

--AI gets free Raffia to trade
local rRaffia = GameInfoTypes.RESOURCE_RAFIA;
local rHorse = GameInfoTypes.RESOURCE_HORSE;

function KongoAIRaffia(iTeam)
	local gPlayer = 0;
	local pTeam = 0;
	for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local pPlayer = Players[iPlayer]
		if (pPlayer:IsAlive()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KONGO_MOD) then
				gPlayer = pPlayer;
				pTeam = pPlayer:GetTeam();
			end
		end
	end
	if pTeam == iTeam then
		if not (gPlayer:IsHuman()) then
			gPlayer:ChangeNumResourceTotal(rRaffia, 1)
		end
	end
end

function KongoAIHorse(iTeam)
	local gPlayer = 0;
	local pTeam = 0;
	for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local pPlayer = Players[iPlayer]
		if (pPlayer:IsAlive()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KONGO_MOD) then
				gPlayer = pPlayer;
				pTeam = pPlayer:GetTeam();
			end
		end
	end
	if pTeam == iTeam then
		if not (gPlayer:IsHuman()) then
			gPlayer:ChangeNumResourceTotal(rHorse, 2)
		end
	end
end

GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 

	if (iTech == iTechCurrency) then
		KongoAIRaffia(iTeam)
		KongoAIRaffia(iTeam)
	elseif (iTech == iTechGuilds) then
		KongoAIRaffia(iTeam)
	elseif (iTech == iTechBanking) then
		KongoAIRaffia(iTeam)
	elseif (iTech == iTechEconomics) then
		KongoAIRaffia(iTeam)
	elseif (iTech == iTechCivil) then
		KongoAIHorse(iTeam)
	end

end)