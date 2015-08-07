-- ChangingNameonLoadPh
-- Author: Leugi
-- DateCreated: 9/2/2014 9:37:27 PM
--------------------------------------------------------------
function CheckStuffOnLoad (arg0, currPlayer)
	if Game.GetBuildingClassCreatedCount( GameInfo.BuildingClasses.BUILDINGCLASS_SERANIM_PALACE.ID ) > 0 then
		str =  Locale.ConvertTextKey("TXT_KEY_LEUGI_PHILISTINE_SHORT_DESC_ENACTED");
		local tquery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = 'TXT_KEY_LEUGI_PHILISTINE_SHORT_DESC'"}
		for i, iQuery in pairs(tquery) do
			for result in DB.Query(iQuery) do
			end
		end
		-- refresh UI texts
		Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
	end
end


Events.LoadScreenClose.Add(CheckStuffOnLoad)