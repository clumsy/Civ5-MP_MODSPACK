function MinorPalaces(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ETRUSCAN"] and player:IsAlive() then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_PALACE"]) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_DUMMY"], 0)	
			end
			if not city:IsHasBuilding(GameInfoTypes["BUILDING_PALACE"]) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_DUMMY"], 1)	
			end
		end	
	end
end
GameEvents.PlayerDoTurn.Add(MinorPalaces)

function EtruscanBuilding(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ETRUSCAN"] and player:IsAlive() then
		for city in player:Cities() do
			local current_gold = player:GetGold()
			local add_gold = (player:GetNumCities() * 100)
			local add_culture = player:GetNumCities()
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_ANCIENT"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + add_gold)
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_CLASSICAL"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + add_gold)
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_MEDIEVAL"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + add_gold)
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_RENAISSANCE"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + (add_gold / 2))
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + (add_gold / 2))
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_MODERN"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + (add_gold / 2))
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_POSTMODERN"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + (add_gold / 2))
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			if (player:GetCurrentEra() == GameInfo.Eras["ERA_FUTURE"].ID) then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
					player:SetGold(current_gold + (add_gold / 2))
					player:ChangeJONSCulture(add_culture * 50)
				end
			end
			 -- Remove generic fanu
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"]) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ETRUSCAN_FANU"], 0)	
			end
		end	
	end
end
GameEvents.PlayerDoTurn.Add(EtruscanBuilding)
