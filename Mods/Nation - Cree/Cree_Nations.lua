-- Cree Bonus by Neirai the Forgiven

--Initialize the list of Cree Town Names
gListofCreeTowns = {}
gListofCreeTowns.Marsh = {}
gListofCreeTowns.Ocean = {}
gListofCreeTowns.Forest = {}
gListofCreeTowns.Innu = {}
gListofCreeTowns.PlainsCree = {}
gListofCreeTowns.Metis = {}
gCree = {}
gCreeUnit = {}
gCreePromos = {}
-- there is no town 1, since that is always the Capital name.

--Initialize list of Swampy Cree names

gListofCreeTowns.Marsh[0] = "Sipiwininiwak"
gListofCreeTowns.Marsh[1] = "Attawapiskat"
gListofCreeTowns.Marsh[2] = "Chemawawin"
gListofCreeTowns.Marsh[3] = "Tataskweyak"
gListofCreeTowns.Marsh[4] = "Misipawistik"
gListofCreeTowns.Marsh[5] = "Mosakahiken"
gListofCreeTowns.Marsh[6] = "Shamattawa"
gListofCreeTowns.Marsh[7] = "Taykwa Tagamou"
gListofCreeTowns.Marsh[8] = "Kashechewan"
gListofCreeTowns.Marsh[9] = "Missanabie"
gListofCreeTowns.Marsh[10] = "Weenusk"

--Initialize list of James Bay Cree names

gListofCreeTowns.Ocean[0] = "Sipiwininiwak"
gListofCreeTowns.Ocean[1] = "Ouje-Bougoumou"
gListofCreeTowns.Ocean[2] = "Chisasibi"
gListofCreeTowns.Ocean[3] = "Wemindji"
gListofCreeTowns.Ocean[4] = "Whapmagoostui"
gListofCreeTowns.Ocean[5] = "Nemaska"
gListofCreeTowns.Ocean[6] = "Mistissini"
gListofCreeTowns.Ocean[7] = "Waskaganish"
gListofCreeTowns.Ocean[8] = "Washaw Sibi"
gListofCreeTowns.Ocean[9] = "Wapanutaw"
gListofCreeTowns.Ocean[10] = "Waswanipi"

--Initialize list of Woodlands Cree names

gListofCreeTowns.Forest[0] = "Sipiwininiwak"
gListofCreeTowns.Forest[1] = "Kapawe’No"
gListofCreeTowns.Forest[2] = "Sturgeon Lake"
gListofCreeTowns.Forest[3] = "Loon River"
gListofCreeTowns.Forest[4] = "Mikisew"
gListofCreeTowns.Forest[5] = "Nisichawayasihk"
gListofCreeTowns.Forest[6] = "Bigstone"
gListofCreeTowns.Forest[7] = "Wabasca"
gListofCreeTowns.Forest[8] = "Sakittawak"
gListofCreeTowns.Forest[9] = "Amisksipi"
gListofCreeTowns.Forest[10] = "Winipek"

--Initialize list of Innu names

gListofCreeTowns.Innu[0] = "Sipiwininiwak"
gListofCreeTowns.Innu[1] = "Totouskak"
gListofCreeTowns.Innu[2] = "Kawawachikamach"
gListofCreeTowns.Innu[3] = "Natuashish"
gListofCreeTowns.Innu[4] = "Uashau"
gListofCreeTowns.Innu[5] = "Mani-Utenam"
gListofCreeTowns.Innu[6] = "Essipu"
gListofCreeTowns.Innu[7] = "Pakuashipi"
gListofCreeTowns.Innu[8] = "Ekuantshit"
gListofCreeTowns.Innu[9] = "Matimekosh"
gListofCreeTowns.Innu[10] = "Obedjiwan"


gListofCreeTowns.PlainsCree[0] = "Sipiwininiwak"
gListofCreeTowns.PlainsCree[1] = "Katepwewi"
gListofCreeTowns.PlainsCree[2] = "Waposwayanak"
gListofCreeTowns.PlainsCree[3] = "Nehiyawi-pwatak"
gListofCreeTowns.PlainsCree[4] = "Natimiyininiwak"
gListofCreeTowns.PlainsCree[5] = "Amiskwaciwiyiniwak"
gListofCreeTowns.PlainsCree[6] = "Waskahikaniwiyiniwak"
gListofCreeTowns.PlainsCree[7] = "Paskokopawiyiniwak"
gListofCreeTowns.PlainsCree[8] = "Sakawiyiniwak"
gListofCreeTowns.PlainsCree[9] = "Mamihkiyiniwak"


gListofCreeTowns.Metis[0] = "Sipiwininiwak"
gListofCreeTowns.Metis[1] = "Minnedosa"
gListofCreeTowns.Metis[2] = "Camperville"
gListofCreeTowns.Metis[3] = "Montagne à la Bosse"
gListofCreeTowns.Metis[4] = "Grand Rapids"
gListofCreeTowns.Metis[5] = "Birsay"
gListofCreeTowns.Metis[6] = "Opaskweyaw"
gListofCreeTowns.Metis[7] = "Baie St. Paul"
gListofCreeTowns.Metis[8] = "Gabriel’s Crossing"
gListofCreeTowns.Metis[9] = "Waskahiganihk"
gListofCreeTowns.Metis[10] = "Lac La Ronge"
gListofCreeTowns.Metis[11] = "Muskeg Lake"
gListofCreeTowns.Metis[12] = "Southbranch"
gListofCreeTowns.Metis[13] = "Prince Albert"
gListofCreeTowns.Metis[14] = "Last Mountain Lake"
gListofCreeTowns.Metis[15] = "Lac St. Anne"
gListofCreeTowns.Metis[16] = "Pakan"
gListofCreeTowns.Metis[17] = "Amiskwaskahegan"
gListofCreeTowns.Metis[18] = "Muskootao Point"
gListofCreeTowns.Metis[19] = "Spring Creek"

gCree[0] = "Swampy Cree"
gCree[1] = "James Bay Cree"
gCree[2] = "Woodlands Cree"
gCree[3] = "Innu"
gCree[4] = "Plains Cree"
gCree[5] = "Metis"

gCreeUnit[0] = GameInfo.Units["UNIT_NOTIFICATION_CREESWAMP"].ID
gCreeUnit[1] = GameInfo.Units["UNIT_NOTIFICATION_CREEJAMES"].ID
gCreeUnit[2] = GameInfo.Units["UNIT_NOTIFICATION_CREEWOODS"].ID
gCreeUnit[3] = GameInfo.Units["UNIT_NOTIFICATION_CREEINNU"].ID
gCreeUnit[4] = GameInfo.Units["UNIT_NOTIFICATION_CREEPLAINS"].ID
gCreeUnit[5] = GameInfo.Units["UNIT_NOTIFICATION_CREEMETIS"].ID

gCreePromos[0] = GameInfoTypes.PROMOTION_CREESWAMPINFO
gCreePromos[1] = GameInfoTypes.PROMOTION_CREEJAMESINFO
gCreePromos[2] = GameInfoTypes.PROMOTION_CREEWOODSINFO
gCreePromos[3] = GameInfoTypes.PROMOTION_CREEINNUINFO
gCreePromos[4] = GameInfoTypes.PROMOTION_CREEPLAINSINFO
gCreePromos[5] = GameInfoTypes.PROMOTION_CREEMETISINFO


function SabtuanAudit(pPlot)
	print("SabtuanAudit has been triggered.")
-- determine Swampiness first
	local x = pPlot:GetX()
	local y = pPlot:GetY()
	local range = 1
	if pPlot:GetFeatureType() == FeatureTypes.FEATURE_MARSH or pPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS then
		return 0
	else
		for dx = -range, range do
			for dy = -range, range do
				local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
				if SpecificPlot then
					if (SpecificPlot:GetTerrainType() ~= nil) and (SpecificPlot:GetTerrainType() ~= TerrainTypes.NO_TERRAIN) then
						if SpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_MARSH or SpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FLOOD_PLAINS then
							return 0
						end
					end
				end
			end
		end
	end
	--determine northern reaches
	if pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
		return 3
	end
	--determine forestedness
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if (SpecificPlot:GetTerrainType() ~= nil) and (SpecificPlot:GetTerrainType() ~= TerrainTypes.NO_TERRAIN) then
					if SpecificPlot:GetFeatureType() == FeatureTypes.FEATURE_FOREST then
						return 2
					end
				end
			end
		end
	end
	--determine coastlines
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if (SpecificPlot:GetTerrainType() ~= nil) and (SpecificPlot:GetTerrainType() ~= TerrainTypes.NO_TERRAIN) then
					if SpecificPlot:GetPlotType() == PlotTypes.PLOT_OCEAN then
						return 1
					end
				end
			end
		end
	end
	--determine plains
	if pPlot:GetTerrainType() == TerrainTypes.TERRAIN_GRASS or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_PLAINS then
		return 4
	else -- Metis
		return 5
	end
end

function GetCreeName(pNum)
	local gookstuff = "Metis"
	if pNum == 0 then
		gookstuff = "Marsh"
	elseif pNum == 1 then
		gookstuff = "Ocean"
	elseif pNum == 2 then
		gookstuff = "Forest"
	elseif pNum == 3 then
		gookstuff = "Innu"
	elseif pNum == 4 then
		gookstuff = "PlainsCree"
	else
		gookstuff = "Metis"
	end
	return gookstuff
end


function DetectCreeNameConflict(pAudit, pNameNum)
	for i, pPlayer in pairs(Players) do
		for eachCity in pPlayer:Cities() do
			local gobblygook = GetCreeName(pAudit)
			print(gListofCreeTowns[gobblygook][pNameNum])
			if gListofCreeTowns[gobblygook][pNameNum] ~= nil then
				if gListofCreeTowns[gobblygook][pNameNum] == eachCity:GetName() then
					print("A conflict was found")
					return true
				end
			end
		end
	end
	return false
end

function DetectUniqueness(pCity, pAudit, pPlayer)
	for eachCity in pPlayer:Cities() do
		if pCity ~= eachCity then
			if pAudit == SabtuanAudit(eachCity:Plot()) then
				return false
			end
		end
	end
	return true
end

function RenameCreeCities(player, x, y)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION or pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_HUNS then
		print("Cree City detected!")
		local pPlot = Map.GetPlot(x, y)
		local pCity = pPlot:GetPlotCity()
		local pName = pCity:GetName()
		local NameNum = 0
		local pAudit = SabtuanAudit(pPlot)
		print("City Founded on " .. pAudit)
		while DetectCreeNameConflict(pAudit, NameNum) do
			NameNum = NameNum + 1
		end
		local creeName = GetCreeName(pAudit)
		pCity:SetName(gListofCreeTowns[creeName][NameNum], true)
		if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
			if pCity == pPlayer:GetCapitalCity() then
				local pTitle = ("The Iron Confederacy!")
				local pDesc = ("The " .. gCree[pAudit] .. " have founded the Iron Confederacy in the city of " .. pCity:GetName() .. "! Expand your cities into new terrain types to attract more Cree Nations to the Confederacy.")
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, pDesc, pTitle, pCity:GetX(), pCity:GetY(), gCreeUnit[pAudit], gCreeUnit[pAudit])
			elseif DetectUniqueness(pCity, pAudit, pPlayer) then
				local pTitle = ("A new Cree Nation!")
				local pDesc = ("The " .. gCree[pAudit] .. " have joined the Iron Confederacy, founding the city of " .. pCity:GetName() .. "!")
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, pDesc, pTitle, pCity:GetX(), pCity:GetY(), gCreeUnit[pAudit], gCreeUnit[pAudit])
			else
				local pTitle = (gCree[pAudit] .. " City")
				local pDesc = ("The " ..gCree[pAudit] .. " have founded the city of " .. pCity:GetName() .. ".")
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, pDesc, pTitle, pCity:GetX(), pCity:GetY(), gCreeUnit[pAudit], gCreeUnit[pAudit])
			end
			--also...
			if pCity == pPlayer:GetCapitalCity() then
				for pUnit in pPlayer:Units() do
					if pAudit == 0 then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANSWAMPYCREE, true)
					elseif pAudit == 1 then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANJAMESBAYCREE, true)
					elseif pAudit == 2 then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANWOODLANDCREE, true)
					elseif pAudit == 3 then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANINNU, true)
					elseif pAudit == 4 then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANPLAINSCREE, true)
					elseif pAudit == 5 then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANMETIS, true)
					end
				end
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(RenameCreeCities)

function SabtuanPromotions(player, city, unitID)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
		local pUnit = pPlayer:GetUnitByID(unitID)
		local pCity = pPlayer:GetCityByID(city)
		if pCity ~= nil then
			local pPlot = pCity:Plot()
			local pAudit = SabtuanAudit(pPlot)
			print(pAudit)
			if pAudit == 0 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANSWAMPYCREE, true)
			elseif pAudit == 1 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANJAMESBAYCREE, true)
			elseif pAudit == 2 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANWOODLANDCREE, true)
			elseif pAudit == 3 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANINNU, true)
			elseif pAudit == 4 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANPLAINSCREE, true)
			elseif pAudit == 5 then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SABTUANMETIS, true)
			end
		end
	end
end
GameEvents.CityTrained.Add(SabtuanPromotions)

--Tutorial!!
function CreeSettlers(player, unit)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
		local pUnit = pPlayer:GetUnitByID(unit)
		if pUnit:GetUnitType() == GameInfoTypes.UNIT_SETTLER then
			local pPlot = pUnit:GetPlot()
			if pPlot ~= nil then
				local pAudit = SabtuanAudit(pPlot)
				for iRowNum, pPromo in pairs(gCreePromos) do
					if iRowNum == pAudit then
						pUnit:SetHasPromotion(pPromo, true)
					else
						pUnit:SetHasPromotion(pPromo, false)
					end
				end
			end
		end
	end
end
Events.SerialEventUnitCreated.Add(CreeSettlers)
GameEvents.UnitSetXY.Add(CreeSettlers)

------------------------------------------------------------------------------------
--Code for Sukritact's Modular City Information Stack. Many thanks to Sukritact for this!
------------------------------------------------------------------------------------

print("loaded")
include("IconSupport")
--include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "CreeNation";

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "CreeNation", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(sKey, pInstance)
	if sKey ~= "CreeNation" then return end
	ProcessCityScreen(pInstance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen (Courtesy of Sukritact and/or JFD)
-------------------------------------------------------------------------------------------------------------------------

g_CreeNationTipControls = {}
TTManager:GetTypeControlTable("CreeNationTip", g_CreeNationTipControls)

function ProcessCityScreen(pInstance)
	-- Ensure City Selected
	local pCity = UI.GetHeadSelectedCity()
	if not(pCity) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	print("City Selected")
	-- Ensure Player and City Owner Cree
	local pPlayer = Players[pCity:GetOwner()]
	if pPlayer ~= Players[Game.GetActivePlayer()] or pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
		pInstance.IconFrame:SetHide(true)
		return
	end
	print("Player and City Owner are both Cree!")
	
	pInstance.IconFrame:SetToolTipType("CreeNationTip")
	--Get Appropriate Cree Nation
	local pNation = SabtuanAudit(pCity:Plot())
	
	if pNation == 0 then
		--Swampy (Needs Warning)
		IconHookup(3, 64, "CREENATIONS_ATLAS", pInstance.IconImage)
		local sHeading = "[COLOR_PLAYER_DARK_CYAN_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_CREENATIONHEADER") .. ":") .. "[ENDCOLOR]"
		local sSubheading = string.upper(Locale.ConvertTextKey("TXT_KEY_SWAMPYCREE_SUBHEADING"))
		local sBody = Locale.ConvertTextKey("TXT_KEY_SWAMPYCREE_TEXT") .. "[NEWLINE]" .. "[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SWAMPYCREE_WARNING") .. "[ENDCOLOR]"
		g_CreeNationTipControls.Heading:SetText(sHeading)
		g_CreeNationTipControls.Subheading:SetText(sSubheading)
		g_CreeNationTipControls.Body:SetText(sBody)
		g_CreeNationTipControls.Box:DoAutoSize()
		pInstance.IconFrame:SetHide(false)
	elseif pNation == 1 then
		--James Bay
		IconHookup(2, 64, "CREENATIONS_ATLAS", pInstance.IconImage)
		local sHeading = "[COLOR_PLAYER_DARK_CYAN_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_CREENATIONHEADER") .. ":") .. "[ENDCOLOR]"
		local sSubheading = string.upper(Locale.ConvertTextKey("TXT_KEY_JAMESBAY_SUBHEADING"))
		local sBody = Locale.ConvertTextKey("TXT_KEY_JAMESBAY_TEXT")
		g_CreeNationTipControls.Heading:SetText(sHeading)
		g_CreeNationTipControls.Subheading:SetText(sSubheading)
		g_CreeNationTipControls.Body:SetText(sBody)
		g_CreeNationTipControls.Box:DoAutoSize()
		pInstance.IconFrame:SetHide(false)
	elseif pNation == 2 then
		--Woodland (Needs Warning)
		IconHookup(5, 64, "CREENATIONS_ATLAS", pInstance.IconImage)
		local sHeading = "[COLOR_PLAYER_DARK_CYAN_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_CREENATIONHEADER") .. ":") .. "[ENDCOLOR]"
		local sSubheading = string.upper(Locale.ConvertTextKey("TXT_KEY_WOODCREE_SUBHEADING"))
		local sBody = Locale.ConvertTextKey("TXT_KEY_WOODCREE_TEXT") .. "[NEWLINE]" .. "[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_WOODCREE_WARNING") .. "[ENDCOLOR]"
		g_CreeNationTipControls.Heading:SetText(sHeading)
		g_CreeNationTipControls.Subheading:SetText(sSubheading)
		g_CreeNationTipControls.Body:SetText(sBody)
		g_CreeNationTipControls.Box:DoAutoSize()
		pInstance.IconFrame:SetHide(false)
	elseif pNation == 3 then
		--Innu
		IconHookup(4, 64, "CREENATIONS_ATLAS", pInstance.IconImage)
		local sHeading = "[COLOR_PLAYER_DARK_CYAN_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_CREENATIONHEADER") .. ":") .. "[ENDCOLOR]"
		local sSubheading = string.upper(Locale.ConvertTextKey("TXT_KEY_INNU_SUBHEADING"))
		local sBody = 	Locale.ConvertTextKey("TXT_KEY_INNU_TEXT")
		g_CreeNationTipControls.Heading:SetText(sHeading)
		g_CreeNationTipControls.Subheading:SetText(sSubheading)
		g_CreeNationTipControls.Body:SetText(sBody)
		g_CreeNationTipControls.Box:DoAutoSize()
		pInstance.IconFrame:SetHide(false)
	elseif pNation == 4 then
		--Plains Cree
		IconHookup(0, 64, "CREENATIONS_ATLAS", pInstance.IconImage)
		local sHeading = "[COLOR_PLAYER_DARK_CYAN_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_CREENATIONHEADER") .. ":") .. "[ENDCOLOR]"
		local sSubheading = string.upper(Locale.ConvertTextKey("TXT_KEY_PLAINSCREE_SUBHEADING"))
		local sBody = Locale.ConvertTextKey("TXT_KEY_PLAINSCREE_TEXT")
		g_CreeNationTipControls.Heading:SetText(sHeading)
		g_CreeNationTipControls.Subheading:SetText(sSubheading)
		g_CreeNationTipControls.Body:SetText(sBody)
		g_CreeNationTipControls.Box:DoAutoSize()
		pInstance.IconFrame:SetHide(false)
	elseif pNation == 5 then
		--Metis
		IconHookup(1, 64, "CREENATIONS_ATLAS", pInstance.IconImage)
		local sHeading = "[COLOR_PLAYER_DARK_CYAN_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_CREENATIONHEADER") .. ":") .. "[ENDCOLOR]"
		local sSubheading = string.upper(Locale.ConvertTextKey("TXT_KEY_METIS_SUBHEADING"))
		local sBody = Locale.ConvertTextKey("TXT_KEY_METIS_TEXT")
		g_CreeNationTipControls.Heading:SetText(sHeading)
		g_CreeNationTipControls.Subheading:SetText(sSubheading)
		g_CreeNationTipControls.Body:SetText(sBody)
		g_CreeNationTipControls.Box:DoAutoSize()
		pInstance.IconFrame:SetHide(false)
	end
end