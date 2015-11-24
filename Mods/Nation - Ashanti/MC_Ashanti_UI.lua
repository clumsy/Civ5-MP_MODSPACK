-- Ashanti Popup
--=======================================================================================================================

include("IconSupport.lua")
include("InfoTooltipInclude.lua")
include("InstanceManager.lua")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "MC_Ashanti_UI";
print("loaded")

--=======================================================================================================================
-- Generic Utilities
--=======================================================================================================================
-- JFD_IsCivilisationActive
-------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--------------------------------------------------------------
-- Abort if Ashanti not in Game
--------------------------------------------------------------
local iCiv = GameInfoTypes.CIVILIZATION_MC_ASHANTI
if not(JFD_IsCivilisationActive(iCiv)) then
	print("Ashanti not active, aborting")
	return
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPiety
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPiety()
	local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == pietyModID) then
		  isUsingPiety = true
		  break
		end
	end

	return isUsingPiety
end

bIsUsingPiety = JFD_IsUsingPiety()
if bIsUsingPiety then
	include("JFD_PietyUtils.lua")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetMainReligionID
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetMainReligionID(playerID)
	local player = Players[playerID]
	local religionID = -1
	if bIsUsingPiety then
		religionID = JFD_GetStateReligion(playerID)
	end

	if religionID <= 0 then
		religionID = player:GetReligionCreatedByPlayer()
	end

	if religionID == -1 then
		religionID = player:GetCapitalCity():GetReligiousMajority()
	end

	return religionID
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUniqueUnit
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetUniqueUnit(player, unitClass)
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type

	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end

	if (unitType == nil) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end

	return unitType
end
-------------------------------------------------------------------------------------------------------------------------
-- InitUnitFromCity
-------------------------------------------------------------------------------------------------------------------------
function InitUnitFromCity(pCity, iUnitType, iNum)
	local tUnits = {}
	pPlayer = Players[pCity:GetOwner()]
	for i = 1, iNum do
		pUnit = pPlayer:InitUnit(iUnitType, pCity:GetX(), pCity:GetY())
		if not(pUnit:JumpToNearestValidPlot()) then return tUnits end
		
		table.insert(tUnits, pUnit)
		
		pUnit:SetExperience(pCity:GetDomainFreeExperience(pUnit:GetDomainType()))
		for promotion in GameInfo.UnitPromotions() do
			iPromotion = promotion.ID
				if (pCity:GetFreePromotionCount(iPromotion) > 0 and pUnit:IsPromotionValid(iPromotion)) then
				pUnit:SetHasPromotion(iPromotion, true)
			end
		end
		
	end
	return tUnits
end
-------------------------------------------------------------------------------------------------------------------------
-- Player_IsWarWith
-------------------------------------------------------------------------------------------------------------------------
function Player_IsWarWith(iPlayer1, iPlayer2)
	local pPlayer = Players[iPlayer1] or iPlayer1
	local pEnemy = Players[iPlayer2] or iPlayer2
	if type(iPlayer1) ~= "table" or type(iPlayer1) ~= "table" then
		print("error: invalid arguments")
		return
	end
	local pTeam = Teams[pPlayer:GetTeam()]
	local iEnemyTeam = pEnemy:GetTeam()

	return pTeam:IsAtWar(iEnemyTeam)
end
-------------------------------------------------------------------------------------------------------------------------
-- Player_IsHasMet
-------------------------------------------------------------------------------------------------------------------------
function Player_IsHasMet(iPlayer1, iPlayer2)
	local pPlayer = Players[iPlayer1] or iPlayer1
	local pEnemy = Players[iPlayer2] or iPlayer2
	if type(iPlayer1) ~= "table" or type(iPlayer1) ~= "table" then
		print("error: invalid arguments")
		return
	end
	local pTeam = Teams[pPlayer:GetTeam()]
	local iEnemyTeam = pEnemy:GetTeam()

	return pTeam:HasMet(iEnemyTeam)
end
-------------------------------------------------------------------------------------------------------------------------
-- Player_ConvertUnit(pUnit, pPlayer)
-------------------------------------------------------------------------------------------------------------------------
function Player_ConvertUnit(pUnit, pPlayer)
	local pNewUnit = pPlayer:InitUnit(pUnit:GetUnitType(), pUnit:GetX(), pUnit:GetY())
	pNewUnit:Convert(pUnit)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetStateReligion
------------------------------------------------------------------------------------------------------------------------
function JFD_GetStateReligion(playerID)
	local JFD_StateReligion = "JFD_StateReligionOf" .. playerID
	return GetPersistentProperty(JFD_StateReligion)
end	
-------------------------------------------------------------------------------------------------------------------------
-- GetReligion
-------------------------------------------------------------------------------------------------------------------------
function GetReligion(pPlayer)
	local iMajorityReligion = nil
	
	local iReligion = JFD_GetStateReligion(pPlayer:GetID())
	if iReligion and (iReligion ~= -1) then return iReligion end
	
	local iReligion = pPlayer:GetReligionCreatedByPlayer()
	if iReligion and (iReligion ~= -1) then return iReligion end
	
	for row in GameInfo.Religions() do
		local iReligion = row.ID
		if pPlayer:HasReligionInMostCities(iReligion) then
			iMajorityReligion = iReligion
			break
		end
	end
	
	return iMajorityReligion
end
-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
-------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
--=======================================================================================================================
-- Text Utilities (Adapted from bc1's EUI)
--=======================================================================================================================
local L = Locale.ConvertTextKey
local S = string.format

local table = {
	insert = table.insert,
	concat = table.concat,
	remove = table.remove,
	sort = table.sort,
	maxn = table.maxn,
	unpack = unpack or table.unpack,-- depends on Lua version
	count = table.count,--Firaxis specific
	fill = table.fill,--Firaxis specific
}
function table:append( text )
	self[#self] = self[#self] .. text
end
function table:insertLocalized( ... )
	return self:insert( L( ... ) )
end
function table:insertIf( s )
	if s then
		return self:insert( s )
	end
end
function table:insertLocalizedIf( ... )
	if ... then
		return self:insert( L( ... ) )
	end
end
function table:insertLocalizedIfNonZero( textKey, ... )
	if ... ~= 0 then
		return self:insert( L( textKey, ... ) )
	end
end
function table:insertLocalizedBulletIfNonZero( a, b, ... )
	if tonumber( b ) then
		if b ~= 0 then
			return self:insert( "[ICON_BULLET]" .. L( a, b, ... ) )
		end
	elseif ... ~= 0 then
		return self:insert( a .. L( b, ... ) )
	end
end

table.__index = table
setmetatable( table, {__call = function(self, ...) return setmetatable( {...}, table ) end } )
--=======================================================================================================================
-- City State Utilities (Adapted from bc1's EUI)
--=======================================================================================================================
local function AddPreWrittenHelpTextAndConcat( tips, row ) -- assumes tips is custom EUI table object
	local tip = row and row.Help and L( row.Help ) or ""
	if tip ~= "" then
		tips:insertIf( #tips > 2 and "----------------" )
		tips:insert( tip )
	end
	return tips:concat( "[NEWLINE]" )
end

local function TextColor( c, s )
	return c..s.."[ENDCOLOR]"
end
local function UnitColor( s )
	return TextColor("[COLOR_UNIT_TEXT]", s)
end

local function TechColor( s )
	return TextColor("[COLOR_CYAN]", s)
end

function GetAllyText( majorPlayerID, minorPlayerID )

	local majorPlayer = Players[ majorPlayerID ]
	local minorPlayer = Players[ minorPlayerID ]

	if majorPlayer and minorPlayer then
		local allyID = minorPlayer:GetAlly()
		local ally = Players[ allyID ]
		-- Has an ally
		if ally then
			-- Not us
			if allyID ~= majorPlayerID then
				-- Someone we know
				if Teams[majorPlayer:GetTeam()]:IsHasMet( ally:GetTeam() ) then
					return L( ally:GetCivilizationShortDescriptionKey() )
				-- Someone we haven't met
				else
					return L"TXT_KEY_UNMET_PLAYER"
				end
			-- Us
			else
				return "[COLOR_POSITIVE_TEXT]" .. L"TXT_KEY_YOU" .. "[ENDCOLOR]"
			end
		-- No ally
		else
			return L"TXT_KEY_CITY_STATE_NOBODY"
		end
	end

	return ""
end

function GetCityStateResourceExports(pCityState)
	local pCapital = pCityState:GetCapitalCity()
	if (pCapital ~= nil) then
		local strResourceText = ""

		local iCityX = pCapital:GetX()
		local iCityY = pCapital:GetY()

		local iNumResourcesFound = 0
		local tResourceList = {}

		local iRange = GameDefines.MINOR_CIV_RESOURCE_SEARCH_RADIUS or 5
		local iCloseRange = math.floor((iRange/2))

		for i = 0, (iRange+1) * iRange * 3 do
			local pTargetPlot = pCapital:GetCityIndexPlot(i)
			if pTargetPlot ~= nil then

				local iOwner = pTargetPlot:GetOwner()

				local iX = pTargetPlot:GetX()
				local iY = pTargetPlot:GetY()
				local iDistance = Map.PlotDistance(iCityX, iCityY, iX, iY)

				if (iOwner == pCityState:GetID() or (iOwner == -1 and not(iDistance > iCloseRange))) then
					local iResourceType = pTargetPlot:GetResourceType(Game.GetActiveTeam())
					if (iResourceType ~= -1) then

						if (Game.GetResourceUsageType(iResourceType) ~= ResourceUsageTypes.RESOURCEUSAGE_BONUS) then

							if (tResourceList[iResourceType] == nil) then
								tResourceList[iResourceType] = 0
							end
							tResourceList[iResourceType] = tResourceList[iResourceType] + pTargetPlot:GetNumResource()

						end

					end
				end
			end
		end

		for iResourceType, iAmount in pairs(tResourceList) do
			if (iNumResourcesFound > 0) then
				strResourceText = strResourceText .. ", "
			end
			local pResource = GameInfo.Resources[iResourceType]
			strResourceText = strResourceText .. pResource.IconString .. " [COLOR_POSITIVE_TEXT]" .. L(pResource.Description) .. " (" .. iAmount .. ") [ENDCOLOR]"
			iNumResourcesFound = iNumResourcesFound + 1
		end

		if strResourceText == "" then return end
		return strResourceText
	end
end
--=======================================================================================================================
-- UI: Main Code
--=======================================================================================================================
local pResolutionChoiceManager = InstanceManager:new("ResolutionChoiceInstance", "ResolutionChoiceButton", Controls.ResolutionChoiceStack)
local iMode = 2
local iSelected = nil

function Round(iNum)
	return (math.floor(iNum/5 + 0.5) * 5)
end

-- Used for Piano Keys
local ltBlue = {19/255,32/255,46/255,120/255}
local dkBlue = {12/255,22/255,30/255,120/255}

local tIcons = {}
	tIcons[GameInfoTypes.MINOR_TRAIT_CULTURED] 		= "Cultural128.dds"
	tIcons[GameInfoTypes.MINOR_TRAIT_MILITARISTIC] 	= "Militzaristic128.dds"
	tIcons[GameInfoTypes.MINOR_TRAIT_MARITIME] 		= "Maritime128.dds"
	tIcons[GameInfoTypes.MINOR_TRAIT_MERCANTILE] 	= "Mercantile128.dds"
	tIcons[GameInfoTypes.MINOR_TRAIT_RELIGIOUS] 	= "Religious128.dds"
local g_PersonalityInfo = {
	[MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY]	 	= "[COLOR_POSITIVE_TEXT]" .. L("TXT_KEY_CITY_STATE_PERSONALITY_FRIENDLY") .. "[ENDCOLOR]",
	[MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL] 		= L("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL"),
	[MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE] 		= "[COLOR_NEGATIVE_TEXT]" .. L("TXT_KEY_CITY_STATE_PERSONALITY_HOSTILE") .. "[ENDCOLOR]",
	[MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_IRRATIONAL] 	= L("TXT_KEY_CITY_STATE_PERSONALITY_IRRATIONAL"),
}


function ProcessCityScreen()

	Controls.ResolutionChoicePopup:SetHide(false)
	pResolutionChoiceManager:ResetInstances()
	local pCity = UI.GetHeadSelectedCity()
	local bSetColor = false
	local pActivePlayer = Players[Game.GetActivePlayer()]
	local iGSP = load(pActivePlayer, "GSP") or 0
	Controls.GSPTally:LocalizeAndSetText("TXT_KEY_MC_ASHANTI_UI_GSP_TALLY", iGSP)

	if iMode == 1 then
	--====================
	-- City-States
	--====================
		local tTable = {}
		for iPlayer, pPlayer in pairs(Players) do
			if pPlayer:IsEverAlive() and pPlayer:IsMinorCiv() and pPlayer:IsAlive() and (Teams[pActivePlayer:GetTeam()]:IsHasMet(pPlayer:GetTeam())) then
				table.insert(tTable, pPlayer)
			end
		end
		table.sort(tTable,
			function (pPlayer1, pPlayer2)
			return Locale.Compare(pPlayer1:GetName(), pPlayer2:GetName()) < 0
			end
		)
		--====================
		-- City-States: Cont.
		--====================
		for iKey, pPlayer in ipairs(tTable) do
			local iPlayer = pPlayer:GetID()

			pResolutionChoiceManager:BuildInstance()
			local tInstance = pResolutionChoiceManager:GetInstance()
			if (bSetColor == false) then
				tInstance.Box:SetColorVal(unpack(ltBlue))
			else
				tInstance.Box:SetColorVal(unpack(dkBlue))
			end
			bSetColor = not bSetColor

			if not(iSelected) then iSelected = iPlayer end

			tInstance.ResolutionChoiceName:SetText(pPlayer:GetName())
			CivIconHookup(pPlayer:GetID(), 64, tInstance.CivIcon, tInstance.CivIconBG, tInstance.CivIconShadow, false, true)

			tInstance.ResolutionChoiceButton:RegisterCallback(Mouse.eLClick, 
				function()
					iSelected = iPlayer
					ProcessCityScreen()
				end
			)

			local bWar = Player_IsWarWith(pPlayer, pActivePlayer)
			tInstance.Disable:SetHide(not(bWar))
			if bWar then
				tInstance.ResolutionChoiceName:SetText("[COLOR_NEGATIVE_TEXT]" .. pPlayer:GetName() .. " (WAR)")
			end
		end

		local pCityState = Players[iSelected]

		if not(pCityState) then
			Controls.RightStack:SetHide(true)
			Controls.NoneAvailable:SetHide(false)
			return
		end

		local iTrait = pCityState:GetMinorCivTrait()
		local iAlly = pCityState:GetAlly()
		local sAlly = GetAllyText(pCity:GetOwner(), iSelected)
		local iFriendship = pCityState:GetMinorCivFriendshipWithMajor(Game.GetActivePlayer())

		if iAlly ~= -1 and iAlly ~= Game.GetActivePlayer() then
			sAlly = sAlly .. " (" .. pCityState:GetMinorCivFriendshipWithMajor(iAlly) .. "[ICON_INFLUENCE])"
		end

		Controls["128Icon"]:SetTexture(tIcons[pCityState:GetMinorCivTrait()])
		Controls["128Icon"]:SetTextureOffsetVal(0,0)

		local tips = table(TechColor(Locale.ToUpper(pCityState:GetName())))
		tips:insert(iFriendship .. " [ICON_INFLUENCE]")
		tips:insert("----------------")
		for key, value in pairs(MinorCivTraitTypes) do
			if iTrait == value then
				tips:insertIf(L("TXT_KEY_CITY_STATE" .. key:sub(16) .. "_ADJECTIVE"))
				break
			end
		end
		tips:insertIf(L(g_PersonalityInfo[pCityState:GetPersonality()]))
		tips:insertIf(L("TXT_KEY_POP_CSTATE_ALLIED_WITH") .. " " .. sAlly)
		tips:insert("----------------")
		tips:insertIf(GetCityStateResourceExports(pCityState))
		Controls.Description:LocalizeAndSetText(tips:concat("[NEWLINE]"))

		--====================
		-- Buttons
		--====================
		local iCSMod = load(pActivePlayer, "iCSMod") or 1
		local bWar = Player_IsWarWith(pCityState, pActivePlayer)

		local iCostInfluence = Round(150 * iCSMod)
		Controls.Button1Desc:LocalizeAndSetText("TXT_KEY_MC_ASHANTI_UI_INFLUENCE", pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_SMALL"]), iCostInfluence)
		Controls.Button1:SetToolTipString(L("TXT_KEY_MC_ASHANTI_UI_INFLUENCE_HELP", pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_SMALL"]), iCostInfluence))
		Controls.Button1Disable:SetHide(not(bWar) and not(iGSP<iCostInfluence))
		Controls.Button1:RegisterCallback(Mouse.eLClick, 
			function()
				pCityState:ChangeMinorCivFriendshipWithMajor(pActivePlayer:GetID(), pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_SMALL"]))
				save(pActivePlayer, "GSP", (iGSP-iCostInfluence))
				ProcessCityScreen()
			end
		)

		local iCostInfluence2 = Round(300 * iCSMod)
		Controls.Button2:SetHide(false)
		Controls.Button2Desc:LocalizeAndSetText("TXT_KEY_MC_ASHANTI_UI_INFLUENCE", pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_MEDIUM"]), iCostInfluence2)
		Controls.Button2:SetToolTipString(L("TXT_KEY_MC_ASHANTI_UI_INFLUENCE_HELP", pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_MEDIUM"]), iCostInfluence2))
		Controls.Button2Disable:SetHide(not(bWar) and not(iGSP<iCostInfluence2))
		Controls.Button2:RegisterCallback(Mouse.eLClick, 
			function()
				pCityState:ChangeMinorCivFriendshipWithMajor(pActivePlayer:GetID(), pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_MEDIUM"]))
				save(pActivePlayer, "GSP", (iGSP-iCostInfluence2))
				ProcessCityScreen()
			end
		)

		local iCostIntegrate = Round(1000 * iCSMod)
		Controls.Button3:SetHide(false)
		Controls.Button3Desc:LocalizeAndSetText("TXT_KEY_MC_ASHANTI_UI_INTEGRATE", pCityState:GetName(), iCostIntegrate)
		Controls.Button3:SetToolTipString(L("TXT_KEY_MC_ASHANTI_UI_INTEGRATE_HELP", iCostIntegrate, pCityState:GetName()))
		Controls.Button3Disable:SetHide(not(bWar) and not(iGSP<iCostIntegrate))
		Controls.Button3:RegisterCallback(Mouse.eLClick, 
			function()
				for pUnit in pCityState:Units() do
					Player_ConvertUnit(pUnit, pActivePlayer)
				end
				for pCSCity in pCityState:Cities() do
					pActivePlayer:AcquireCity(pCSCity, false, true)
				end
				save(pActivePlayer, "GSP", (iGSP-iCostIntegrate))
				iSelected = nil
				Events.SerialEventExitCityScreen()

				for iPlayer, pPlayer in pairs(Players) do
					if pPlayer:IsAlive() then
						if Player_IsHasMet(pPlayer, pActivePlayer) or Player_IsHasMet(pPlayer, pCityState) then
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MINOR_BUYOUT, L("TXT_KEY_MC_ASHANTI_MINOR_BUYOUT", pCityState:GetName()), L("TXT_KEY_MC_ASHANTI_UI_TITLE"))
						end
					end
				end
			end
		)

		--====================
		--====================
	else
	--====================
	-- Units
	--====================
		local tTable = {}
		for tUnit in GameInfo.Units() do
			if tUnit.Cost > 0 then
				table.insert(tTable, tUnit)
			end
		end
		table.sort(tTable,
			function (tA, tB)
			 return tA.Cost < tB.Cost
			end
		)

		-- Handle GPs as a special weird case
		if load(pActivePlayer, "Decisions_AshantiAsantemanhyiamu") then 
			for tUnitClass in GameInfo.UnitClasses() do
				local sUnit = JFD_GetUniqueUnit(pActivePlayer, tUnitClass.Type)
				local tUnit = GameInfo.Units[sUnit]
				if tUnit ~= nil and tUnit.Special == "SPECIALUNIT_PEOPLE" and not(tUnit.Cost > 0) then
					table.insert(tTable, tUnit)
				end
			end
		end
		--====================
		-- Units: Cont.
		--====================
		for iKey, tUnit in ipairs(tTable) do
			local iUnit = tUnit.ID
			print(tUnit.Type, tUnit.CombatClass, tUnit.Domain)
			if (pCity:CanTrain(tUnit.ID, 0, 1) and (tUnit.CombatClass ~= nil and tUnit.CombatClass ~= "UNITCOMBAT_CIVILIAN") and (tUnit.Domain == "DOMAIN_LAND" or tUnit.Domain == "DOMAIN_SEA")) or
				((tUnit.Special == "SPECIALUNIT_PEOPLE") and (not(tUnit.PrereqTech) or Teams[pActivePlayer:GetTeam()]:IsHasTech(GameInfoTypes[tUnit.PrereqTech])))
			then
				pResolutionChoiceManager:BuildInstance()
				local tInstance = pResolutionChoiceManager:GetInstance()
				if (bSetColor == false) then
					tInstance.Box:SetColorVal(unpack(ltBlue))
				else
					tInstance.Box:SetColorVal(unpack(dkBlue))
				end
				bSetColor = not bSetColor

				if not(iSelected) then iSelected = iUnit end

				local iBaseCost = tUnit.Cost
				if iBaseCost < 0 then iBaseCost = 220 end
				local iCost = Round(iBaseCost ^ 0.8 * 2)
				if tUnit.Special == "SPECIALUNIT_PEOPLE" then
					iTime = load(pActivePlayer, "SPECIALUNIT_PEOPLE") or 1
					iCost = iTime * iCost
				end

				tInstance.ResolutionChoiceName:SetText(L(tUnit.Description) .. " (" .. iCost .. "[ICON_GOLDEN_STOOL])")
				tInstance.ResolutionChoiceButton:SetToolTipString(GetHelpTextForUnit(iUnit, false))
				IconHookup(tUnit.PortraitIndex, 64, tUnit.IconAtlas, tInstance.CivIconBG)

				tInstance.CivIcon:SetHide(true)
				tInstance.CivIconShadow:SetHide(true)
				tInstance.Disable:SetHide(((tUnit.Special == "SPECIALUNIT_PEOPLE") or pCity:CanTrain(tUnit.ID, 0, 0)) and not(iGSP < iCost))

				tInstance.ResolutionChoiceButton:RegisterCallback(Mouse.eLClick, 
					function()
						iSelected = iUnit
						ProcessCityScreen()
					end
				)				
			end
		end

		local tUnit = GameInfo.Units[iSelected]
		if not(tUnit) then
			Controls.RightStack:SetHide(true)
			Controls.NoneAvailable:SetHide(false)
			return
		end
		IconHookup(tUnit.PortraitIndex, 128, tUnit.IconAtlas, Controls["128Icon"])

		-- Unit XML stats
		local unitName = tUnit.Description
		local combatClass = tUnit.CombatClass and GameInfo.UnitCombatInfos[tUnit.CombatClass]
		local productionCost = tUnit.Cost
		local rangedStrength = tUnit.RangedCombat
		local unitRange = tUnit.Range
		local combatStrength = tUnit.Combat
		local unitMoves = tUnit.Moves
		local unitDomainType = tUnit.Domain
		local freePromotions = table()
		local thisUnitType = {UnitType = tUnit.Type}
		for row in GameInfo.Unit_FreePromotions(thisUnitType) do
			local promotion = GameInfo.UnitPromotions[row.PromotionType]
			if promotion then
				freePromotions:insert( L(promotion.Description) )
				unitRange = unitRange + (promotion.RangeChange or 0)
				unitMoves = unitMoves + (promotion.MovesChange or 0)
			end
		end

		local tips = table(UnitColor(Locale.ToUpper(unitName)) .. (combatClass and " ("..L(combatClass.Description)..")" or ""))
		-- Movement:
		tips:insertIf( unitDomainType ~= "DOMAIN_AIR" and L"TXT_KEY_PEDIA_MOVEMENT_LABEL" .. " " .. unitMoves .. "[ICON_MOVES]" )
		-- Ranged Combat:
		tips:insertIf(rangedStrength > 0 and L"TXT_KEY_PEDIA_RANGEDCOMBAT_LABEL" .. " " .. rangedStrength .. "[ICON_RANGE_STRENGTH]" .. unitRange)
		-- Combat:
		tips:insertIf(combatStrength > 0 and S("%s %g[ICON_STRENGTH]", L"TXT_KEY_PEDIA_COMBAT_LABEL", combatStrength))

		Controls.Description:LocalizeAndSetText(AddPreWrittenHelpTextAndConcat(tips, tUnit))

		--====================
		-- Buttons
		--====================
		local bCanBuy = (tUnit.Special == "SPECIALUNIT_PEOPLE") or pCity:CanTrain(tUnit.ID, 0, 0)
		local iBaseCost = tUnit.Cost
		if iBaseCost < 0 then iBaseCost = 220 end

		local iCost = Round(iBaseCost ^ 0.8 * 2)
		local iTime = nil
		if tUnit.Special == "SPECIALUNIT_PEOPLE" then
			iTime = load(pActivePlayer, "SPECIALUNIT_PEOPLE") or 1
			iCost = iTime * iCost
		end
		Controls.Button1Desc:LocalizeAndSetText("TXT_KEY_MC_ASHANTI_UI_RECRUIT", L(tUnit.Description), iCost)
		Controls.Button1:SetToolTipString(L("TXT_KEY_MC_ASHANTI_UI_RECRUIT_HELP", L(tUnit.Description), iCost))
		Controls.Button1Disable:SetHide(bCanBuy and not(iGSP<iCost))
		Controls.Button1:RegisterCallback(Mouse.eLClick, 
			function()
				local pUnit = InitUnitFromCity(pCity, tUnit.ID, 1)[1]
				LuaEvents.MC_GoldenStoolUnitPurchased(pActivePlayer:GetID(), pCity:GetID(), pUnit:GetID())

				save(pActivePlayer, "GSP", (iGSP-iCost))
				if tUnit.Special == "SPECIALUNIT_PEOPLE" then
					save(pActivePlayer, "SPECIALUNIT_PEOPLE", (iTime+1))
				end
				ProcessCityScreen()
			end
		)

		local iCost2 = Round(iBaseCost ^ 0.8 * 2.5)
		Controls.Button2Desc:LocalizeAndSetText("TXT_KEY_MC_ASHANTI_UI_RECRUIT_ELITE", L(tUnit.Description), math.ceil(iCost2))
		Controls.Button2:SetToolTipString(L("TXT_KEY_MC_ASHANTI_UI_RECRUIT_ELITE_HELP", L(tUnit.Description), math.ceil(iCost2)))
		Controls.Button2:SetHide(tUnit.CombatClass == nil or tUnit.CombatClass == "UNITCOMBAT_GREAT_PEOPLE" or tUnit.CombatClass == "UNITCOMBAT_CIVILIAN")
		Controls.Button2Disable:SetHide(bCanBuy and not(iGSP<iCost2))
		Controls.Button2:RegisterCallback(Mouse.eLClick, 
			function()
				local pUnit = InitUnitFromCity(pCity, tUnit.ID, 1)[1]
				pUnit:ChangeExperience(30)
				LuaEvents.MC_GoldenStoolUnitPurchased(pActivePlayer:GetID(), pCity:GetID(), pUnit:GetID())

				save(pActivePlayer, "GSP", (iGSP-iCost2))
				ProcessCityScreen()
			end
		)

		Controls.Button3:SetHide(true)
		--====================
		--====================		
	end

	Controls.ResolutionChoiceStack:CalculateSize()
	Controls.ResolutionChoiceStack:ReprocessAnchoring()
	Controls.ChoiceScrollPanel:CalculateInternalSize()

	Controls.RightStack:SetHide(false)
	Controls.NoneAvailable:SetHide(true)
end
--=======================================================================================================================
-- Swapping Modes
--=======================================================================================================================
IconHookup(GameInfo.Policies.POLICY_CITIZENSHIP.PortraitIndex, 64, GameInfo.Policies.POLICY_CITIZENSHIP.IconAtlas, Controls.UnitsIcon)
Controls.UnitsCategory:RegisterCallback(Mouse.eLClick, 
	function()
		iMode = 2
		iSelected = nil
		ProcessCityScreen()
	end
)

IconHookup(GameInfo.Policies.POLICY_CONSULATES.PortraitIndex, 64, GameInfo.Policies.POLICY_CONSULATES.IconAtlas, Controls.CSIcon)
Controls.CSCategory:RegisterCallback(Mouse.eLClick, 
	function()
		iMode = 1
		iSelected = nil
		ProcessCityScreen()
	end
)
--=======================================================================================================================
-- MCIS Support
--=======================================================================================================================
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "MC_Ashanti_UI", ["SortOrder"] = 1})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(sKey, pInstance)
	if sKey ~= "MC_Ashanti_UI" then return end

	local pPlayer = Players[Game.GetActivePlayer()]
	if pPlayer:GetCivilizationType() ~= iCiv then
		return
		pInstance.IconFrame:SetHide(true)
	end


	local iGSP = load(pPlayer, "GSP") or 0
	pInstance.IconImage:SetTexture("GoldenStool_64.dds")
	pInstance.IconFrame:SetToolTipString(L("TXT_KEY_MC_ASHANTI_UI_GSP_TALLY", iGSP) .. "[NEWLINE][NEWLINE]" .. L("TXT_KEY_TRAIT_GOLDEN_STOOL"))
	pInstance.IconFrame:RegisterCallback(Mouse.eLClick, 
		function()
			bCityScreenOpen = false
			ProcessCityScreen()
			Controls.ResolutionChoicePopup:SetHide(false)
		end
	)	
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

function EventExitCityScreen()
	bCityScreenOpen = false
	Controls.ResolutionChoicePopup:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen)

function CloseResolutionChoicePopup()
	bCityScreenOpen = false
	Controls.ResolutionChoicePopup:SetHide(true)
end
Controls.CloseChoicePopupButton:RegisterCallback(Mouse.eLClick, CloseResolutionChoicePopup)
--=======================================================================================================================
-- GSP Acquisition
--=======================================================================================================================
function CityCaptured(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
	local pPlayer = Players[iNewOwner]
	if pPlayer:GetCivilizationType() ~= iCiv then return end

	local pCity = (Map.GetPlot(iCityX, iCityY):GetPlotCity())

	if not(bConquest) then return end

	local iGSP = load(pPlayer, "GSP") or 0
	local iToAdd = Round(pCity:GetPopulation() * 40)
	save(pPlayer, "GSP", (iGSP+iToAdd))

	if iOwner == Game.GetActivePlayer() then
		local sName = pCity:GetName()
		local sToolTip = L("TXT_KEY_MC_ASHANTI_UI_CONQUEST", iToAdd, sName)
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sToolTip, L("TXT_KEY_MC_ASHANTI_UI_TITLE"))
	end
end
GameEvents.CityCaptureComplete.Add(CityCaptured)

function CityConvertsReligion(iOwner, iReligion, iCityX, iCityY)
	for iPlayer, pPlayer in pairs(Players) do
		

		if (pPlayer:IsEverAlive() and not(pPlayer:IsMinorCiv()) and pPlayer:GetCapitalCity()) then

			if iReligion == JFD_GetMainReligionID(iPlayer) then
				if pPlayer:GetCivilizationType() == iCiv then

					local pCity = (Map.GetPlot(iCityX, iCityY):GetPlotCity())
					local iOriginalOwner = pCity:GetOriginalOwner()
					local iTurnFounded = pCity:GetGameTurnFounded ()	--Used to Compile Unique City ID
					local iCityID = ("X" .. iCityX .. "Y" .. iCityY .. "P" .. iOriginalOwner .. "T" .. iTurnFounded)	--Unique City ID
					if not(load(pPlayer, iCityID)) then
						local iGSP = load(pPlayer, "GSP") or 0
						local iToAdd = Round(pCity:GetPopulation() * 15)
						save(pPlayer, "GSP", (iGSP+iToAdd))
						save(pPlayer, iCityID, true)

						if iPlayer == Game.GetActivePlayer() then
							local sName = pCity:GetName()
							local iTeam = pPlayer:GetTeam()
							if not(pCity:IsVisible(iTeam)) then
								sName = L(TXT_KEY_MC_ASHANTI_UI_CONVERSION_UNKNOWN_CITY)
							end

							local sToolTip = L("TXT_KEY_MC_ASHANTI_UI_CONVERSION", iToAdd, sName)
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sToolTip, L("TXT_KEY_MC_ASHANTI_UI_TITLE"))
						end
					end

				end
			end
		end
	end
end
GameEvents.CityConvertsReligion.Add(CityConvertsReligion)

function GreatPersonExpended(iPlayer, iUnitType)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iCiv then return end
	local iGSP = load(pPlayer, "GSP") or 0
	save(pPlayer, "GSP", (iGSP+80))
	if iPlayer == Game.GetActivePlayer() then
		local sToolTip = L("TXT_KEY_MC_ASHANTI_UI_GP_EXPENDED", 80)
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sToolTip, L("TXT_KEY_MC_ASHANTI_UI_TITLE"))
	end
end
GameEvents.GreatPersonExpended.Add(GreatPersonExpended)

function ChangeGSP(iPlayer, iDelta)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iCiv then return end
	local iGSP = load(pPlayer, "GSP") or 0
	local iNewGSP = iGSP + iDelta
	if iNewGSP < 0 then iNewGSP = 0 end
	save(pPlayer, "GSP", iNewGSP)	
end
LuaEvents.ChangeGSP.Add(ChangeGSP)
--=======================================================================================================================
-- AI Support
--=======================================================================================================================
function MC_Ashanti_AI_Support(iPlayer)
    local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iCiv then return end
	if pPlayer:IsHuman() then return end

	local iGoal = load(pPlayer, "Goal")
	local iCSMod = load(pPlayer, "iCSMod") or 1
	local iGSP = load(pPlayer, "GSP") or 0

	if iGoal == nil then 
		local tTable = {1000, 300, 300, 150, 150}
		iGoal = tTable[GetRandom(1, #tTable)]
		save(pPlayer, "Goal", iGoal)
	end

	iGoal = Round(iGoal * iCSMod)

	if not(iGSP<iGoal) then

		local tTable = {}
		for iPlayer, pCityState in pairs(Players) do
			if pCityState:IsEverAlive() and pCityState:IsMinorCiv() and pCityState:IsAlive() and (Teams[pPlayer:GetTeam()]:IsHasMet(pCityState:GetTeam())) and not(Player_IsWarWith(pPlayer, pCityState)) then
				table.insert(tTable, pCityState)
			end
		end
		if #tTable<1 then return end
		local pCityState = tTable[GetRandom(1, #tTable)]

		if iGoal == Round(300 * iCSMod) then
			pCityState:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_SMALL"]))
			save(pPlayer, "GSP", (iGSP-iGoal))
			save(pPlayer, "Goal", nil)
		elseif iGoal == Round(500 * iCSMod) then
			pCityState:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), pCityState:GetFriendshipFromGoldGift(Game.GetActivePlayer(), GameDefines["MINOR_GOLD_GIFT_MEDIUM"]))
			save(pPlayer, "GSP", (iGSP-iGoal))
			save(pPlayer, "Goal", nil)
		elseif iGoal == Round(1000 * iCSMod) then
			for pUnit in pCityState:Units() do
				Player_ConvertUnit(pUnit, pPlayer)
			end
			for pCSCity in pCityState:Cities() do
				pPlayer:AcquireCity(pCSCity, false, true)
			end
			save(pPlayer, "GSP", (iGSP-iGoal))
			save(pPlayer, "Goal", nil)

			for iPlayer, pPlayer2 in pairs(Players) do
				if pPlayer2:IsAlive() then
					if Player_IsHasMet(pPlayer2, pPlayer) or Player_IsHasMet(pPlayer2, pCityState) then
						pPlayer2:AddNotification(NotificationTypes.NOTIFICATION_MINOR_BUYOUT, L("TXT_KEY_MC_ASHANTI_MINOR_BUYOUT", pCityState:GetName()), L("TXT_KEY_MC_ASHANTI_UI_TITLE"))
					end
				end
			end	

		end
	end
end
GameEvents.PlayerDoTurn.Add(MC_Ashanti_AI_Support)
--=======================================================================================================================
-- Decision Support
--=======================================================================================================================
function Decision_Enacted(iPlayer, sDecision)
	print(sDecision .. iPlayer)
	local pPlayer = Players[iPlayer]
	if sDecision == "Decisions_AshantiAsantemanhyiamu" then
		save(pPlayer, "Decisions_AshantiAsantemanhyiamu", true)
	elseif sDecision == "Decisions_AshantAgyina" then
		save(pPlayer, "iCSMod", 0.8)
	end
end
LuaEvents.DecisionEnacted.Add(Decision_Enacted)

function PlayerEnteredNewEra(iPlayer)
	local pPlayer = Players[iPlayer]
	save(pPlayer, "Decisions_AshantiAsantemanhyiamu", nil)
	save(pPlayer, "iCSMod", nil)
end
LuaEvents.PlayerEnteredNewEra.Add(PlayerEnteredNewEra)
--=======================================================================================================================
--=======================================================================================================================