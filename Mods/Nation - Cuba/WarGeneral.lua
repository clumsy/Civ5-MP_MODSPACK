-- WarGeneral
-- Author: Leugi
-- DateCreated: 7/31/2013 4:10:03 PM
--------------------------------------------------------------
print("The War General Lua loaded succesfully")


local WGeneralPromotion = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL"].ID
local WGLevel0 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_0"].ID
local WGLevel1 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_1"].ID
local WGLevel2 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_2"].ID
local WGLevel3 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_3"].ID
local WGLevel4 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_4"].ID
local WGLevel5 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_5"].ID
local WGLevel6 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_6"].ID
local WGLevel7 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_7"].ID
local WGLevel8 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_8"].ID
local WGLevel9 = GameInfo.UnitPromotions["PROMOTION_WAR_GENERAL_9"].ID

local WGLevel1Prereq = GameInfo.Technologies["TECH_BRONZE_WORKING"].ID
local WGLevel2Prereq = GameInfo.Technologies["TECH_IRON_WORKING"].ID
local WGLevel3Prereq = GameInfo.Technologies["TECH_STEEL"].ID
local WGLevel4Prereq = GameInfo.Technologies["TECH_GUNPOWDER"].ID
local WGLevel5Prereq = GameInfo.Technologies["TECH_RIFLING"].ID
local WGLevel6Prereq = GameInfo.Technologies["TECH_REPLACEABLE_PARTS"].ID
local WGLevel7Prereq = GameInfo.Technologies["TECH_PLASTIC"].ID
local WGLevel8Prereq = GameInfo.Technologies["TECH_MOBILE_TACTICS"].ID
local WGLevel9Prereq = GameInfo.Technologies["TECH_NANOTECHNOLOGY"].ID

local WGLevel0Combat = 8
local WGLevel1Combat = 11
local WGLevel2Combat = 14
local WGLevel3Combat = 21
local WGLevel4Combat = 24
local WGLevel5Combat = 34
local WGLevel6Combat = 50
local WGLevel7Combat = 70
local WGLevel8Combat = 90
local WGLevel9Combat = 100


function WarGeneral(iPlayer)
	for _, pPlayer in pairs(Players) do
	local teamID = pPlayer:GetTeam();
	local pTeam = Teams[teamID];
	if (pPlayer:IsAlive()) then
		for bgunit in pPlayer:Units() do
			if (bgunit:IsHasPromotion(WGeneralPromotion)) then
				bgunit:SetHasPromotion(WGLevel0, true);
				bgunit:SetBaseCombatStrength(WGLevel0Combat)
				if (pTeam:IsHasTech(WGLevel1Prereq)) then
						bgunit:SetHasPromotion(WGLevel0, false);
						bgunit:SetHasPromotion(WGLevel1, true);
						bgunit:SetBaseCombatStrength(WGLevel1Combat)
						--print ("A War General Level 1 is here!");	
				end				
				if (pTeam:IsHasTech(WGLevel2Prereq)) then
						bgunit:SetHasPromotion(WGLevel1, false);
						bgunit:SetHasPromotion(WGLevel2, true);
						bgunit:SetBaseCombatStrength(WGLevel2Combat)
						--print ("A War General Level 2 is here!");
				end
				if (pTeam:IsHasTech(WGLevel3Prereq)) then		
						bgunit:SetHasPromotion(WGLevel2, false);
						bgunit:SetHasPromotion(WGLevel3, true);
						bgunit:SetBaseCombatStrength(WGLevel3Combat)
						--print ("A War General Level 3 is here!");
				end
				if (pTeam:IsHasTech(WGLevel4Prereq)) then		
						bgunit:SetHasPromotion(WGLevel3, false);
						bgunit:SetHasPromotion(WGLevel4, true);
						bgunit:SetBaseCombatStrength(WGLevel4Combat)
						--print ("A War General Level 4 is here!");
				end
				if (pTeam:IsHasTech(WGLevel5Prereq)) then		
						bgunit:SetHasPromotion(WGLevel4, false);
						bgunit:SetHasPromotion(WGLevel5, true);
						bgunit:SetBaseCombatStrength(WGLevel5Combat)
						--print ("A War General Level 5 is here!");
				end
				if (pTeam:IsHasTech(WGLevel6Prereq)) then		
						bgunit:SetHasPromotion(WGLevel5, false);
						bgunit:SetHasPromotion(WGLevel6, true);
						bgunit:SetBaseCombatStrength(WGLevel6Combat)
						--print ("A War General Level 6 is here!");
				end
				if (pTeam:IsHasTech(WGLevel7Prereq)) then		
						bgunit:SetHasPromotion(WGLevel6, false);
						bgunit:SetHasPromotion(WGLevel7, true);
						bgunit:SetBaseCombatStrength(WGLevel7Combat)
						--print ("A War General Level 7 is here!");
				end
				if (pTeam:IsHasTech(WGLevel8Prereq)) then		
						bgunit:SetHasPromotion(WGLevel7, false);
						bgunit:SetHasPromotion(WGLevel8, true);
						bgunit:SetBaseCombatStrength(WGLevel8Combat)
						--print ("A War General Level 8 is here!");
				end
				if (pTeam:IsHasTech(WGLevel9Prereq)) then		
						bgunit:SetHasPromotion(WGLevel8, false);
						bgunit:SetHasPromotion(WGLevel9, true);
						bgunit:SetBaseCombatStrength(WGLevel9Combat)
						--print ("A War General Level 9 is here!");
				end
			end
		end
	end
	end
end
Events.SerialEventUnitCreated.Add(WarGeneral);
GameEvents.PlayerAdoptPolicy.Add(WarGeneral);
GameEvents.PlayerDoTurn.Add(WarGeneral);