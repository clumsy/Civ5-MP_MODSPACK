-- BattleGeneral
-- Author: Leugi
-- DateCreated: 7/31/2013 4:10:03 PM
--------------------------------------------------------------
print("The Battle General Lua loaded succesfully")


local BGeneralPromotion = GameInfo.UnitPromotions["PROMOTION_BATTLE_GENERAL_0"].ID
local BGLevel1 = GameInfo.UnitPromotions["PROMOTION_BATTLE_GENERAL_1"].ID
local BGLevel2 = GameInfo.UnitPromotions["PROMOTION_BATTLE_GENERAL_2"].ID
local BGLevel3 = GameInfo.UnitPromotions["PROMOTION_BATTLE_GENERAL_3"].ID
local BGLevel4 = GameInfo.UnitPromotions["PROMOTION_BATTLE_GENERAL_4"].ID

local BGLevel1Prereq = GameInfo.Technologies["TECH_HORSEBACK_RIDING"].ID
local BGLevel2Prereq = GameInfo.Technologies["TECH_CHIVALRY"].ID
local BGLevel3Prereq = GameInfo.Technologies["TECH_METALLURGY"].ID
local BGLevel4Prereq = GameInfo.Technologies["TECH_MILITARY_SCIENCE"].ID

local BGLevel1Combat = 13
local BGLevel2Combat = 21
local BGLevel3Combat = 26
local BGLevel4Combat = 35


function BattleGeneral(iPlayer)
	for _, pPlayer in pairs(Players) do
	local teamID = pPlayer:GetTeam();
	local pTeam = Teams[teamID];
	if (pPlayer:IsAlive()) then
			if (pTeam:IsHasTech(BGLevel1Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BGeneralPromotion)) then
						bgunit:SetHasPromotion(BGLevel1, true);
						bgunit:SetBaseCombatStrength(BGLevel1Combat)
						print ("A Battle General Level 1 is here!");
						
					end
				end
			end
			if (pTeam:IsHasTech(BGLevel2Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BGeneralPromotion)) then
						bgunit:SetHasPromotion(BGLevel1, false);
						bgunit:SetHasPromotion(BGLevel2, true);
						bgunit:SetBaseCombatStrength(BGLevel2Combat)
						print ("A Battle General Level 2 is here!");
					end
				end
			end
			if (pTeam:IsHasTech(BGLevel3Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BGeneralPromotion)) then
						bgunit:SetHasPromotion(BGLevel2, false);
						bgunit:SetHasPromotion(BGLevel3, true);
						bgunit:SetBaseCombatStrength(BGLevel3Combat)
						print ("A Battle General Level 3 is here!");
					end
				end
			end
			if (pTeam:IsHasTech(BGLevel4Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BGeneralPromotion)) then
						bgunit:SetHasPromotion(BGLevel3, false);
						bgunit:SetHasPromotion(BGLevel4, true);
						bgunit:SetBaseCombatStrength(BGLevel4Combat)
						print ("A Battle General Level 4 is here!");
					end
				end
			end
	end
	end
end

GameEvents.PlayerAdoptPolicy.Add(BattleGeneral);
GameEvents.PlayerDoTurn.Add(BattleGeneral);