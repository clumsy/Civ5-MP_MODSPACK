print ("Champa Check")

local ChampaID = GameInfoTypes.CIVILIZATION_CHAMPA_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == ChampaID then
			include("Cham Lua Scripts")
			include("Cham Top Panel Edits")
			break;
		end
	end
end