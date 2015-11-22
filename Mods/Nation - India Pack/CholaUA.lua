-- CholaUA
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

local iModifier = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldGiftMod)/100)
local iChola = GameInfo.Civilizations["CIVILIZATION_CHOLA"].ID
local tCholaGold = {}
local tCholaAdmiral = {}
local tCholaInfluence = {}

function CholaUA(iPlayer, bIsTurnStart)
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == iChola) then
        tCholaGold[iPlayer] = 0
        tCholaAdmiral[iPlayer] = 0
        tCholaInfluence[iPlayer] = {}
        
        local tTradeRoutes = pPlayer:GetTradeRoutes()
        for i,v in ipairs(tTradeRoutes) do
            if v.FromID == iPlayer then
                --print("Trade Route Num = " .. i)
                local iDelta = 1
                local iDeltaInfluence = (1 * iModifier)
                if v.Domain == DomainTypes.DOMAIN_SEA then
                    --print("Naval, Bonuses doubled")
                    iDelta = (iDelta * 2)
                    iDeltaInfluence = (iDeltaInfluence*2)
                end
                if    v.FromID == v.ToID then
                    tCholaGold[iPlayer] = tCholaGold[iPlayer] + iDelta
                else
                    local pToCiv = Players[v.ToID]
                    --print ("Is International")
                    if pToCiv:IsMinorCiv() then
                        tCholaAdmiral[iPlayer] = tCholaAdmiral[iPlayer] + iDelta
                        if tCholaInfluence[iPlayer][v.ToID] == nil then
                            tCholaInfluence[iPlayer][v.ToID] = iDeltaInfluence
                        else
                            tCholaInfluence[iPlayer][v.ToID] = tCholaInfluence[iPlayer][v.ToID] + iDeltaInfluence
                        end
                    end
                end
            end
        end
        
        --[[
        print(tCholaGold[iPlayer], tCholaAdmiral[iPlayer])
        for iToCiv, iInfluence in pairs(tCholaInfluence[iPlayer]) do
            local pToCiv = Players[iToCiv]
            local sName = pToCiv:GetName()
            print(sName, iInfluence)
        end
        ]]
        
        if bIsTurnStart then
            for iToCiv, iInfluence in pairs(tCholaInfluence[iPlayer]) do
                local pToCiv = Players[iToCiv]
                pToCiv:ChangeMinorCivFriendshipWithMajor(iPlayer, iInfluence)
            end
            pPlayer:ChangeNavalCombatExperience(tCholaAdmiral[iPlayer])
            pPlayer:ChangeGold(tCholaGold[iPlayer])
        end
        
        if iPlayer == Game.GetActivePlayer() then
            local iTotalGold = pPlayer:GetGold()
            local iGoldPerTurn = pPlayer:CalculateGoldRate() + tCholaGold[iPlayer]
            ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetToolTipCallback(CholaGoldTipHandler)
            ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetText(Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_GOLD", iTotalGold, iGoldPerTurn))
        end    
            
    end
end

function CholaUATrigger1(iPlayer)
    local bIsTurnStart = true
    CholaUA(iPlayer, bIsTurnStart)
end

function CholaUATrigger2()
    local iPlayer = Game.GetActivePlayer()
    local pPlayer = Players[iPlayer]
    local bIsTurnStart = false
    if pPlayer:IsTurnActive() then
        CholaUA(iPlayer, bIsTurnStart)
    end
end

GameEvents.PlayerDoTurn.Add(CholaUATrigger1)
Events.SerialEventGameDataDirty.Add(CholaUATrigger2)
Events.SerialEventTurnTimerDirty.Add(CholaUATrigger2)
Events.SerialEventCityInfoDirty.Add(CholaUATrigger2)
--------------------------------------------------------------
-- GoldToolTip
--------------------------------------------------------------
local tipControlTable = {};
TTManager:GetTypeControlTable("TooltipTypeTopPanel", tipControlTable)

function CholaGoldTipHandler( control )

    local strText = ""
    local iPlayerID = Game.GetActivePlayer()
    local pPlayer = Players[iPlayerID]
    local pTeam = Teams[pPlayer:GetTeam()]
    local pCity = UI.GetHeadSelectedCity()
    
    local iTotalGold = pPlayer:GetGold()

    local iGoldPerTurnFromOtherPlayers = pPlayer:GetGoldPerTurnFromDiplomacy()
    local iGoldPerTurnToOtherPlayers = 0
    if (iGoldPerTurnFromOtherPlayers < 0) then
        iGoldPerTurnToOtherPlayers = -iGoldPerTurnFromOtherPlayers
        iGoldPerTurnFromOtherPlayers = 0
    end
    
    local iGoldPerTurnFromReligion = pPlayer:GetGoldPerTurnFromReligion()
    
    --Chola Gold
    local iCholaGoldBoost = tCholaGold[iPlayerID]

    local fTradeRouteGold = (pPlayer:GetGoldFromCitiesTimes100() - pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100()) / 100
    local fGoldPerTurnFromCities = pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100() / 100
    local fCityConnectionGold = pPlayer:GetCityConnectionGoldTimes100() / 100
    --local fInternationalTradeRouteGold = pPlayer:GetGoldPerTurnFromTradeRoutesTimes100() / 100
    local fTraitGold = pPlayer:GetGoldPerTurnFromTraits()
    local fTotalIncome = fGoldPerTurnFromCities + iGoldPerTurnFromOtherPlayers + fCityConnectionGold + iGoldPerTurnFromReligion + fTradeRouteGold + fTraitGold + iCholaGoldBoost
    
    if (pPlayer:IsAnarchy()) then
        strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_ANARCHY", pPlayer:GetAnarchyNumTurns())
        strText = strText .. "[NEWLINE][NEWLINE]"
    end
    
    if (not OptionsManager.IsNoBasicHelp()) then
        strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_AVAILABLE_GOLD", iTotalGold)
        strText = strText .. "[NEWLINE][NEWLINE]"
    end
    
    strText = strText .. "[COLOR:150:255:150:255]"
    strText = strText .. "+" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_INCOME", math.floor(fTotalIncome))
    strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CITY_OUTPUT", fGoldPerTurnFromCities)
    strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_CITY_CONNECTIONS", math.floor(fCityConnectionGold))
    strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_ITR", math.floor(fTradeRouteGold))
    if (math.floor(fTraitGold) > 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_TRAITS", math.floor(fTraitGold))
    end
    if (iGoldPerTurnFromOtherPlayers > 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_OTHERS", iGoldPerTurnFromOtherPlayers)
    end
    if (iGoldPerTurnFromReligion > 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_RELIGION", iGoldPerTurnFromReligion)
    end

    --Chola Tooltip
    if iCholaGoldBoost > 0 then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CHOLA_GOLD", iCholaGoldBoost)
    end
    
    strText = strText .. "[/COLOR]"
    
    local iUnitCost = pPlayer:CalculateUnitCost()
    local iUnitSupply = pPlayer:CalculateUnitSupply()
    local iBuildingMaintenance = pPlayer:GetBuildingGoldMaintenance()
    local iImprovementMaintenance = pPlayer:GetImprovementGoldMaintenance()
    local iTotalExpenses = iUnitCost + iUnitSupply + iBuildingMaintenance + iImprovementMaintenance + iGoldPerTurnToOtherPlayers
    
    strText = strText .. "[NEWLINE]"
    strText = strText .. "[COLOR:255:150:150:255]"
    strText = strText .. "[NEWLINE]-" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_EXPENSES", iTotalExpenses)
    if (iUnitCost ~= 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNIT_MAINT", iUnitCost)
    end
    if (iUnitSupply ~= 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_UNIT_SUPPLY", iUnitSupply)
    end
    if (iBuildingMaintenance ~= 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_BUILDING_MAINT", iBuildingMaintenance)
    end
    if (iImprovementMaintenance ~= 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TILE_MAINT", iImprovementMaintenance)
    end
    if (iGoldPerTurnToOtherPlayers > 0) then
        strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TO_OTHERS", iGoldPerTurnToOtherPlayers)
    end
    strText = strText .. "[/COLOR]"
    
    if (fTotalIncome + iTotalGold < 0) then
        strText = strText .. "[NEWLINE][COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_LOSING_SCIENCE_FROM_DEFICIT") .. "[/COLOR]"
    end
    
    -- Basic explanation of Happiness
    if (not OptionsManager.IsNoBasicHelp()) then
        strText = strText .. "[NEWLINE][NEWLINE]"
        strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLD_EXPLANATION")
    end
    
    --Controls.GoldPerTurn:SetToolTipString(strText)
    
    tipControlTable.TooltipLabel:SetText( strText )
    tipControlTable.TopPanelMouseover:SetHide(false)
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize()
    
end