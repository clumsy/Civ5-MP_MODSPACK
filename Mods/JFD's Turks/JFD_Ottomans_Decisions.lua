-- JFD_Ottomans_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Ottoman Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationOttomanID = GameInfoTypes["CIVILIZATION_OTTOMAN"]
local mathCeil 				= math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Ottomans: Commission Decorated Tughra
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID			= GameInfoTypes["ERA_RENAISSANCE"]
local unitOttomanCaligrapherID	= GameInfoTypes["UNIT_JFD_OTTOMAN_CALLIGRAPHER"]

local Decisions_OttomanCommissionDecoratedTughra = {}
	Decisions_OttomanCommissionDecoratedTughra.Name = "TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA"
	Decisions_OttomanCommissionDecoratedTughra.Desc = "TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA_DESC"
	HookDecisionCivilizationIcon(Decisions_OttomanCommissionDecoratedTughra, "CIVILIZATION_OTTOMAN")
	Decisions_OttomanCommissionDecoratedTughra.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationOttomanID then return false, false end
		if load(player, "Decisions_OttomanCommissionDecoratedTughra") == true then
			Decisions_OttomanCommissionDecoratedTughra.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(500 * iMod)
		Decisions_OttomanCommissionDecoratedTughra.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA_DESC", goldCost)
		if player:GetGold() < goldCost				 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		
		return true, true
	end
	)
	
	Decisions_OttomanCommissionDecoratedTughra.DoFunc = (
	function(player)
		local goldCost = mathCeil(500 * iMod)
		local capital = player:GetCapitalCity()
		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		player:ChangeNumResourceTotal(iMagistrate, 1)
		player:ChangeGold(-goldCost)
		player:InitUnit(unitOttomanCaligrapherID, capitalX, capitalY)
		save(player, "Decisions_OttomanCommissionDecoratedTughra", true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationOttomanID, "Decisions_OttomanCommissionDecoratedTughra", Decisions_OttomanCommissionDecoratedTughra)
--=======================================================================================================================
--=======================================================================================================================
