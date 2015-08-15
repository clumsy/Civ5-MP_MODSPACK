print ("Mali Check")

local MaliID = GameInfoTypes.CIVILIZATION_MALI_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == MaliID then
			include("MaliLuaScriptMod")
			include("Mali Top Panel Edits")
			break;
		end
	end
end