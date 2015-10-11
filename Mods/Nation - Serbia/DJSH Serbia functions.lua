-- Author: DJSHenninger
-- DateCreated: 8/13/2014 7:53:15 PM
include("FLuaVector.lua")
----------------------------------------------------------------------------------------------------------------------------
--Culture Boost when UI Built
----------------------------------------------------------------------------------------------------------------------------
function DJSHFruskaGoraCulture(playerID, plotX, plotY, improvementID) 
	local plot = Map.GetPlot(plotX, plotY)
	local improvementID = plot:GetImprovementType()
	if improvementID == GameInfoTypes["IMPROVEMENT_FRUSKA_GORA_MONASTERY"] then
		local Owner = plot:GetOwner()
		local player = Players[Owner];
		local random = Game.Rand(3, "Random Fruska Gora Bonuses Lua") + 1
		if not plot:IsImprovementPillaged() then
			if random == 1 then
				local mediumcultureBoost = math.floor(player:GetTotalJONSCulturePerTurn() * 1.50)
				player:ChangeJONSCulture(mediumcultureBoost)
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), Locale.ConvertTextKey("+{1_Culture} [ICON_CULTURE]", mediumcultureBoost))
			elseif random == 2 then
				local minorcultureBoost = math.floor(player:GetTotalJONSCulturePerTurn() * 3)
				player:ChangeJONSCulture(minorcultureBoost)
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), Locale.ConvertTextKey("+{1_Culture} [ICON_CULTURE]", minorcultureBoost))
			elseif random == 3 then
				local largecultureBoost = math.floor(player:GetTotalJONSCulturePerTurn() * 4)
				player:ChangeJONSCulture(largecultureBoost)
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), Locale.ConvertTextKey("+{1_Culture} [ICON_CULTURE]", largecultureBoost))
			end
		end
	end
end
GameEvents.BuildFinished.Add(DJSHFruskaGoraCulture)
----------------------------------------------------------------------------------------------------------------------------
--Gusar Functions
----------------------------------------------------------------------------------------------------------------------------
function DJSHSerbiaGusarAttack(playerID)
	local player = Players[playerID]
	local gusarNearby = false
	for unit in player:Units() do
		if (unit:IsCombatUnit()) and (unit:GetCurrHitPoints() < unit:GetMaxHitPoints()) and not (unit:IsEmbarked()) then
			for gusar in player:Units() do
				if gusar:IsHasPromotion(GameInfoTypes["PROMOTION_GUSAR_LIGHT_CAVALRY"]) then
					if Map.PlotDistance(unit:GetX(), unit:GetY(), gusar:GetX(), gusar:GetY()) < 2 then
						gusarNearby = true
					end
				end
			end
			
			if gusarNearby then
				for gusar in player:Units() do
					if gusar:IsHasPromotion(GameInfoTypes["PROMOTION_GUSAR_LIGHT_CAVALRY"]) then
						if not gusar:IsHasPromotion(GameInfoTypes["PROMOTION_GUSAR_CHARGE"]) then
							gusar:SetHasPromotion(GameInfoTypes["PROMOTION_GUSAR_CHARGE"], true)
						end
					else
						if gusar:IsHasPromotion(GameInfoTypes["PROMOTION_GUSAR_CHARGE"]) then
							gusar:SetHasPromotion(GameInfoTypes["PROMOTION_GUSAR_CHARGE"], false)
						end
					end
				end
			end
			for gusar in player:Units() do
				if not gusar:IsFriendlyUnitAdjacent(bCombatUnit) then
					if gusar:IsHasPromotion(GameInfoTypes["PROMOTION_GUSAR_CHARGE"]) then
						gusar:SetHasPromotion(GameInfoTypes["PROMOTION_GUSAR_CHARGE"], false)
					end
				end
			end
		end	
	end
end
GameEvents.UnitSetXY.Add(DJSHSerbiaGusarAttack) 
GameEvents.PlayerDoTurn.Add(DJSHSerbiaGusarAttack)

function DJSHSerbiaKnightBoost(playerID)
	local player = Players[playerID]
	local gusarNearby = false
	for unit in player:Units() do
		if unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] and not (unit:IsEmbarked()) then
			for gusar in player:Units() do
				if gusar:IsHasPromotion(GameInfoTypes["PROMOTION_GUSAR_LIGHT_CAVALRY"]) then
					if Map.PlotDistance(unit:GetX(), unit:GetY(), gusar:GetX(), gusar:GetY()) < 2 then
						gusarNearby = true
					end
				end
			end
			
			if gusarNearby then
				if unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] and not unit:IsHasPromotion(GameInfoTypes["PROMOTION_DJSH_SERBIA_KNIGHT"]) then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_DJSH_SERBIA_KNIGHT"], true)
				end
			else
				if unit:IsHasPromotion(GameInfoTypes["PROMOTION_DJSH_SERBIA_KNIGHT"]) then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_DJSH_SERBIA_KNIGHT"], false)
				end
			end
		end	
		if not unit:IsFriendlyUnitAdjacent(bCombatUnit) then
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_DJSH_SERBIA_KNIGHT"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_DJSH_SERBIA_KNIGHT"], false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(DJSHSerbiaKnightBoost) 
GameEvents.PlayerDoTurn.Add(DJSHSerbiaKnightBoost)