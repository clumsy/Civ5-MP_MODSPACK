-- NazcaUA
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

include( "SaveUtils" ); MY_MOD_NAME = "Nazca";

function NazcaUAPart1(iPlayer)
    local pPlayer = Players[iPlayer]
    local iGeoglyphs = GameInfo.Improvements["IMPROVEMENT_MC_GEOGLYPHS"].ID
    if (pPlayer:IsAlive()) then
        if (pPlayer:GetCivilizationType() == GameInfo.Civilizations["CIVILIZATION_MC_NAZCA"].ID) then
            local iNumCities = pPlayer:GetNumCities()
            local iNumGeoglyphs = pPlayer:GetImprovementCount(iGeoglyphs)
            pPlayer:ChangeGoldenAgeProgressMeter((iNumCities * 3)+iNumGeoglyphs)
        end
    end
end

function NazcaUAPart2(iPlayer)
    local pPlayer = Players[iPlayer]
    if (pPlayer:IsAlive()) then
        if (pPlayer:GetCivilizationType() == GameInfo.Civilizations["CIVILIZATION_MC_NAZCA"].ID) then
            local iNumFounded = load(pPlayer, "NumFounded")
            if iNumFounded == nil then
                iNumFounded = 0
            end
            if iNumFounded < 4 then
                local iDelta = ((pPlayer:GetNextPolicyCost())/2)
                pPlayer:ChangeJONSCulture(iDelta)
                iNumFounded = iNumFounded + 1
                save(pPlayer, "NumFounded", iNumFounded)
            end
        end
    end
end

GameEvents.PlayerDoTurn.Add(NazcaUAPart1)
GameEvents.PlayerCityFounded.Add(NazcaUAPart2)
