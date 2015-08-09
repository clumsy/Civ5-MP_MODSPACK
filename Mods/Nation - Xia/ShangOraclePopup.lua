include("IconSupport")
include("JFD_CulDivSettings")
include("JFD_CulDivUtilities")

function ShowPopup(OracleType, OracleMessage, OracleBonus)
	Controls.Title:LocalizeAndSetText(OracleType);
	Controls.Help:LocalizeAndSetText(OracleMessage);
	Controls.Summary:LocalizeAndSetText(OracleBonus);
	Controls.ButtonStack:CalculateSize();
	Controls.XiaShangDynastyUI:DoAutoSize();
	Controls.XiaShangDynastyUIBG:SetHide(false)
	Controls.XiaShangDynastyUI:SetHide(false)
end
LuaEvents.ShowShangOraclePopup.Add(ShowPopup)

function ClosePopup()
	Controls.XiaShangDynastyUIBG:SetHide(true)
	Controls.XiaShangDynastyUI:SetHide(true)
end
Controls.Button1:RegisterCallback(Mouse.eLClick, ClosePopup)