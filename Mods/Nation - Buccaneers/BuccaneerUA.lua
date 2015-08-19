-- BuccaneerUA
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

--------------------------------------------------------------
-- Initial Processes
--------------------------------------------------------------

local iCivType = GameInfoTypes.CIVILIZATION_BUCCANEER
local iDomain = DomainTypes.DOMAIN_SEA
local iTreshold = 30
local iMod = 10
local pBarbarian = nil

for iPlayer, pPlayer in pairs(Players) do
    if pPlayer:IsBarbarian() then
        pBarbarian = pPlayer
    end
end

if pBarbarian == nil then
    print("no barbarians!")
    return
end

function GetRandom(lower, upper)
    return Map.Rand((upper + 1) - lower, "") + lower
end

math.randomseed(os.time())

--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

function BuccaneerUA(iPlayer)
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() ~= iCivType) then
        return
    end
    local pTeam = Teams[pPlayer:GetTeam()]
    
    for pUnit in pPlayer:Units() do
        if pUnit:GetCombatLimit() > 0 and pUnit:GetDomainType() == iDomain then
            local pPlot = pUnit:GetPlot()
            local iPlotOwner = pPlot:GetOwner()
            if not(iPlotOwner == iPlayer or iPlotOwner == -1 or Players[iPlotOwner]:IsMinorCiv()) then
                if not(pPlayer:IsPlayerHasOpenBorders(iPlotOwner) or pTeam:IsAtWar(pPlot:GetTeam())) then
                    local iRandom = GetRandom(1,100)
                    local iTrueTreshold = iTreshold - (pUnit:GetLevel() * iMod)
                    if iRandom <= iTrueTreshold then
                        local pNewUnit = pBarbarian:InitUnit(pUnit:GetUnitType(), pUnit:GetX(), pUnit:GetY())
                        pNewUnit:Convert(pUnit)
						if pPlayer:IsHuman() then
							local description
							if pUnit:GetUnitType() == GameInfoTypes["UNIT_BUCCANEER_CORSAIR"] or pUnit:GetUnitType() == GameInfoTypes["UNIT_GREAT_ADMIRAL"] then
								description = Locale.ConvertTextKey("TXT_KEY_JFD_PIRATE_DEFECT_CORSAIR", pUnit:GetName())
							else
								description = Locale.ConvertTextKey("TXT_KEY_JFD_PIRATE_DEFECT", pUnit:GetName())
							end
							local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_PIRATE_DEFECT_SHORT")
							Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_BARBARIAN"], description, descriptionShort)
							Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_VERY_BAD")
						end
                    end
                end
            end
        end
    end
end

GameEvents.PlayerDoTurn.Add(BuccaneerUA)
