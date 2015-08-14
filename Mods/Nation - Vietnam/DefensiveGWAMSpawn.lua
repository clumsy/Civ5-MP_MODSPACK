function GetVietnameseGreatPeopleRateChange(city)
    local greatPeopleRateChange = 0
    if city:IsHasBuilding(GameInfoTypes["BUILDING_WALLS"]) then
        greatPeopleRateChange = greatPeopleRateChange + 10
    end
    
    if city:IsHasBuilding(GameInfoTypes["BUILDING_CASTLE"]) then
        greatPeopleRateChange = greatPeopleRateChange + 10
    end
    
    if city:IsHasBuilding(GameInfoTypes["BUILDING_ARSENAL"]) then
        greatPeopleRateChange = greatPeopleRateChange + 10
    end
    
    if city:IsHasBuilding(GameInfoTypes["BUILDING_MILITARY_BASE"]) then
        greatPeopleRateChange = greatPeopleRateChange + 10
    end
    
    return greatPeopleRateChange
end
 
function VietnameseGreatArtists(playerID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VIETNAM"] then
        for city in player:Cities() do
            local greatPeopleRateChange = GetVietnameseGreatPeopleRateChange(city)
            if greatPeopleRateChange > 0 then
				local currentArtistRate = city:GetGreatPeopleUnitProgress(GameInfoTypes["SPECIALIST_ARTIST"])
				local currentMusiciantRate = city:GetGreatPeopleUnitProgress(GameInfoTypes["SPECIALIST_MUSICIAN"])
				local currentWriterRate = city:GetGreatPeopleUnitProgress(GameInfoTypes["SPECIALIST_WRITER"])
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_ARTIST"], currentArtistRate * greatPeopleRateChange / 100)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_MUSICIAN"], currentMusiciantRate * greatPeopleRateChange / 100)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_WRITER"], currentWriterRate * greatPeopleRateChange / 100)
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(VietnameseGreatArtists)
