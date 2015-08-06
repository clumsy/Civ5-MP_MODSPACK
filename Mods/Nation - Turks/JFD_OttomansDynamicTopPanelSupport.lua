-- JFD_OttomanDynamicTopPanelSupport
-- Author: JFD
-- DateCreated: 6/5/2015 2:42:50 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCommunityPatchDLL
function JFD_IsCommunityPatchDLL()
	local communityPatchDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	local isUsingCPDLL = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == communityPatchDLLID) then
			isUsingCPDLL = true
			break
		end
	end

	return isUsingCPDLL
end

-- JFD_IsUsingPiety
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
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
local isPietyActive = JFD_IsUsingPiety()
local isUsingCPDLL = JFD_IsCommunityPatchDLL()

-- JFD_GetMajorityReligionID
function JFD_GetMajorityReligionID(playerID)
	local player = Players[playerID]
	local religionID = -1
	if isPietyActive then
		religionID = JFD_GetStateReligion(playerID)
	else
		local religionCreated = player:GetReligionCreatedByPlayer()
		if religionCreated > 0 then
			religionID = religionCreated
		else
			local capital = player:GetCapitalCity()
			if capital then
				religionID = capital:GetReligiousMajority()
			end
		end
	end
	return religionID
end

-- JFD_OttomanGetGoldFromPuppets
function JFD_OttomanGetGoldFromPuppets(playerID)
	local player = Players[playerID]
	local numGoldFromPuppets = 0
	local religionID = JFD_GetMajorityReligionID(playerID)
	if isUsingCPDLL then
		for city in player:Cities() do
			if city:HasAnyDomesticTradeRoute() then
				numGoldFromPuppets = numGoldFromPuppets + 2
			end
		end
	else
		for city in player:Cities() do
			if city:IsPuppet() then
				for _,v in ipairs(player:GetTradeRoutes()) do
					local fromCivilizationID = v.FromCivilizationType
					local toCivilizationID = v.ToCivilizationType
					if fromCivilizationID == toCivilizationID then
						local fromCity = v.FromCity
						local toCity = v.ToCity
						if (fromCity == city or toCity == city) then
							numGoldFromPuppets = numGoldFromPuppets + 2
						end
					end
				end
			end
		end
	end
	return numGoldFromPuppets
end

-- JFD_OttomanGetFaithFromPuppets
function JFD_OttomanGetFaithFromPuppets(playerID)
	local player = Players[playerID]
	local numFaithFromPuppets = 0
	local religionID = JFD_GetMajorityReligionID(playerID)
	if isUsingCPDLL then
		for city in player:Cities() do
			if city:GetReligiousMajority() ~= religionID then
				numFaithFromPuppets = numFaithFromPuppets + 2
			end
		end
	else
		for city in player:Cities() do
			if city:IsPuppet() then
				for _,v in ipairs(player:GetTradeRoutes()) do
					local fromCivilizationID = v.FromCivilizationType
					local toCivilizationID = v.ToCivilizationType
					if fromCivilizationID == toCivilizationID then
						local fromCity = v.FromCity
						local toCity = v.ToCity
						if (fromCity == city or toCity == city) then
							if city:GetReligiousMajority() ~= religionID then
								numFaithFromPuppets = numFaithFromPuppets + 2
							end
						end
					end
				end
			end
		end
	end
	return numFaithFromPuppets
end
--=======================================================================================================================
--=======================================================================================================================


