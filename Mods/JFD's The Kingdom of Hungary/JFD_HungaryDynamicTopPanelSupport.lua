-- JFD_HungaryDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_GetMainReligionID
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetMainReligionID(playerID)
	local player = Players[playerID] 
	if player:GetCapitalCity() then
		local mainReligionID = player:GetCapitalCity():GetReligiousMajority()
		if JFD_IsUsingPietyPrestige() then
			if JFD_HasStateReligion(playerID) then
				mainReligionID = JFD_GetStateReligion(playerID)
			else
				mainReligionID = -1
			end
		end
	
		return mainReligionID
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
end

if JFD_IsUsingPietyPrestige() then
	include("JFD_PietyUtils")
end
--=======================================================================================================================
-- JFD_GetHungaryGAPFromFPT
--=======================================================================================================================
--  JFD_GetHungaryGAPFromFPT
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetHungaryGAPFromFPT(playerID)
	local player = Players[playerID]
	local mainReligionID = JFD_GetMainReligionID(playerID)
	local numGAPointsFromFaith = 0
	if player:HasReligionInMostCities(mainReligionID) then
		numGAPointsFromFaith = math.ceil(player:GetTotalFaithPerTurn() * 33 / 100)
	end

	return numGAPointsFromFaith
end
--=======================================================================================================================
--=======================================================================================================================


