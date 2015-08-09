-- RCMP Capture Script
-- Author: LastSword. Tweaked just a little bit for this mod.
-- DateCreated: 12/17/2013 7:57:48 AM
--------------------------------------------------------------
print("From Sea to Shining Sea. If you're smart.")

RCMPInt = 0;
RCMPIntHelp = 1;
RCMPPlots = {}
RCMPPlotBool = {}
RCMPPrePlayer = Game.GetActivePlayer();

Events.SequenceGameInitComplete.Add(function()
	RCMPInGame = false;
	for i, player in pairs(Players) do
		if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
			RCMPInGame = true;
			break;
		end
	end
	if RCMPInGame then
		for i = 0, Map:GetNumPlots() - 1, 1 do
			local fPlot = Map.GetPlotByIndex( i );
			if fPlot:GetOwnershipDuration() < 0 then
				RCMPInt = RCMPInt + 1;
				RCMPPlots[RCMPInt] = fPlot;
				RCMPPlotBool[fPlot] = true;
			end
		end
	end
end)

GameEvents.UnitSetXY.Add(function(player, unit, x, y)
	if Players[player]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
		local pUnit = Players[player]:GetUnitByID(unit)
		if pUnit:IsHasPromotion(GameInfo.UnitPromotions.PROMOTION_ROYALCANADIANMOUNTIES.ID) then
			if Map.GetPlot(x,y) ~= nil then
				local cPlot = Map.GetPlot(x,y);
				if not cPlot:IsWater() then
					RCMPMain(player, unit, cPlot)
				end
			end
		end
	end
end)

function RCMPMain(player, unit, cPlot)
	if cPlot:GetOwner() == -1 then
		RCMPInt = RCMPInt + 1;
		RCMPPlots[RCMPInt] = cPlot;
		RCMPPlotBool[cPlot] = true;
		cPlot:SetOwner(player);
		cPlot:SetOwnershipDuration( -4 )
	elseif cPlot:GetOwner() == player then
		if cPlot:GetOwnershipDuration() < 0 then
			cPlot:SetOwnershipDuration( -4 )
		end
	end
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	if Players[RCMPPrePlayer]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
		RCMPPlotCheck(RCMPPrePlayer)
	end
	RCMPPrePlayer = iPlayer;
end)

function RCMPPlotCheck(player)
	for i = RCMPIntHelp, RCMPInt do
		if RCMPPlotBool[RCMPPlots[i]] then
			if RCMPPlots[i]:GetOwner() == player then
				if RCMPPlots[i]:GetOwnershipDuration() < 0 then
					if RCMPPlots[i]:GetNumUnits() > 0 then
						if RCMPPlots[i]:GetUnit(0):GetOwner() == player then
							RCMPPlots[i]:SetOwnershipDuration( -4 )
						end
					end
					if RCMPPlots[i]:GetOwnershipDuration() == -1 then
						RCMPPlots[i]:SetOwner(-1);
						RCMPPlotBool[RCMPPlots[i]] = false;
						if i == RCMPIntHelp then
							RCMPIntHelp = RCMPIntHelp + 1;
						end
					end
				end
			end
		elseif i == RCMPIntHelp then
			RCMPIntHelp = RCMPIntHelp + 1;
		end
	end
end

GameEvents.PlayerCityFounded.Add(function(iPlayer, iCityX, iCityY)
	if Players[iPlayer]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
		local kplot = Map.GetPlot(iCityX, iCityY);
		RCMPCityCheck(kplot, iPlayer)
	end
end)

function RCMPCityCheck(kplot, iPlayer)
	if kplot:GetOwnershipDuration() < 0 then
		if kplot:GetOwner() == iPlayer then
			RCMPPlotBool[kplot] = false;
			kplot:SetOwnershipDuration( 0 );
		end
	end
	for i = 0, 5 do
		local iPlot = Map.PlotDirection(kplot:GetX(), kplot:GetY(), i);
		if iPlot ~= nil then
			if iPlot:GetOwnershipDuration() < 0 then
				if iPlot:GetOwner() == iPlayer then
					RCMPPlotBool[iPlot] = false;
					iPlot:SetOwnershipDuration( 0 );
				end
			end
		end
	end
end