-- HighestTourismCulture
-- Author: Leugi
-- DateCreated: 2/28/2014 12:14:49 PM
--------------------------------------------------------------
print("loaded")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "CultureFromHighestTourism";



function TraitHTC (iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		local numCulture = GetNumTourismCulture(pPlayer);
		if numCulture > 0 then
			highinfluence = 0
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					influence = nPlayer:GetInfluencePerTurn(pPlayer);
					if influence > highinfluence then
						highinfluence = influence
					end
				end
			end
			print ("Highest influence on this player is " .. highinfluence .. "")
			local culturebonus = math.floor(highinfluence / numCulture)
			print ("This player will receive " .. culturebonus .. " Culture!")

			local iOldDelta = load( pPlayer, "culturebonus y" )
   
                  	  save( pPlayer, "culturebonus y", culturebonus)
                   	 if iOldDelta == nil then
                       		pPlayer:ChangeJONSCulturePerTurnForFree(culturebonus)
                   	 else
                      		pPlayer:ChangeJONSCulturePerTurnForFree(culturebonus - iOldDelta)
                   	 end

		end
	end
end

GameEvents.PlayerDoTurn.Add(TraitHTC);


function GetNumTourismCulture(pPlayer)
	if pPlayer == nil or not pPlayer:IsAlive() or 
			pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return -1;
	end
	local trait = GetMajorTrait(pPlayer);
	return trait.HighestTourismCulture;
end

function GetMajorTrait(pPlayer)
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	return GameInfo.Traits[leaderTrait.TraitType];
end