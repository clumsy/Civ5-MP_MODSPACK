-- BattleAdmiral
-- Author: Leugi
-- DateCreated: 7/31/2013 4:10:03 PM
--------------------------------------------------------------
print("Damn the Torpedoes! The Battle Admiral Lua loaded succesfully")


local BAdmiralPromotion = GameInfo.UnitPromotions["PROMOTION_BATTLE_ADMIRAL_0"].ID
local BGLevel1 = GameInfo.UnitPromotions["PROMOTION_BATTLE_ADMIRAL_1"].ID
local BGLevel2 = GameInfo.UnitPromotions["PROMOTION_BATTLE_ADMIRAL_2"].ID
local BGLevel3 = GameInfo.UnitPromotions["PROMOTION_BATTLE_ADMIRAL_3"].ID
local BGLevel4 = GameInfo.UnitPromotions["PROMOTION_BATTLE_ADMIRAL_4"].ID
local BGLevel4 = GameInfo.UnitPromotions["PROMOTION_BATTLE_ADMIRAL_5"].ID

local BGLevel1Prereq = GameInfo.Technologies["TECH_SAILING"].ID
local BGLevel2Prereq = GameInfo.Technologies["TECH_ASTRONOMY"].ID
local BGLevel3Prereq = GameInfo.Technologies["TECH_NAVIGATION"].ID
local BGLevel4Prereq = GameInfo.Technologies["TECH_STEAM_POWER"].ID
local BGLevel5Prereq = GameInfo.Technologies["TECH_ELECTRICITY"].ID

local BGLevel1Combat = 12
local BGLevel2Combat = 22
local BGLevel3Combat = 27
local BGLevel4Combat = 47
local BGLevel5Combat = 57


function BattleAdmiral(iPlayer)
	for _, pPlayer in pairs(Players) do
	local teamID = pPlayer:GetTeam();
	local pTeam = Teams[teamID];
	if (pPlayer:IsAlive()) then
			if (pTeam:IsHasTech(BGLevel1Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BAdmiralPromotion)) then
						bgunit:SetHasPromotion(BGLevel1, true);
						bgunit:SetBaseCombatStrength(BGLevel1Combat)
						print ("A Battle Admiral Level 1 is here!");
						
					end
				end
			end
			if (pTeam:IsHasTech(BGLevel2Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BAdmiralPromotion)) then
						bgunit:SetHasPromotion(BGLevel1, false);
						bgunit:SetHasPromotion(BGLevel2, true);
						bgunit:SetBaseCombatStrength(BGLevel2Combat)
						print ("A Battle Admiral Level 2 is here!");
					end
				end
			end
			if (pTeam:IsHasTech(BGLevel3Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BAdmiralPromotion)) then
						bgunit:SetHasPromotion(BGLevel2, false);
						bgunit:SetHasPromotion(BGLevel3, true);
						bgunit:SetBaseCombatStrength(BGLevel3Combat)
						print ("A Battle Admiral Level 3 is here!");
					end
				end
			end
			if (pTeam:IsHasTech(BGLevel4Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BAdmiralPromotion)) then
						bgunit:SetHasPromotion(BGLevel3, false);
						bgunit:SetHasPromotion(BGLevel4, true);
						bgunit:SetBaseCombatStrength(BGLevel4Combat)
						print ("A Battle Admiral Level 4 is here!");
					end
				end
			end
			if (pTeam:IsHasTech(BGLevel5Prereq)) then
				for bgunit in pPlayer:Units() do
					if (bgunit:IsHasPromotion(BAdmiralPromotion)) then
						bgunit:SetHasPromotion(BGLevel4, false);
						bgunit:SetHasPromotion(BGLevel5, true);
						bgunit:SetBaseCombatStrength(BGLevel4Combat)
						print ("A Battle Admiral Level 5 is here!");
					end
				end
			end
	end
	end
end

GameEvents.PlayerAdoptPolicy.Add(BattleAdmiral);
GameEvents.PlayerDoTurn.Add(BattleAdmiral);