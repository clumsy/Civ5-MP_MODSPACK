print ("Xia Check")

--Stuff
local isShang = (GameInfoTypes.BUILDING_XIA_SHANG_SWITCH ~= nil)

-- Check
local XiaID = GameInfoTypes.CIVILIZATION_ERLITOU_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == XiaID then
			if not isShang then
				include("Xia Mod Dynasty Scripts")
				include("Xia Panel Edits")
				break;
			end
		end
	end
end

--Shang Chariot
local pShangPatronage = GameInfoTypes.PROMOTION_SHANG_NOBLE_BIRTH;
local uCHARIOTARCHER = GameInfoTypes.UNITCLASS_CHARIOT_ARCHER;
local ePatronage0 = GameInfoTypes.PROMOTION_SHANG_PATRONAGE_0;

function CheckShangChariot(pPlayer)
	local ShangCheck = 0;
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(pShangPatronage) then
			ShangCheck = 1;
			break
		end
	end
	return ShangCheck;
end

function ShangChariotOther(playerID)
	local pPlayer = Players[playerID]
	--if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
		local ShangCheck = CheckShangChariot(pPlayer)
		if ShangCheck == 1 then
			for pUnit in pPlayer:Units() do
				local Patronage = 0;
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and pUnit:IsCombatUnit() and not pUnit:IsEmbarked() and (pUnit:GetUnitClassType() ~= uCHARIOTARCHER) then 
					for sUnit in pPlayer:Units() do
						if sUnit:IsHasPromotion(pShangPatronage) then
							if pPlayer:IsHuman() then
								if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < 3 then
									Patronage = 1;
								end
							elseif not pPlayer:IsHuman() then
								if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < 4 then
									Patronage = 1;
								end
							end
						end
					end			
					if Patronage == 1 then
						if not pUnit:IsHasPromotion(ePatronage0) then
							pUnit:SetHasPromotion(ePatronage0, true)
						end
					else
						if pUnit:IsHasPromotion(ePatronage0) then
							pUnit:SetHasPromotion(ePatronage0, false)
						end
					end		
				else
					if pUnit:IsHasPromotion(ePatronage0) then
						pUnit:SetHasPromotion(ePatronage0, false)
					end
				end
			end
		end
	--end
end
GameEvents.UnitSetXY.Add(ShangChariotOther) 
GameEvents.PlayerDoTurn.Add(ShangChariotOther)

local uArtist = GameInfoTypes.UNIT_ARTIST;
local uShamanKing = GameInfoTypes.UNIT_DECISIONS_XIA_YU;

function XiaShangReplaceUUGA(playerID)
	local pPlayer = Players[playerID]
	for pUnit in pPlayer:Units() do
		if (pUnit:GetUnitType() == uShamanKing) then
			local pPlot = pUnit:GetPlot();
			pUnit:Kill();
			aUnit = pPlayer:InitUnit(uArtist, pPlot:GetX(), pPlot:GetY(), UNITAI_ARTIST);
		end
	end
end

GameEvents.PlayerDoTurn.Add(XiaShangReplaceUUGA)