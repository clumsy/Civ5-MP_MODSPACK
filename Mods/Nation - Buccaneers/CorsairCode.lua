-- CorsairCode
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "CorsairCode";

--------------------------------------------------------------
-- Detect Plunder
-- Globals
--------------------------------------------------------------

local tClasses = {}
tClasses[GameInfoTypes.UNITCLASS_CARGO_SHIP] = GameInfoTypes.UNITCLASS_CARGO_SHIP
tClasses[GameInfoTypes.UNITCLASS_CARAVAN] = GameInfoTypes.UNITCLASS_CARAVAN

--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

function DetectPlunder(iPlayer, iUnit)
    local pPlayer = Players[iPlayer]
    local pUnit = pPlayer:GetUnitByID(iUnit)
    local iUnitClass = pUnit:GetUnitClassType()
    
    if tClasses[iUnitClass] ~= nil then
        local pTeam = Teams[pPlayer:GetTeam()]
        local pPlot = pUnit:GetPlot()
        local iNumUnits = pPlot:GetNumUnits()
        for iVal = 0,(iNumUnits - 1) do
            local pLUnit = pPlot:GetUnit(iVal)
            if pLUnit:GetCombatLimit() > 0 and pTeam:IsAtWar(pLUnit:GetTeam()) then
                -- Being plundered, run function
                CorsairCode(pLUnit)
				JFD_GoldFromTradeRoutePillage(Players[pLUnit:GetOwner()])
                break
            end
        end
    end
    
    return false
end
GameEvents.CanSaveUnit.Add(DetectPlunder)

function ClearData(iPlayer, iUnit)
    local pPlayer = Players[iPlayer]
    local pUnit = pPlayer:GetUnitByID(iUnit)
    if pUnit ~= nil then
        return
    end
    
    local sSave = (iUnit .. "Turns")
    save(pPlayer, sSave, nil)
    save(pPlayer, iUnit, nil)
end
Events.SerialEventUnitDestroyed.Add(ClearData)

--------------------------------------------------------------
-- Corsair Code
-- Globals
--------------------------------------------------------------

local iModS = 3
local iPromotion = GameInfoTypes.PROMOTION_HIGH_SEA_RAIDING

--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

function CorsairCode(pUnit)

    if not(pUnit:IsHasPromotion(iPromotion)) then
        return
    end
    
    local pPlayer = Players[pUnit:GetOwner()]
    local iUnit = pUnit:GetID()
    local iStrength = GameInfo.Units[pUnit:GetUnitType()].Combat
    
    -- Adjust Info
        -- Strength
        local iDeltaS = load(pPlayer, iUnit)
        if iDeltaS == nil then
            iDeltaS = 0
        end
        iDeltaS = iDeltaS + 1
        save(pPlayer, iUnit, iDeltaS)
        pUnit:SetBaseCombatStrength(iStrength + (iDeltaS * iModS))
        
        -- Turns
        local sSave = (iUnit .. "Turns")
        local iTurns = load(pPlayer, sSave)
        if iTurns == nil then
            iTurns = 0
        end
        iTurns = iTurns + 5
        save(pPlayer, sSave, iTurns)
        
    --Adjust end    
end

function CorsairMonitor(iPlayer)
    local pPlayer = Players[iPlayer]
    for pUnit in pPlayer:Units() do
        if pUnit:IsHasPromotion(iPromotion) then
            local iStrength = GameInfo.Units[pUnit:GetUnitType()].Combat
            local iUnit = pUnit:GetID()
            local sSave = (iUnit .. "Turns")
            local iTurns = load(pPlayer, sSave)
            
            if iTurns == nil then
                iTurns = 0
            end
            iTurns = iTurns - 1
            if iTurns >= 0 then
                save(pPlayer, sSave, iTurns)
            else
                save(pPlayer, sSave, nil)
                save(pPlayer, iUnit, nil)
                pUnit:SetBaseCombatStrength(iStrength)
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(CorsairMonitor)

function JFD_GoldFromTradeRoutePillage(player)
	local goldPillaged = 100
	player:ChangeGold(goldPillaged)
	if player:IsHuman() then
		local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_BUCCANEER_PILLAGE_TRADE_ALERT", goldPillaged)
		Events.GameplayAlertMessage(alertmessage)
	end
end