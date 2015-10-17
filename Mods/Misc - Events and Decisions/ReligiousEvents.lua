-- Religious Events
-- Author: Sukritact
--=======================================================================================================================

print("Religious Events: loaded")

--=======================================================================================================================
-- Generic Religious Events
--=======================================================================================================================
-- Religious Project
-------------------------------------------------------------------------------------------------------------------------
local Event_ReligiousProject = {}

	Event_ReligiousProject.ReligiousText = {
	["RELIGIONGROUP_BUDDHISM"] = "TXT_KEY_EVENT_BUDDHISTPROJECT",
	["RELIGIONGROUP_CHRISTIANITY"] = "TXT_KEY_EVENT_CHRISTIANPROJECT",
	}
	for Religion in GameInfo.Religions() do
		local sReligion = Religion.Type
		local sReligionGroup = tReligiousGroups[sReligion]
		if Event_ReligiousProject.ReligiousText[sReligionGroup] ~= nil then
			Event_ReligiousProject.ReligiousText[sReligion] = Event_ReligiousProject.ReligiousText[sReligionGroup]
		end
	end
	
	Event_ReligiousProject.BuildingClasses = {
	"BUILDINGCLASS_SHRINE",
	"BUILDINGCLASS_TEMPLE",
	}
	
	Event_ReligiousProject.CivBuildings = {
	["CIVILIZATION_INDONESIA"] = "BUILDING_CANDI",
	["CIVILIZATION_SIAM"] = "BUILDING_WAT",
	["CIVILIZATION_MAYA"] = "BUILDING_MAYA_PYRAMID",
	["CIVILIZATION_ETHIOPIA"] = "BUILDING_STELE",
	["CIVILIZATION_EGYPT"] = "BUILDING_BURIAL_TOMB",
	["CIVILIZATION_SONGHAI"] = "BUILDING_MUD_PYRAMID_MOSQUE",
	
	["CIVILIZATION_INDONESIA"] = "BUILDING_CANDI",
	["CIVILIZATION_LAOS"] = "BUILDING_THART",
	["CIVILIZATION_KHMER"] = "BUILDING_KHMER_PRASAT",
	["CIVILIZATION_BURMA"] = "BUILDING_PAYA",
	
	["CIVILIZATION_TUSCANY"] = "BUILDING_DUOMO",
	["CIVILIZATION_AKKADIAN_MOD"] = "BUILDING_AKKADIAN_MOD_ZIGGURAT",
	["CIVILIZATION_SAMI"] = "BUILDING_SAMI_SIEIDI",
	["CIVILIZATION_POLYNESIA"] = "BUILDING_MC_HAWAIIAN_HEIAU",
	
	["CIVILIZATION_JFD_ARMENIA"] = "BUILDING_JFD_ARMENIAN_MONASTERY",
	["CIVILIZATION_JFD_KHAZARIA"] = "BUILDING_JFD_SHUL",
	["CIVILIZATION_JFD_NORWAY"] = "BUILDING_JFD_STAVE_CHURCH",
	["CIVILIZATION_JFD_PAPAL_STATES"] = "BUILDING_JFD_CHAPEL_WRITING",
	}

    Event_ReligiousProject.Name = "TXT_KEY_EVENT_RELIGIOUSPROJECT"
	Event_ReligiousProject.Desc = "TXT_KEY_EVENT_RELIGIOUSPROJECT_DESC"
	Event_ReligiousProject.Weight = 2
	Event_ReligiousProject.CanFunc = (
		function(pPlayer)
			if pPlayer:GetNumCities() < 1 then return end

			local iReligion = GetPlayerMajorityReligion(pPlayer)
			if iReligion == nil then return end
			
			local tValidBuildings = {}
			for iKey, sClass in pairs(Event_ReligiousProject.BuildingClasses) do
				table.insert(tValidBuildings, GetUniqueBuilding(pPlayer, sClass))
			end
			if Event_ReligiousProject.CivBuildings[GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type] then
				print(Event_ReligiousProject.CivBuildings[GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type])
				table.insert(tValidBuildings, Event_ReligiousProject.CivBuildings[GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type])
				table.insert(tValidBuildings, Event_ReligiousProject.CivBuildings[GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type])
			end
			local sBuilding = tValidBuildings[GetRandom(1, #tValidBuildings)]
			Event_ReligiousProject.Data1 = GameInfo.Buildings[sBuilding]
			
			local tCities = {}
			for pCity in pPlayer:Cities() do
				if pCity:CanConstruct(GameInfoTypes[sBuilding], 0) then
					table.insert(tCities, pCity)
				end
			end
			
			if #tCities < 1 then return end
			Event_ReligiousProject.Data2 = tCities[GetRandom(1, #tCities)]
			
			-- Generate Name and Description
			
			local sName = "TXT_KEY_EVENT_RELIGIOUSPROJECT"
			local sDesc = "TXT_KEY_EVENT_RELIGIOUSPROJECT_DESC"
			
			local sReligion = GameInfo.Religions[iReligion].Type
			if Event_ReligiousProject.ReligiousText[sReligion] then
				sName = Event_ReligiousProject.ReligiousText[sReligion]
				sDesc = sName .. "_DESC"
			end
			
			-- End Generate Name and Description
			
			Event_ReligiousProject.Name = sName
			Event_ReligiousProject.Desc = Locale.ConvertTextKey(sDesc, Event_ReligiousProject.Data2:GetName(), Event_ReligiousProject.Data1.Description)
						
			return true
		end
		)
	Event_ReligiousProject.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ReligiousProject.Outcomes[1] = {}
	Event_ReligiousProject.Outcomes[1].Name = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_1"
	Event_ReligiousProject.Outcomes[1].Desc = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_1_DESC"
	Event_ReligiousProject.Outcomes[1].CanFunc = (
		function(pPlayer)
		
			-- Generate Name and Description
			
			local sName = "TXT_KEY_EVENT_RELIGIOUSPROJECT"
			local sOutcomeName = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_1"
			local sDesc = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_1_DESC"
			
			local iReligion = GetPlayerMajorityReligion(pPlayer)
			local sReligion = GameInfo.Religions[iReligion].Type
			if Event_ReligiousProject.ReligiousText[sReligion] then
				sName = Event_ReligiousProject.ReligiousText[sReligion]
				sOutcomeName = sName .. "_OUTCOME_1"
				sDesc = sName .. "_OUTCOME_1_DESC"
			end
			
			-- End Generate Name and Description
			
			Event_ReligiousProject.Outcomes[1].Name = sOutcomeName
			Event_ReligiousProject.Outcomes[1].Desc = Locale.ConvertTextKey(sDesc, Event_ReligiousProject.Data1.Description, Event_ReligiousProject.Data2:GetName())			
			return true
		end
		)
	Event_ReligiousProject.Outcomes[1].DoFunc = (
		function(pPlayer)
			Event_ReligiousProject.Data2:SetNumRealBuilding(Event_ReligiousProject.Data1.ID, 1)
			
			local sName = "TXT_KEY_EVENT_RELIGIOUSPROJECT"
			local sNotification = "TXT_KEY_EVENT_RELIGIOUSPROJECT_NOTIFICATION"
			
			local iReligion = GetPlayerMajorityReligion(pPlayer)
			local sReligion = GameInfo.Religions[iReligion].Type
			if Event_ReligiousProject.ReligiousText[sReligion] then
				sName = Event_ReligiousProject.ReligiousText[sReligion]
				sNotification = sName .. "_NOTIFICATION"
			end
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey(sNotification, Event_ReligiousProject.Data2:GetName(), Event_ReligiousProject.Data1.Description), Locale.ConvertTextKey(Event_ReligiousProject.Name))	
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_ReligiousProject.Outcomes[2] = {}
	Event_ReligiousProject.Outcomes[2].Name = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_2"
	Event_ReligiousProject.Outcomes[2].Desc = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_2_DESC"
	Event_ReligiousProject.Outcomes[2].CanFunc = (
		function(pPlayer)
		
			local iBuildingCost = Event_ReligiousProject.Data1.Cost
			local iCost = math.ceil(iBuildingCost * iMod * 0.66)
			local iReward = math.ceil(iBuildingCost * iMod)
			
			if pPlayer:GetGold() < iCost then return false end
			
			-- Generate Name and Description
			
			local sName = "TXT_KEY_EVENT_RELIGIOUSPROJECT"
			local sOutcomeName = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_2"
			local sDesc = "TXT_KEY_EVENT_RELIGIOUSPROJECT_OUTCOME_2_DESC"
			
			local iReligion = GetPlayerMajorityReligion(pPlayer)
			local sReligion = GameInfo.Religions[iReligion].Type
			if Event_ReligiousProject.ReligiousText[sReligion] then
				sName = Event_ReligiousProject.ReligiousText[sReligion]
				sOutcomeName = sName .. "_OUTCOME_2"
				sDesc = sName .. "_OUTCOME_2_DESC"
			end
			
			-- End Generate Name and Description
			
			Event_ReligiousProject.Outcomes[2].Name = sOutcomeName			
			Event_ReligiousProject.Outcomes[2].Desc = Locale.ConvertTextKey(sDesc, iCost, Event_ReligiousProject.Data1.Description, Event_ReligiousProject.Data2:GetName(), iReward)
			
			return true
		end
		)
	Event_ReligiousProject.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iBuildingCost = Event_ReligiousProject.Data1.Cost
			if Event_ReligiousProject.Data1.ID == GameInfoTypes.BUILDING_PAGODA then iBuildingCost = 200 end
			local iCost = math.ceil(iBuildingCost * iMod * 0.66)
			local iReward = math.ceil(iBuildingCost * iMod)

			pPlayer:ChangeGold(-iCost) 
			pPlayer:ChangeFaith(iReward) 
			
			Event_ReligiousProject.Data2:SetNumRealBuilding(Event_ReligiousProject.Data1.ID, 1)
			
			local sName = "TXT_KEY_EVENT_RELIGIOUSPROJECT"
			local sNotification = "TXT_KEY_EVENT_RELIGIOUSPROJECT_NOTIFICATION"
			
			local iReligion = GetPlayerMajorityReligion(pPlayer)
			local sReligion = GameInfo.Religions[iReligion].Type
			if Event_ReligiousProject.ReligiousText[sReligion] then
				sName = Event_ReligiousProject.ReligiousText[sReligion]
				sNotification = sName .. "_NOTIFICATION"
			end
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey(sNotification, Event_ReligiousProject.Data2:GetName(), Event_ReligiousProject.Data1.Description), Locale.ConvertTextKey(Event_ReligiousProject.Name))	
		end
		)
	
tEvents.Event_ReligiousProject = Event_ReligiousProject
--=======================================================================================================================
-- Buddhist Events
--=======================================================================================================================
-- Buddha's Footprint
-------------------------------------------------------------------------------------------------------------------------
local Event_BuddhaFootprints = {}
    Event_BuddhaFootprints.Name = "TXT_KEY_EVENT_BUDDHAFOOTPRINTS"
	Event_BuddhaFootprints.Desc = "TXT_KEY_EVENT_BUDDHAFOOTPRINTS_DESC"
	Event_BuddhaFootprints.Weight = 7
	Event_BuddhaFootprints.CanFunc = (
		function(pPlayer)
			if pPlayer:GetNumCities() < 1 then return end
			if not(GetMajorityReligionGroup(pPlayer) == "RELIGIONGROUP_BUDDHISM") then return end
			
			local tCities = {}
			for pCity in pPlayer:Cities() do
				table.insert(tCities, pCity)
			end
			
			Event_BuddhaFootprints.Data1 = tCities[GetRandom(1, #tCities)]
			Event_BuddhaFootprints.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS_DESC", Event_BuddhaFootprints.Data1:GetName())
			
			return true
		end
		)
	Event_BuddhaFootprints.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_BuddhaFootprints.Outcomes[1] = {}
	Event_BuddhaFootprints.Outcomes[1].Name = "TXT_KEY_EVENT_BUDDHAFOOTPRINTS_OUTCOME_1"
	Event_BuddhaFootprints.Outcomes[1].Desc = "TXT_KEY_EVENT_BUDDHAFOOTPRINTS_OUTCOME_1_DESC"
	Event_BuddhaFootprints.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			Event_BuddhaFootprints.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS_OUTCOME_1_DESC", iCost, Event_BuddhaFootprints.Data1:GetName())
			if pPlayer:GetGold() < iCost then return false end
			return true
		end
		)
	Event_BuddhaFootprints.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			
			pPlayer:ChangeGold(-iCost) 
			Event_BuddhaFootprints.Data1:ChangeWeLoveTheKingDayCounter(20)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS_NOTIFICATION", Event_BuddhaFootprints.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_BuddhaFootprints.Outcomes[2] = {}
	Event_BuddhaFootprints.Outcomes[2].Name = "TXT_KEY_EVENT_BUDDHAFOOTPRINTS_OUTCOME_2"
	Event_BuddhaFootprints.Outcomes[2].Desc = "TXT_KEY_EVENT_BUDDHAFOOTPRINTS_OUTCOME_2_DESC"
	Event_BuddhaFootprints.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			local iReward = math.ceil(pPlayer:GetScienceTimes100() * 3 * iGAMod * 0.01)
			if iReward < 1 then return end
			if pPlayer:GetFaith() < iCost then return false end
			
			Event_BuddhaFootprints.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS_OUTCOME_2_DESC", iCost, iReward)
			return true
		end
		)
	Event_BuddhaFootprints.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			local iReward = math.ceil(pPlayer:GetScienceTimes100() * 3 * iGAMod * 0.01)
			
			pPlayer:ChangeFaith(-iCost)
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iReward)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS_NOTIFICATION", Event_BuddhaFootprints.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS"))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_BuddhaFootprints.Outcomes[3] = {}
	Event_BuddhaFootprints.Outcomes[3].Name = "TXT_KEY_EVENT_BUDDHAFOOTPRINTS_OUTCOME_3"
	Event_BuddhaFootprints.Outcomes[3].Desc = "TXT_KEY_EVENT_OUTCOME_NOTHING"
	Event_BuddhaFootprints.Outcomes[3].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_BuddhaFootprints.Outcomes[3].DoFunc = (
		function(pPlayer)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS_NOTIFICATION", Event_BuddhaFootprints.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_BUDDHAFOOTPRINTS"))	
		end
		)
	
tEvents.Event_BuddhaFootprints = Event_BuddhaFootprints
--=======================================================================================================================
-- Christian Events
--=======================================================================================================================
-- Catholic: Marian Apparition
-------------------------------------------------------------------------------------------------------------------------
local Event_CatholicApparition = {}
    Event_CatholicApparition.Name = "TXT_KEY_EVENT_CATHOLICAPPARITION"
	Event_CatholicApparition.Desc = "TXT_KEY_EVENT_CATHOLICAPPARITION_DESC"
	Event_CatholicApparition.Weight = 5
	Event_CatholicApparition.CanFunc = (
		function(pPlayer)
			if pPlayer:GetNumCities() < 1 then return end
			if GetPlayerMajorityReligion(pPlayer) ~= GameInfoTypes.RELIGION_CHRISTIANITY then return end
			
			local tCities = {}
			for pCity in pPlayer:Cities() do
				table.insert(tCities, pCity)
			end
			
			Event_CatholicApparition.Data1 = tCities[GetRandom(1, #tCities)]
			Event_CatholicApparition.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION_DESC", Event_CatholicApparition.Data1:GetName())
			
			return true
		end
		)
	Event_CatholicApparition.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_CatholicApparition.Outcomes[1] = {}
	Event_CatholicApparition.Outcomes[1].Name = "TXT_KEY_EVENT_CATHOLICAPPARITION_OUTCOME_1"
	Event_CatholicApparition.Outcomes[1].Desc = "TXT_KEY_EVENT_CATHOLICAPPARITION_OUTCOME_1_DESC"
	Event_CatholicApparition.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			if pPlayer:GetGold() < iCost then return false end
			
			local iReward = iCost * 2
			Event_CatholicApparition.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION_OUTCOME_1_DESC", iCost, iReward)
			
			return true
		end
		)
	Event_CatholicApparition.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			local iReward = iCost * 2
			
			pPlayer:ChangeGold(-iCost)
			pPlayer:ChangeFaith(iReward) 
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION_NOTIFICATION", Event_CatholicApparition.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_CatholicApparition.Outcomes[2] = {}
	Event_CatholicApparition.Outcomes[2].Name = "TXT_KEY_EVENT_CATHOLICAPPARITION_OUTCOME_2"
	Event_CatholicApparition.Outcomes[2].Desc = "TXT_KEY_EVENT_CATHOLICAPPARITION_OUTCOME_2_DESC"
	Event_CatholicApparition.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			local iReward = math.ceil(pPlayer:GetScienceTimes100() * 4 * iGAMod * 0.01)
			if iReward < 1 then return end
			if pPlayer:GetFaith() < iCost then return false end
			
			Event_CatholicApparition.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION_OUTCOME_2_DESC", iCost, iReward)
			return true
		end
		)
	Event_CatholicApparition.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
			local iReward = math.ceil(pPlayer:GetScienceTimes100() * 4 * iGAMod * 0.01)
			
			pPlayer:ChangeFaith(-iCost)
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iReward)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION_NOTIFICATION", Event_CatholicApparition.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION"))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_CatholicApparition.Outcomes[3] = {}
	Event_CatholicApparition.Outcomes[3].Name = "TXT_KEY_EVENT_CATHOLICAPPARITION_OUTCOME_3"
	Event_CatholicApparition.Outcomes[3].Desc = "TXT_KEY_EVENT_OUTCOME_NOTHING"
	Event_CatholicApparition.Outcomes[3].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_CatholicApparition.Outcomes[3].DoFunc = (
		function(pPlayer)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION_NOTIFICATION", Event_CatholicApparition.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_CATHOLICAPPARITION"))	
		end
		)
	
tEvents.Event_CatholicApparition = Event_CatholicApparition
-------------------------------------------------------------------------------------------------------------------------
-- Protestant: New Biblical Canon
-------------------------------------------------------------------------------------------------------------------------
local Event_ProtestantCanon = {}

	Event_ProtestantCanon.tValidReligions =
		{
		["RELIGION_PROTESTANTISM"]			= true,
		["RELIGION_PROTESTANT_CALVINISM"]			= true,
		["RELIGION_CHRISTIAN_ANGLICANISM"]			= true,
		["RELIGION_PROTESTANT_METHODISM"]			= true,
		["RELIGION_PROTESTANT_BAPTIST"]				= true,
		}

    Event_ProtestantCanon.Name = "TXT_KEY_EVENT_PROTESTANTCANON"
	Event_ProtestantCanon.Desc = "TXT_KEY_EVENT_PROTESTANTCANON_DESC"
	Event_ProtestantCanon.Weight = 5
	Event_ProtestantCanon.CanFunc = (
		function(pPlayer)
		
			iReligion = GetPlayerMajorityReligion(pPlayer)
			if iReligion == nil then return end
			local sReligion = GameInfo.Religions[iReligion].Type
			
			return Event_ProtestantCanon.tValidReligions[sReligion]
		end
		)
	Event_ProtestantCanon.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ProtestantCanon.Outcomes[1] = {}
	Event_ProtestantCanon.Outcomes[1].Name = "TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_1"
	Event_ProtestantCanon.Outcomes[1].Desc = "TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_1_DESC"
	Event_ProtestantCanon.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(pPlayer:GetTotalJONSCulturePerTurn() * 3 * iGAMod)
			Event_ProtestantCanon.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_1_DESC", iReward)
			return true
		end
		)
	Event_ProtestantCanon.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(pPlayer:GetTotalJONSCulturePerTurn() * 3 * iGAMod)
			pPlayer:ChangeJONSCulture(iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_ProtestantCanon.Outcomes[2] = {}
	Event_ProtestantCanon.Outcomes[2].Name = "TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_2"
	Event_ProtestantCanon.Outcomes[2].Desc = "TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_2_DESC"
	Event_ProtestantCanon.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(pPlayer:GetScienceTimes100() * 3 * iGAMod * 0.01)
			Event_ProtestantCanon.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_2_DESC", iReward)
			return true
		end
		)
	Event_ProtestantCanon.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(pPlayer:GetScienceTimes100() * 3 * iGAMod * 0.01)
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON"))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_ProtestantCanon.Outcomes[3] = {}
	Event_ProtestantCanon.Outcomes[3].Name = "TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_3"
	Event_ProtestantCanon.Outcomes[3].Desc = "TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_3_DESC"
	Event_ProtestantCanon.Outcomes[3].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(pPlayer:GetTotalFaithPerTurn() * 5 * iGAMod)
			Event_ProtestantCanon.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON_OUTCOME_3_DESC", iReward)
			return true
		end
		)
	Event_ProtestantCanon.Outcomes[3].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(pPlayer:GetTotalFaithPerTurn() * 5 * iGAMod)
			pPlayer:ChangeFaith(iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_PROTESTANTCANON"))	
		end
		)
	
tEvents.Event_ProtestantCanon = Event_ProtestantCanon
-------------------------------------------------------------------------------------------------------------------------
-- Orthodox: Iconoclasm
-------------------------------------------------------------------------------------------------------------------------
local Event_OrthodoxIconoclasm = {}

	Event_OrthodoxIconoclasm.tValidReligions =
		{
		["RELIGION_ORTHODOXY"]						= true,
		["RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX"]	= true,
		["RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST"]	= true,
		}

    Event_OrthodoxIconoclasm.Name = "TXT_KEY_EVENT_ORTHODOXICONOCLASM"
	Event_OrthodoxIconoclasm.Desc = "TXT_KEY_EVENT_ORTHODOXICONOCLASM_DESC"
	Event_OrthodoxIconoclasm.Weight = 5
	Event_OrthodoxIconoclasm.CanFunc = (
		function(pPlayer)
			if pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_TEMPLE) < 1 then return end
			
			iReligion = GetPlayerMajorityReligion(pPlayer)
			if iReligion == nil then return end
			local sReligion = GameInfo.Religions[iReligion].Type
			
			return Event_OrthodoxIconoclasm.tValidReligions[sReligion]
		end
		)
	Event_OrthodoxIconoclasm.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_OrthodoxIconoclasm.Outcomes[1] = {}
	Event_OrthodoxIconoclasm.Outcomes[1].Name = "TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_1"
	Event_OrthodoxIconoclasm.Outcomes[1].Desc = "TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_1_DESC"
	Event_OrthodoxIconoclasm.Outcomes[1].CanFunc = (
		function(pPlayer)
		
			local iNum = pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_TEMPLE)
			local iFaith = math.ceil(iNum * iMod * 50)
			local iCult = math.ceil(iNum * iMod * 30)
			Event_OrthodoxIconoclasm.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_1_DESC", iFaith, iCult)
			
			return true
		end
		)
	Event_OrthodoxIconoclasm.Outcomes[1].DoFunc = (
		function(pPlayer)
		
			local iNum = pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_TEMPLE)
			local iFaith = math.ceil(iNum * iMod * 50)
			local iCult = math.ceil(iNum * iMod * 30)
			
			pPlayer:ChangeFaith(iFaith)
			pPlayer:ChangeJONSCulture(iCult)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM"))	
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_OrthodoxIconoclasm.Outcomes[2] = {}
	Event_OrthodoxIconoclasm.Outcomes[2].Name = "TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_2"
	Event_OrthodoxIconoclasm.Outcomes[2].Desc = "TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_2_DESC"
	Event_OrthodoxIconoclasm.Outcomes[2].CanFunc = (
		function(pPlayer)
		
			local iNum = pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_TEMPLE)
			local iGold = math.ceil(iNum * iMod * 50)
			local iCult = math.ceil(iNum * iMod * 30)
			Event_OrthodoxIconoclasm.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_2_DESC", iGold, iCult)
			
			return true
		end
		)
	Event_OrthodoxIconoclasm.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iNum = pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_TEMPLE)
			local iGold = math.ceil(iNum * iMod * 50)
			local iCult = math.ceil(iNum * iMod * 30)
			
			pPlayer:ChangeGold(iGold)
			pPlayer:ChangeJONSCulture(iCult)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM"))	
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_OrthodoxIconoclasm.Outcomes[3] = {}
	Event_OrthodoxIconoclasm.Outcomes[3].Name = "TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_3"
	Event_OrthodoxIconoclasm.Outcomes[3].Desc = "TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_3_DESC"
	Event_OrthodoxIconoclasm.Outcomes[3].CanFunc = (
		function(pPlayer)
		
			local iNum = pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_TEMPLE)
			local iFaith = math.ceil(iNum * iMod * 50)
			local iSci = math.ceil(iNum * iMod * 20)
			Event_OrthodoxIconoclasm.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM_OUTCOME_3_DESC", iFaith, iSci)
			
			return true
		end
		)
	Event_OrthodoxIconoclasm.Outcomes[3].DoFunc = (
		function(pPlayer)
			local iNum = pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_TEMPLE)
			local iFaith = math.ceil(iNum * iMod * 50)
			local iSci = math.ceil(iNum * iMod * 20)

			pPlayer:ChangeFaith(iFaith)
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iSci)			
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ORTHODOXICONOCLASM"))				
		end
		)
	
tEvents.Event_OrthodoxIconoclasm = Event_OrthodoxIconoclasm
--=======================================================================================================================
--=======================================================================================================================