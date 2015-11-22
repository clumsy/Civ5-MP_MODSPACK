-- MauryaUA
-- Author: Sukritact
--------------------------------------------------------------

print ("loaded") 

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "MauryaUA";

local iCivType = GameInfoTypes["CIVILIZATION_MAURYA"]
local iCulture = GameInfo.Yields["YIELD_CULTURE"].ID
local iNumBase = 6

function MauryaUA (pPlayer)
    if load(pPlayer, "bBonusEnabled") == true then
        --Calculate number of followers per culture; if no cities captured then break
        local iNumCaptured = load(pPlayer, "iNumCaptured")
        if iNumCaptured == nil then
            iNumCaptured = 0
        end
        if iNumCaptured == 0 then
            --print("No bonus, break")
            return
        else
            iPopPerCult = iNumBase - iNumCaptured
        end
        if iPopPerCult <= 0 then
            iPopPerCult = 1
        end
        
        --Grab the appropriate religion, return if no religion founded
        local iReligion = pPlayer:GetReligionCreatedByPlayer()
        --print(iReligion)
        if iReligion == GameInfo.Religions.RELIGION_PANTHEON.ID or iReligion == -1 then
            --print("No religion, break")
            return
        end
        
        --This is the actual bonus
        for pCity in pPlayer:Cities() do
            local iCity = pCity:GetID()
            local iDelta = (pCity:GetNumFollowers(iReligion)/iPopPerCult)

            if (pCity:IsCapital()) then
                iDelta = iDelta + (GetNumForeignFollowers(iReligion)/(iPopPerCult + 3))
            end
            iDelta = math.floor(iDelta)
            --print("Receiving", iCity, iDelta)
            -- Set Culture
            local iOldDelta = load( pPlayer, iCity .. "Y" .. iCulture)
            if iOldDelta == nil then
                iOldDelta = 0
            end
            --print(iOldDelta, iDelta)
            save( pPlayer, iCity .. "Y" .. iCulture, iDelta)
            pPlayer:ChangeJONSCulturePerTurnForFree(iDelta - iOldDelta)
        end
        
    --Clear Bonuses
    else
        --print("Bonus not enabled")
        for pCity in pPlayer:Cities() do
            local iCity = pCity:GetID()
            local iDelta = 0
            local iOldDelta = load( pPlayer, iCity .. "Y" .. iCulture)
            if iOldDelta == nil then
                iOldDelta = 0
            end
            save( pPlayer, iCity .. "Y" .. iCulture, iDelta)
            pPlayer:ChangeJONSCulturePerTurnForFree(iDelta - iOldDelta)
        end
    end
    
    if load(pPlayer, "bSendMessage") == true then
        MauryaNotification(pPlayer)
        save(pPlayer, "bSendMessage", false)
    end
        
    
end

-- End of Main Code

function GetNumForeignFollowers (iReligion)
    iFounder = Game.GetFounder(iReligion, -1)
    iNumFollowers = 0
    for iPlayer, pPlayer in pairs(Players) do
        if (pPlayer:IsEverAlive()) and (iPlayer ~= iFounder) then
            for pCity in pPlayer:Cities() do
                iNumFollowers = iNumFollowers + pCity:GetNumFollowers(iReligion)
            end
        end
    end
    return iNumFollowers
end

function MauryaUATrigger1(iPlayer)
    ----print("Trigger Type 1")
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == iCivType) then
        MauryaUA(pPlayer)
    end
end

GameEvents.PlayerDoTurn.Add(MauryaUATrigger1)
--GameEvents.CityConvertsReligion.Add(MauryaUATrigger1)


function MauryaUATrigger2()
    local iPlayer = Game.GetActivePlayer()
    local pPlayer = Players[iPlayer]
    if pPlayer:IsTurnActive() then
        ----print ("Trigger Type 2")
        if (pPlayer:GetCivilizationType() == iCivType) then
            MauryaUA(pPlayer)
        end
    end
end

Events.SerialEventCityInfoDirty.Add(MauryaUATrigger2)

----------------------------------------------------------------        
-- The following is used to keep track of Maurya's War States
---------------------------------------------------------------- 

iTeam = -1

function MauryaWarMonitor (iAttacker, iDefender, bWar)

    -- Gets the Attacker
    if iTeam ~= -1 then
        iTeam = -1
        return
    else
        iTeam = iAttacker
    end
    --print(iAttacker, iDefender)
    --print("Attacker is " .. iTeam)
    
    --War Declared
    if bWar then
        local pTeam = Teams[iTeam]
        --print("War Declared")
        for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
            local pPlayer = Players[iPlayer]
            if (pTeam:GetAtWarCount() == 0) and (pPlayer:GetCivilizationType() == iCivType) then
                --print("Enemies annihilated, peace")
                save(pPlayer, "bBonusEnabled", true)
            elseif (pPlayer:GetTeam() == iTeam) and (pPlayer:GetCivilizationType() == iCivType) then
                --print(iPlayer .. " is Maurya and Attacking!")
                if load(pPlayer, "bBonusEnabled") == true then
                    --print("Bonus Reset")
                    save(pPlayer, "iNumCaptured", 0)
                end
                save(pPlayer, "bBonusEnabled", false)
            end
        end
        
    --Peace Made
    else
        --print("Peace Made")
        for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
            local pPlayer = Players[iPlayer]
            local iPlayerTeam = pPlayer:GetTeam()
            if ((iPlayerTeam == iAttacker) or (iPlayerTeam == iDefender)) and (pPlayer:GetCivilizationType() == iCivType) then
                --print(iPlayer .. " is Maurya and has made Peace!")
                local pTeam = Teams[iPlayerTeam]
                if pTeam:GetAtWarCount() > 0 then
                    --print("However, is still at war with someone else")
                else
                    save(pPlayer, "bBonusEnabled", true)
                    MauryaNotification(pPlayer)
                end
            end        
        end    
    end    
end

function MauryaCityCaptureMonitor(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
    local pPlayer = Players[iNewOwner]
    if (bConquest) and (pPlayer:GetCivilizationType() == iCivType) then
        --print("Maurya has captured a city!")
        if load(pPlayer, "bBonusEnabled") == true then
            --print("Bonus reset to 1")
            save(pPlayer, "iNumCaptured", 1)
            save(pPlayer, "bWarDeclaredviaCapture", true)
        else
            local iNumCaptured = load(pPlayer, "iNumCaptured")
            if iNumCaptured == nil then
                iNumCaptured = 0
            end
            iNumCaptured = iNumCaptured + 1
            --print(iNumCaptured)
            save(pPlayer, "iNumCaptured", iNumCaptured)
        end
        local iPlayerTeam = pPlayer:GetTeam()
        local pTeam = Teams[iPlayerTeam]
        if (pTeam:GetAtWarCount() == 0) then
            --print("Enemies annihilated, peace restored")
            save(pPlayer, "bBonusEnabled", true)
        end
        MauryaNotification(pPlayer)
    end
end

Events.WarStateChanged.Add(MauryaWarMonitor)
GameEvents.CityCaptureComplete.Add(MauryaCityCaptureMonitor)

----------------------------------------------------------------        
-- The following the Notification
---------------------------------------------------------------- 

function MauryaNotification(pPlayer)
    ----print("Notification")
    if not(pPlayer:IsHuman())then
        return
    end
    if not(pPlayer:IsTurnActive()) then
        save(pPlayer, "bSendMessage", true)
        return
    end
    
    local iNumCaptured = load(pPlayer, "iNumCaptured")
    local bBonusEnabled = load(pPlayer, "bBonusEnabled")
    local iPopPerCult = iNumBase - iNumCaptured
    if iPopPerCult <= 0 then
        iPopPerCult = 1
    end
    local StrPop = tostring(iPopPerCult .. " followers of")
    ----print(StrPop)
    
    --Define verb
    if (iPopPerCult == 5) or (iPopPerCult == 4) then
        strVerb = "long"
    elseif (iPopPerCult == 3) or (iPopPerCult == 2) then
        strVerb = "call"    
    else 
        strVerb = "beg"
    end
    
    --Define Religion
    local iReligion = pPlayer:GetReligionCreatedByPlayer()
    if iReligion == GameInfo.Religions.RELIGION_PANTHEON.ID or iReligion == -1 then
        bReligion = false
        strReligion = " your Religion"
    else
        bReligion = true
        strReligion = tostring(" " .. Locale.ConvertTextKey(Game.GetReligionName(iReligion)))
    end
    ----print(strReligion)
    
    --Define sentence
    if (bBonusEnabled) and (bReligion) then
        strToolTip = ("The people rejoice at the end of the war! You now receive +1 [ICON_CULTURE] Culture for every " .. StrPop .. strReligion .. " in your empire and +1 [ICON_CULTURE] Culture for every " .. iPopPerCult + 3 .. " followers elsewhere.")
    elseif not(bBonusEnabled) and (bReligion) then
        strToolTip = ("The people " .. strVerb .. " for peace: if you make peace now, you will receive +1 [ICON_CULTURE] Culture for every " .. StrPop .. strReligion .. " in your empire and +1 [ICON_CULTURE] Culture for every " .. iPopPerCult + 3 .. " followers elsewhere.")
    elseif (bBonusEnabled) and not(bReligion) then
        strToolTip = ("The people rejoice at the end of the war! As soon as you found a Religion, you will receive +1 [ICON_CULTURE] Culture for every " .. StrPop .. strReligion .. " in your empire and +1 [ICON_CULTURE] Culture for every " .. iPopPerCult + 3 .. " followers elsewhere.")
    elseif not(bBonusEnabled) and not(bReligion) then
        strToolTip = ("The people " .. strVerb .. " for peace. As soon as you make peace and found a Religion, you will receive +1 [ICON_CULTURE] Culture for every " .. StrPop .. strReligion .. " in your empire and +1 [ICON_CULTURE] Culture for every " .. iPopPerCult + 3 .. " followers elsewhere.")
    end
    
    pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, strToolTip, "Unique Bonuses Changed", -1, -1, -1, -1)
end
