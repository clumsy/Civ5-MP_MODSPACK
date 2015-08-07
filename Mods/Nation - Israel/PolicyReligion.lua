-- ProphetEra
-- Author: muxu
-- DateCreated: 4/24/2013 10:42:53 AM
--------------------------------------------------------------
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "LeugiIsraelScripts";

print("The Israel Mod Lua loaded succesfully")




local iCivIsrael = GameInfoTypes.CIVILIZATION_LEUGI_ISRAEL
local iBuildIsrael = GameInfoTypes.BUILDING_ISRAEL
local iBuildIsraelPol = GameInfoTypes.BUILDING_ISRAEL_POLICY
local iBuildIsraelPolc = GameInfo.BuildingClasses.BUILDINGCLASS_ISRAEL_POLICY.ID
local iKibbutz = GameInfoTypes.IMPROVEMENT_KIBBUTZ
local id = GameInfo.Improvements.IMPROVEMENT_KIBBUTZ.ID
SpeedFaith = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].FaithPercent / 100)

function FaithPolicyPoints(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == iCivIsrael) then
	TraitCount = load (pPlayer, "LeugiIsraelTraitCount")
	if TraitCount == nil then
		TraitCount = 0
	end
	TraitCount = TraitCount + 1
	save (pPlayer, "LeugiIsraelTraitCount", TraitCount)
	iFaith = 12 * TraitCount
	if iFaith > 600 then
		iFaith = 600
	end
	iFaith = math.floor(iFaith * SpeedFaith)
	pPlayer:ChangeFaith(iFaith)
	if pPlayer:IsHuman() then
		Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ISRAEL_POLICY_FAITH", iFaith))
		Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
		
	end
	end
end


GameEvents.PlayerAdoptPolicy.Add(FaithPolicyPoints);
GameEvents.PlayerAdoptPolicyBranch.Add(FaithPolicyPoints);



--function FreeProphet(arg0, currPlayer)
--  print("Someone entered a new era...")
--  local iEraPlayer = Players[currPlayer]

  -- Despite being named "Type", GetCivilizationType() actually returns the ID column from the Civilizations table - thanks Firaxis!!!
--  if (iEraPlayer:GetCivilizationType() == iCivIsrael) then
--    print("Israel got into a whole new Era")-
--	local iEraCity = iEraPlayer:GetCapitalCity();
--	iEraPlayer:ChangeNumFaithGreatPeople(1);
--	print("A new prophet is here!")
--	end
--end

--Events.SerialEventEraChanged.Add(FreeProphet)



function ImprovementHappiness(iPlayer)
	
	local pPlayer = Players[iPlayer];
		if (pPlayer:IsAlive()) then
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					if ( plot:GetOwner() == pCity:GetOwner() ) then
						numkib = 0;
						if (plot:GetImprovementType() == iKibbutz) then
							numkib = ( numkib + 1 )
						end
						if (numkib > 0 ) then
							pCity:SetNumRealBuilding(iBuildIsrael, 1)
						end
							

					end
				end
			end
		end
		end
		--if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BOLIVIA) then
end

--GameEvents.PlayerDoTurn.Add(ImprovementHappiness)


function PolicyReligion(iPlayer)
  --if (type == NotificationTypes.NOTIFICATION_FOUND_RELIGION) then
		for _, pPlayer in pairs(Players) do
			if (pPlayer:IsAlive()) then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_LEUGI_ISRAEL) then
					if (pPlayer:HasCreatedReligion()) then
						if (Game.GetBuildingClassCreatedCount(iBuildIsraelPolc) == 0) then
							for pCity in pPlayer:Cities() do
								if (pCity:IsCapital()) then
								pCity:SetNumRealBuilding(iBuildIsraelPol, 1)
								end
							end
						end
					end
				end
			end
		end
 -- end
end
--Events.NotificationAdded.Add(OnNotificationAdded)
--GameEvents.PlayerDoTurn.Add(PolicyReligion)



local iProphetID = GameInfo.Units.UNIT_PROPHET.ID;
local GeneralAI = GameInfo.UnitAIInfos.UNITAI_GENERAL.ID;

function ProphetaAIchange(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivIsrael) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
				pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iProphetID) then
                    if (pPlayer:HasCreatedReligion()) then
						pUnit.SetUnitAIType(GeneralAI);
					end
                end
            end
        end
    end
end

Events.SerialEventUnitCreated.Add(ProphetAIchange)



function KibbutzReplace(iHexX, iHexY, iContinent1, iContinent2)
	for _, pPlayer in pairs(Players) do
			if (pPlayer:IsAlive()) then
				for pCity in pPlayer:Cities() do
					local i;
					for i = 0, pCity:GetNumCityPlots() - 1, 1 do
						local plot = pCity:GetCityIndexPlot( i );
						if (plot ~= nil) then
							if ( plot:GetOwner() == pCity:GetOwner() ) then
								if (plot:GetImprovementType() == iKibbutz) then
								
								plot:SetImprovementType(iKibbutz);
								print("Kibbutz!");
								end
							end
						end
					end
				end
			end
	end
end
GameEvents.PlayerDoTurn.Add(KibbutzReplace)