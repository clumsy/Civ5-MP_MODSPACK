-- Give Me Horses (cuz I'm whiny)
-- Author: John
-- DateCreated: 2/19/2014 9:06:57 PM
--------------------------------------------------------------
CanadaAlreadyHasHorses = false

function GiveMeHorses(pPlot)
	print("Getting Resource Count")
	--For each plot within 3 squares of this plot, determine what kind of resource it has, and the number.
	local x = pPlot:GetX()
	local y = pPlot:GetY()
	local HorsesFound = false
	local range = 5
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if SpecificPlot:GetResourceType(-1) ~= -1 then
					if SpecificPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_HORSE then
						HorsesFound = true
					end
				end
			end
		end
	end
	if HorsesFound == false then
		for dx = -range, range do
			for dy = -range, range do
				local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
				if CanadaAlreadyHasHorses == false then
					if SpecificPlot then
						if SpecificPlot:GetPlotType() ~= PlotTypes.PLOT_OCEAN then
							if SpecificPlot:GetResourceType(-1) == -1 then
								SpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_HORSE, 2)
								print("We gave Canada a source of Horses!")
								CanadaAlreadyHasHorses = true
							end
						end
					end
				end
			end
		end
	else
		print("Canada already has a source of Canada")
	end
end


function FindTheCanadians()
	print("Looking For Canada!")
	if Game:GetGameTurn() == 0 then
		for i, possibleCa in pairs(Players) do
			if possibleCa:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
				print("Canadians are playing this game!")
				for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
					local pPlot = Map.GetPlotByIndex(plotLoop)
					local pUnit = pPlot:GetUnit()
					if pUnit ~= nil then
						if (pUnit:GetUnitType() == GameInfoTypes.UNIT_SETTLER) and (pUnit:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA) then
							print("Canada Found!")
							GiveMeHorses(pPlot)
							break
						end
					end
				end
			end
		end
	end
end
FindTheCanadians()