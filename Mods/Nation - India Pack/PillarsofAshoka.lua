-- PillarsOfAshoka
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "PillarsOfAshoka";

local iPillars = GameInfo.Buildings["BUILDING_MAURYAN_PILLAR_OF_ASHOKA"].ID


local iReligionMax = 10
for Religions in GameInfo.Religions() do
    if Religions.ID > iReligionMax then
        iReligionMax = Religions.ID
    end
end

function PillarsOfAshoka (iPlayer)
    local pPlayer = Players[iPlayer]
    for pCity in pPlayer:Cities() do
        local iCity = pCity:GetID()
        --print(pCity:GetName())
        if pCity:IsHasBuilding(iPillars) then
            --print("Has Pillars")
            if load(pPlayer, iCity) ~= true then
                --print("Not True")
                local iReligion = pPlayer:GetReligionCreatedByPlayer()
                if (iReligion ~= GameInfo.Religions.RELIGION_PANTHEON.ID and iReligion ~= -1) then
                    --print("Saved")
                    for iReligions = -1,iReligionMax,1 do
                        pCity:ConvertPercentFollowers(iReligion, iReligions, 75)
                    end
                    save(pPlayer, iCity, true)
                end
            end
        end
    end
end

GameEvents.PlayerDoTurn.Add(PillarsOfAshoka)
GameEvents.PlayerAdoptPolicy.Add(PillarsOfAshoka)

function CityScreenPillarsOfAshoka()
    local iPlayer = Game.GetActivePlayer()
    local pPlayer = Players[iPlayer]
    if pPlayer:IsTurnActive() then
        PillarsOfAshoka(iPlayer)
    end
end

Events.SerialEventExitCityScreen.Add(CityScreenPillarsOfAshoka)

