-- JFD_PolandLithuaniaDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- JFD_GetPolandLithuaniaGAPFromHappiness
--=======================================================================================================================
--  JFD_GetPolandLithuaniaGAPFromHappiness
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetPolandLithuaniaGAPFromHappiness(playerID)
	local player = Players[playerID]
	local numGAPointsFromExcessHappiness = 0
	if player:GetExcessHappiness() > 0 then
		numGAPointsFromExcessHappiness = math.ceil(player:GetExcessHappiness() * 33 / 100)
	end

	return numGAPointsFromExcessHappiness
end
--=======================================================================================================================
--=======================================================================================================================


