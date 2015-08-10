print ("Kievan Rus Check")

local KievanRusID = GameInfoTypes.CIVILIZATION_KIEVAN_RUS_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == KievanRusID then
			include("Rus Lua Scripts")
			include("Rus Lua Edits")
			break;
		end
	end
end