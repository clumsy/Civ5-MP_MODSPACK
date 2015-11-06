--==============================================================================================================================================================================================================================================
--Programmed by TarcisioCM
--Handles part of the UA
--==============================================================================================================================================================================================================================================
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "TarcisioCMCleopatraUA";
--==============================================================================================================================================================================================================================================
--==~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~==
--==============================================================================================================================================================================================================================================
local civilizationID = GameInfoTypes["CIVILIZATION_LITE_TARCISIO_PTOLEMIES"]

local tcmunit1 = GameInfoTypes["UNIT_MECHANIZED_INFANTRY"]
local tcmunit2 = GameInfoTypes["UNIT_INFANTRY"]
local tcmunit3 = GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"]
local tcmunit4 = GameInfoTypes["UNIT_RIFLEMAN"]
local tcmunit5 = GameInfoTypes["UNIT_MUSKETMAN"]
local tcmunit6 = GameInfoTypes["UNIT_PIKEMAN"]
local tcmunit7 = GameInfoTypes["UNIT_LITE_TARCISIO_PTOLEMIES_GALATIAN_GUARD"]
local tcmunit8 = GameInfoTypes["UNIT_SPEARMAN"]
local tcmunit9 = GameInfoTypes["UNIT_WARRIOR"]

local tcmunitList = {
	tcmunit1,
	tcmunit2,
	tcmunit3,
	tcmunit4,
	tcmunit5,
	tcmunit6,
	tcmunit7,
	tcmunit8,
	tcmunit9
	}
--==============================================================================================================================================================================================================================================
--==============================================================================================================================================================================================================================================
--==============================================================================================================================================================================================================================================
--==============================================================================================================================================================================================================================================
function CleopatraUApt2(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID then
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local otherCiv = Players[iPlayer]
			if otherCiv ~= player and otherCiv:IsAlive() then
				if player:IsDoF(iPlayer) and not(otherCiv:IsMinorCiv()) and not(otherCiv:IsBarbarian()) then
					if load(player, "cleoIsFriendsWith: " .. iPlayer) == nil then
						local militaryUnit
						for _, unitID in ipairs(tcmunitList) do
							if player:CanTrain(unitID) then
								militaryUnit = unitID
								break
							end
						end

						local culture = player:GetJONSCulturePerTurnFromCities() + math.ceil((player:GetCurrentEra() + 1) * 10)
						player:ChangeJONSCulture(culture)

						local numUnits = math.ceil((player:GetCurrentEra() + 1) * 0.33)
						if numUnits < 1 then
							numUnits = 1
						end

						if militaryUnit == tcmunit7 then
							if player:GetNumResourceAvailable(GameInfoTypes["RESOURCE_IRON"], true) > numUnits then
								militaryUnit = GameInfoTypes["UNIT_ROMAN_LEGION"]
							end
						end

						for potato = 0, numUnits -1, 1 do
							player:InitUnit(militaryUnit, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
						end

						save(player, "cleoIsFriendsWith: " .. iPlayer, true)
					end
				else
					if load(player, "cleoIsFriendsWith: " .. iPlayer) == true then
						save(player, "cleoIsFriendsWith: " .. iPlayer, nil)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CleopatraUApt2)