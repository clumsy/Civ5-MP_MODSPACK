-- JFD
-- JFD_StartingPopup
--==========================================================================================================================
-- JFD_DawnOfManPopup
--==========================================================================================================================
include("IconSupport")
include("JFD_CulDivSettings")
include("JFD_CulDivUtilities")

function ShowPopup(dynastyName, dynastyHelp, dynastyBonus)
	Controls.Title:LocalizeAndSetText(dynastyName);
	Controls.Help:LocalizeAndSetText(dynastyHelp);
	Controls.Summary:LocalizeAndSetText(dynastyBonus);
	Controls.ButtonStack:CalculateSize();
	Controls.XiaDynastyUI:DoAutoSize();
	Controls.XiaDynastyUIBG:SetHide(false)
	Controls.XiaDynastyUI:SetHide(false)
end
LuaEvents.ShowXiaDynastyPopup.Add(ShowPopup)

function ClosePopup()
	Controls.XiaDynastyUIBG:SetHide(true)
	Controls.XiaDynastyUI:SetHide(true)
end
Controls.Button1:RegisterCallback(Mouse.eLClick, ClosePopup)
--==========================================================================================================================
--==========================================================================================================================