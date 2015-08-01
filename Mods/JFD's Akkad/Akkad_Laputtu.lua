-- Akkad_Laputtu
-- Author: Tomatekh
-- DateCreated: 6/22/2015 6:11:46 PM
--------------------------------------------------------------
print ("Laputtu Workrate Bonus")

local Laputtu = GameInfoTypes.UNIT_LITE_AKKAD_LAPUTTU;
local Pyramids = GameInfoTypes.BUILDINGCLASS_PYRAMID;

function AkkadOverseer(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitType() == Laputtu) then
				if not pUnit:IsEmbarked() then 
					local uPlot = pUnit:GetPlot();
					local WorkBonus = 100;
					if pPlayer:GetBuildingClassCount(Pyramids) >= 1 then
						WorkBonus = 125;
					end
					for pBuildInfo in GameInfo.Builds() do
						local BuildTurns = uPlot:GetBuildTurnsLeft(pBuildInfo.ID, 0, 0);
						local BuildProgress = uPlot:GetBuildProgress(pBuildInfo.ID)
						if (BuildTurns >= 2) and (BuildProgress > WorkBonus) then
							uPlot:ChangeBuildProgress(pBuildInfo.ID, WorkBonus, pTeam)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(AkkadOverseer)