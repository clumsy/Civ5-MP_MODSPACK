print ("Norte Chico Check")

local NorteChicoID = GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == NorteChicoID then
			include("Norte Chico Mod Scripts")
			break;
		end
	end
end