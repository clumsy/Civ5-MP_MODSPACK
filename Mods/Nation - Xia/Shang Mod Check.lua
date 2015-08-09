print ("Shang Check")

--Stuff
local isShang = (GameInfoTypes.BUILDING_XIA_SHANG_SWITCH ~= nil)

-- Check
local XiaID = GameInfoTypes.CIVILIZATION_ERLITOU_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == XiaID then
			if isShang then
				include("Shang Mod Scripts")
				break;
			end
		end
	end
end