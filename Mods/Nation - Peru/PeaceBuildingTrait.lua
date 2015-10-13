-- PeruPeaceBuildingTrait
-- Author: Leugi with the awesome help of Tomatekh
-- DateCreated: 2/11/2014 7:42:22 PM
--------------------------------------------------------------


function PeruPeaceBuilding (iPlayer)
	local pPlayer = Players[iPlayer];
	local b = GetPeruPeaceBuilding(pPlayer);
	local isTreaty = 0
	for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local mPlayer = Players[mPlayer];
		if mPlayer ~= pPlayer then
			if (mPlayer:IsAlive()) then
				local pTeam = pPlayer:GetTeam();
				local mTeam = mPlayer:GetTeam();
				if Teams[pTeam]:IsForcePeace(mTeam) then
					print ("Is Treaty!!!!");
					isTreaty = isTreaty + 1
				end
			end
		end
	end
	if isTreaty >= 1 then
		if b ~= nil then
			for pCity in pPlayer:Cities() do
				if not pCity:IsHasBuilding(GameInfoTypes["" .. b .. ""]) then
					pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 1)
					if (pCity:IsCapital()) then
						local title =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_NOTIFICATION_TITLE");
						local descr =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_NOTIFICATION");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, pCity:GetX(), pCity:GetY());
					end
				end
			end
		end
	else
		if b ~= nil then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(GameInfoTypes["" .. b .. ""]) then
					pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 0)
					if (pCity:IsCapital()) then
						local title =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_END_NOTIFICATION_TITLE");
						local descr =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_END_NOTIFICATION");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, pCity:GetX(), pCity:GetY());
					end
				end
			end
		end
	end
end


function PeruPeaceBuildingState (iAttacker, iDefender, iIsWar)
	for _, pPlayer in pairs(Players) do
	if (pPlayer:IsAlive()) then
	local b = GetPeruPeaceBuilding(pPlayer);
	local isTreaty = 0
	for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local mPlayer = Players[mPlayer];
		if mPlayer ~= pPlayer then
			if (mPlayer:IsAlive()) then
				local pTeam = pPlayer:GetTeam();
				local mTeam = mPlayer:GetTeam();
				if Teams[pTeam]:IsForcePeace(mTeam) then
					print ("Is Treaty!!!!");
					isTreaty = isTreaty + 1
				end
			end
		end
	end
	if isTreaty >= 1 then
		if b ~= nil then
			for pCity in pPlayer:Cities() do
				if not pCity:IsHasBuilding(GameInfoTypes["" .. b .. ""]) then
					pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 1)
					if (pCity:IsCapital()) then
						local title =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_NOTIFICATION_TITLE");
						local descr =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_NOTIFICATION");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, pCity:GetX(), pCity:GetY());
					end
				end
			end
		end
	else
		if b ~= nil then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(GameInfoTypes["" .. b .. ""]) then
					pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 0)
					if (pCity:IsCapital()) then
						local title =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_END_NOTIFICATION_TITLE");
						local descr =  Locale.ConvertTextKey("TXT_KEY_PEACEBONUS_END_NOTIFICATION");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, pCity:GetX(), pCity:GetY());
					end
				end
			end
		end
	end
	end
	end
end
GameEvents.PlayerDoTurn.Add(PeruPeaceBuilding);
Events.WarStateChanged.Add(PeruPeaceBuildingState)



function GetPeruPeaceBuilding(pPlayer)
	if pPlayer == nil or not pPlayer:IsAlive() or 
			pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return nil;
	end
	local trait = GetMajorTrait(pPlayer);
	return trait.PeruPeaceBuilding;
end


function GetMajorTrait(pPlayer)
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	return GameInfo.Traits[leaderTrait.TraitType];
end