-- based on Gedemon's YnEAMP Leaders for City States (adaptation of mihaifx's City State Leaders)
include( "FirstMetGold.lua" );

function OnEventReceived( popupInfo )
	-- greeting?
	if popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING then return end
	-- has UA?
	local player = Players[Game.GetActivePlayer()];
	local trait = GetMajorTrait( player );
	if trait.CityStateMetFirstBonus ~= 0 then
		-- ok go on!
		SetCityStateGoldLabel( popupInfo, trait );
	end
end
Events.SerialEventGameMessagePopup.Add( OnEventReceived )


function SetCityStateGoldLabel( popupInfo, trait )
    local pPlayer = Players[popupInfo.Data1];
	local iGoldGift = popupInfo.Data2;
	local iFaithGift = popupInfo.Data3;
	local bFirstMajorCiv = popupInfo.Option1;

	-- calculate new gold
	local iActiveTeam = Players[Game.GetActivePlayer()]:GetTeam();
	local iExtraGold = CalculateGoldBonus( trait, iActiveTeam, bFirstMajorCiv );
	iGoldGift = iGoldGift + iExtraGold;
	local strGiftString = "";
	if (iGoldGift > 0) then
		if (bFirstMajorCiv) then
			strGiftString = Locale.ConvertTextKey("TXT_KEY_CITY_STATE_GIFT_FIRST", iGoldGift);
		else
			strGiftString = Locale.ConvertTextKey("TXT_KEY_CITY_STATE_GIFT_OTHER", iGoldGift);
		end
	end
	if (iFaithGift > 0) then
		if (iGoldGift > 0) then
			strGiftString = strGiftString .. " ";
		end
		if (bFirstMajorCiv) then
			strGiftString = strGiftString .. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_GIFT_FAITH_FIRST", iFaithGift);
		else
			strGiftString = strGiftString .. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_GIFT_FAITH_OTHER", iFaithGift);
		end
	end
	
	local strNameKey = pPlayer:GetCivilizationShortDescriptionKey();
	local strSpeakAgainString = Locale.ConvertTextKey("TXT_KEY_MINOR_SPEAK_AGAIN", strNameKey);
	local strDescription = Locale.ConvertTextKey("TXT_KEY_CITY_STATE_MEETING", strNameKey, strGiftString, strSpeakAgainString);
	-- set text
	ContextPtr:LookUpControl("/InGame/CityStateGreetingPopup/DescriptionLabel"):SetText(strDescription);
end