-- NumFreeUnitsTrait
-- Author: Leugi
-- DateCreated: 2/11/2014 7:42:39 PM
--------------------------------------------------------------


function FreeUnitQuantityGift (iTeam, oTech, iChange)
	--local pPlayer = Players[iPlayer];
	for _, pPlayer in pairs(Players) do
	local u = GetTraitedFreeUnit(pPlayer);
	local t = GetTraitedFreeUnitTechPrereq(pPlayer);
	local NumUnits = GetTraitedNumFreeUnits(pPlayer);
	if NumUnits > 1 then
		local iTech = GameInfoTypes["" .. t .. ""]
		local iUnitClass = GameInfoTypes["" .. u .. ""]
		-- Check if the unit class has an override for the player.
		local civ = pPlayer:GetCivilizationType()
		ut = GameInfo.UnitClasses[iUnitClass].DefaultUnit
		print (ut);
		iUnitID = GameInfoTypes["" .. ut .. ""]
		for row in GameInfo.Civilization_UnitClassOverrides() do
           	local iClass = GameInfoTypes["" .. row.UnitClassType .. ""]
			local iCiv = GameInfoTypes["" .. row.CivilizationType .. ""]
		   	if iClass == iUnitClass and iCiv == civ then
				ut = GameInfoTypes["" .. row.UnitType .. ""]
				print (ut);
				print ("Yes, there's some overriding");
				iUnitID = ut
			end
		end
		print (ut);
		
		--
		local NumUnits = NumUnits - 1
		local teamID = pPlayer:GetTeam();
		local pTeam = Teams[teamID];
		if iTech == oTech then
		if teamID == iTeam then
		if (pTeam:IsHasTech(iTech)) then
			for pCity in pPlayer:Cities() do
				if (pCity:IsCapital()) then
					unit = pPlayer:InitUnit (iUnitID, pCity:GetX(), pCity:GetY(), UNITAI_SETTLE);
					unit:JumpToNearestValidPlot();
				end
			end
		end
		end
		end
	end
	end
end

GameEvents.TeamTechResearched.Add(FreeUnitQuantityGift);


function FreeUnitQuantityGiftAdvancedStart()
	local iCurrentTurn = Game.GetGameTurn()
	for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local pPlayer = Players[mPlayer];
		if pPlayer:IsAlive() then
			if pPlayer:GetNumCities() < 1 then
				local u = GetTraitedFreeUnit(pPlayer);
				local t = GetTraitedFreeUnitTechPrereq(pPlayer);
				local NumUnits = GetTraitedNumFreeUnits(pPlayer);
				if NumUnits > 1 then
					local iTech = GameInfoTypes["" .. t .. ""]
					local iUnitClass = GameInfoTypes["" .. u .. ""]
					-- Check if the unit class has an override for the player.
					local civ = pPlayer:GetCivilizationType()
					ut = GameInfo.UnitClasses[iUnitClass].DefaultUnit
					print (ut);
					iUnitID = GameInfoTypes["" .. ut .. ""]
					for row in GameInfo.Civilization_UnitClassOverrides() do
				       	local iClass = GameInfoTypes["" .. row.UnitClassType .. ""]
						local iCiv = GameInfoTypes["" .. row.CivilizationType .. ""]
					   	if iClass == iUnitClass and iCiv == civ then
							ut = GameInfoTypes["" .. row.UnitType .. ""]
							print (ut);
							print ("Yes, there's some overriding");
							iUnitID = ut
						end
					end
					print (ut);
		
					--
					local NumUnits = NumUnits - 1
					local teamID = pPlayer:GetTeam();
					local pTeam = Teams[teamID];
					if (pTeam:IsHasTech(iTech)) then
						if (pPlayer:GetUnitClassCount(iUnitClass) < (NumUnits + 1)) then
						local Ploty = pPlayer:GetStartingPlot()
						unit = pPlayer:InitUnit (iUnitID, Ploty:GetX(), Ploty:GetY(), UNITAI_SETTLE);
						unit:JumpToNearestValidPlot();
						end
					end
				end
			end
		end
	end
end

Events.LoadScreenClose.Add(FreeUnitQuantityGiftAdvancedStart)
--GameEvents.PlayerDoTurn.Add(FreeUnitQuantityGift);


function GetTraitedFreeUnit(pPlayer)
	if pPlayer == nil or not pPlayer:IsAlive() or 
			pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return nil;
	end
	local trait = GetMajorTrait(pPlayer);
	return trait.FreeUnit;
end

function GetTraitedFreeUnitTechPrereq(pPlayer)
	if pPlayer == nil or not pPlayer:IsAlive() or 
			pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return nil;
	end
	local trait = GetMajorTrait(pPlayer);
	return trait.FreeUnitPrereqTech;
end

function GetTraitedNumFreeUnits(pPlayer)
	if pPlayer == nil or not pPlayer:IsAlive() or 
			pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return -1;
	end
	local trait = GetMajorTrait(pPlayer);
	return trait.NumFreeUnits;
end


function GetMajorTrait(pPlayer)
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	return GameInfo.Traits[leaderTrait.TraitType];
end