-- RevolucionarioAnarchies
-- Author: Leugi
-- DateCreated: 8/4/2014 1:27:31 PM
--------------------------------------------------------------

local AnarchyPromo = GameInfoTypes.PROMOTION_ANARCHIST;
nCityStored = nil

local direction_types = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_NORTHWEST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,
}


function AnarchyTrigger(iPlayer)
	nCityStored = nil
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
		if (pUnit:IsHasPromotion(AnarchyPromo)) then

			local uPlot = pUnit:GetPlot();
			if uPlot ~= nil then
				if (uPlot:GetOwner() ~= pUnit:GetOwner() and uPlot:GetOwner() ~= -1) then
					local oTeam = uPlot:GetTeam()
					local teamID = pUnit:GetTeam();
					local pTeam = Teams[teamID];
					local bWar = pTeam:IsAtWar(oTeam);
					if (not bWar) then
					else
						local xPlayer = uPlot:GetOwner()
						nPlayer = Players[xPlayer];
						
						
							for nCity in nPlayer:Cities() do
								if nCity ~= nCityStored or nCityStored == nil then
								local i;
								for i = 0, nCity:GetNumCityPlots() - 1, 1 do
									local plot = nCity:GetCityIndexPlot( i );
									if (plot ~= nil) then
										if plot == uPlot then
											nCity:ChangeResistanceTurns(1)
											local name = pUnit:GetName();
											local civname = nPlayer:GetName();
											if (pPlayer:IsHuman()) then
												local alert = Locale.ConvertTextKey("TXT_KEY_ANARCHY_ATTACK", name, civname);
												Events.GameplayAlertMessage(alert)
											elseif (nPlayer:IsHuman()) then
												local alert = Locale.ConvertTextKey("TXT_KEY_ANARCHY_RECEIVE", name);
												Events.GameplayAlertMessage(alert)
											end
											print ("Revolucionario's Resistance!")
											pUnit:ChangeDamage(20)
											nCityStored = nCity
										end
									end
								end
								end
							end
					end
				end
			end
		end

		end
	end
end


function ResistanceCity(iPlayer)
	nCityStored = nil
	local nPlayer = Players[iPlayer];
	if (nPlayer:IsEverAlive()) then
		for nCity in nPlayer:Cities() do
			local nPlot = nCity:Plot()
			for loop, direction in ipairs(direction_types) do
				local adjPlot = Map.PlotDirection(nPlot:GetX(), nPlot:GetY(), direction);
				
					local unit = adjPlot:GetUnit(0);
					if unit ~= nil then
						local pPlayer = Players[unit:GetOwner()];
	
					local oTeam = nPlot:GetTeam()
					local teamID = unit:GetTeam();
					local pTeam = Teams[teamID];
					local bWar = pTeam:IsAtWar(oTeam);
					if (not bWar) then
					else

						if (unit:IsHasPromotion(AnarchyPromo)) then
							if nCity ~= nCityStored or nCityStored == nil then
								nCity:ChangeResistanceTurns(1)
								local name = unit:GetName();
								local civname = nPlayer:GetName();
								if (pPlayer:IsHuman()) then
									local alert = Locale.ConvertTextKey("TXT_KEY_ANARCHY_ATTACK", name, civname);
									Events.GameplayAlertMessage(alert)
								elseif (nPlayer:IsHuman()) then
									local alert = Locale.ConvertTextKey("TXT_KEY_ANARCHY_RECEIVE", name);
									Events.GameplayAlertMessage(alert)
								end
								print ("Revolucionario's Resistance!")
								nCityStored = nCity
							end
						end


					end
					end
				
			end
		end
	end
end
						



GameEvents.PlayerDoTurn.Add(ResistanceCity)


--------------------
-- The following was to make sure Revolucionarios won't stay more than 50 turns (Standard) alive. I'm leaving this here because its good reference should I need it again.
--------------------

if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
	uTurnTimer = 50
elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
	uTurnTimer = 75
elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
	uTurnTimer = 85
else
	uTurnTimer = 100
end


function RevolucionarioDesertion(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			if (pUnit:IsHasPromotion(AnarchyPromo)) then
				local created = pUnit:GetGameTurnCreated()
				local iTurn = Game.GetGameTurn()
				local Timer = iTurn - created
				if Timer >= uTurnTimer then
					
						local name = pUnit:GetName();
						local utype = pUnit:GetUnitType()
						if (pPlayer:IsHuman()) then
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_UNIT_DIED, Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_DESERTION_DESC", name), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_DESERTION", name), pUnit:GetX(), pUnit:GetY(), utype, utype)
						end
					
						pUnit:Kill();
				end
			end
		end
	end
end



--GameEvents.PlayerDoTurn.Add(RevolucionarioDesertion)

-----------------------------------
--The following is to increase influence from gifted Revolucionarios.... Not sure how functional this is
----------------------------------------------

local iRevolID = GameInfo.Units.UNIT_CUBAN_REVOLUCIONARIO.ID


function UnitGiftedCheck (iPlayer, iUnit)
	local csPlayer = Players[iPlayer];
    	if (csPlayer:IsEverAlive()) then
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
			local tPlayer = Players[i];
			if csPlayer == tPlayer then
				if csPlayer:GetUnitByID(iUnit) ~= nil then
					pUnit = csPlayer:GetUnitByID(iUnit);
					if (pUnit:GetUnitType() == iRevolID) then
						print ("A CS has a Revolucionario!?")
						if pUnit:GetOriginalOwner() ~= csPlayer	then
							print (pUnit:GetOriginalOwner():GetName())
							print ("Original Owner DOES keep the gifting player then :D")
						end	
					end
				end	
			end
		end
	end
end

Events.SerialEventUnitCreated.Add(UnitGiftedCheck);
