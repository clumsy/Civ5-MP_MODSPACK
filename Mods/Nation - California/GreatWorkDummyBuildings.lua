	

    -- GreatWorkDummyBuildings
    -- Author: Vicevirtuoso
    -- DateCreated: 8/11/2014 12:12:13 AM
    --------------------------------------------------------------
     
    local iMaxCivs = GameDefines.MAX_MAJOR_CIVS
    local iMaxPlayers = GameDefines.MAX_CIV_PLAYERS
     
     
    --THESE VARIABLES CAN BE CHANGED TO ADJUST WHICH GW SLOT TYPES ARE CACHED
     
    local bCacheArt = false
    local bCacheWriting = true
    local bCacheMusic = false
     
     
     
    --Variable to detect if CultureOverview popup is up; this is the only time that the UpdateDummyBuildingsUI() function should run
    local bPopup;
     
    --Precache all buildings that have Great Works of Art to make things go significantly faster
    local tGreatWorkBuildings = {};
    for pBuilding in GameInfo.Buildings() do
            if pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_ART_ARTIFACT" and pBuilding.GreatWorkCount > 0 and bCacheArt then
                    local pBuildingClass = GameInfo.BuildingClasses("Type = '" ..pBuilding.BuildingClass.. "'")()
                    --Save BuildingClasses instead of BuildingTypes since GetBuildingGreatWork() calls for Classes
                    tGreatWorkBuildings[pBuildingClass.ID] = pBuildingClass.Type
            elseif pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_MUSIC" and pBuilding.GreatWorkCount > 0 and bCacheMusic then
                    local pBuildingClass = GameInfo.BuildingClasses("Type = '" ..pBuilding.BuildingClass.. "'")()
                    tGreatWorkBuildings[pBuildingClass.ID] = pBuildingClass.Type
            elseif pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_LITERATURE" and pBuilding.GreatWorkCount > 0 and bCacheWriting then
                    local pBuildingClass = GameInfo.BuildingClasses("Type = '" ..pBuilding.BuildingClass.. "'")()
                    tGreatWorkBuildings[pBuildingClass.ID] = pBuildingClass.Type
            end
    end
     

    --Precache all works with dummy buildings to make things go faster
    local tDummyGreatWorks = {}
    local tDummyBuildings = {}
     
     
    for work in GameInfo.GreatWorks() do
            if work.DummyBuilding ~= nil then
                    tDummyGreatWorks[work.ID] = work.Type
                    tDummyBuildings[work.ID] = GameInfo.Buildings("Type = '" ..work.DummyBuilding.. "'")().ID
            end
    end

     
     
     
    --Check all of a player's buildings at start of turn, and update the Dummy buildings accordingly
    function UpdateDummyBuildings(iPlayer)
		if iPlayer == iMaxPlayers then return end
		local pPlayer = Players[iPlayer]
		if pPlayer:IsEverAlive() and not pPlayer:IsMinorCiv() then
			for pCity in pPlayer:Cities() do
				local tBuildingsToAdd = {}
				for k, v in pairs(tDummyBuildings) do
					if not tBuildingsToAdd[v] then
						tBuildingsToAdd[v] = 0
					end
				end
				for iGreatWork, pGreatWork in pairs(tDummyGreatWorks) do
					local bHasGreatWork = false;
					for iBuildingClass, pBuildingClass in pairs(tGreatWorkBuildings) do
						local iCurrentWorks = pCity:GetNumGreatWorksInBuilding(iBuildingClass)
						if iCurrentWorks > 0 then
								for i = 0, iCurrentWorks - 1, 1 do
										local iWorkType = pCity:GetBuildingGreatWork(iBuildingClass, i)
										if Game.GetGreatWorkType(iWorkType, iPlayer) == iGreatWork then
												bHasGreatWork = true;
												break
										end
								end
						end
						if bHasGreatWork then
							break
						end
					end
					if bHasGreatWork then
						tBuildingsToAdd[tDummyBuildings[iGreatWork]] = tBuildingsToAdd[tDummyBuildings[iGreatWork]] + 1
					end
				end
				for k, v in pairs(tBuildingsToAdd) do
					pCity:SetNumRealBuilding(k, v)
				end
			end
		end
    end
     
     
    --Check all of a player's buildings when CultureOverview is updated (swapping Great Works around), and update the Dummy buildings accordingly
    function UpdateDummyBuildingsUI()
            --If bPopup is false then that will (should) mean that CultureOverview is not active, and that's the only screen this mod needs tracking for.
            --Only call it if bPopup is true
            if bPopup then
                    UpdateDummyBuildings(Game:GetActivePlayer())
            end
    end
     
    GameEvents.PlayerDoTurn.Add(UpdateDummyBuildings)
     
    Events.SerialEventCityInfoDirty.Add(UpdateDummyBuildingsUI)
     
     
    --When a popup screen appears, check if it is CultureOverview. If so, set bPopup to true, which lets UpdateDummyBuildingsUI() fire
    function SetCurrentPopup(popupInfo)
            local popupType = popupInfo.Type
            if popupType == ButtonPopupTypes.BUTTONPOPUP_CULTURE_OVERVIEW then
                    bPopup = true
            end
    end
    Events.SerialEventGameMessagePopup.Add(SetCurrentPopup)
     
     
    --When a popup is closed, delete bPopup so it doesn't keep refreshing Dummy buildings when CultureOverview isn't open
    function ClearCurrentPopup()
            bPopup = nil;
    end
    Events.SerialEventGameMessagePopupProcessed.Add(ClearCurrentPopup)
