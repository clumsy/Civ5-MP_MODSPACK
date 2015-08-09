-- Tomatekh_Popup
-- Author: JFD
-- DateCreated: 9/29/2014 11:56:18 PM
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- JFD_UpdatePopup
----------------------------------------------------
function JFD_UpdatePopup()
    Controls.ButtonStack:CalculateSize()
	Controls.ButtonStackFrame:DoAutoSize()
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_OnClose
------------------------------------------------------------------------------------------------------------------------
function JFD_OnClose()
	ContextPtr:SetHide(true)
end
Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_OnClose)
--------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
      JFD_OnClose()
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)
--------------------------------------------------------------------
function JFD_ShowHideHandler(bIsHide, bInitState)
	if (not bInitState and not bIsHide) then
		JFD_UpdatePopup()
	end
end
ContextPtr:SetShowHideHandler(JFD_ShowHideHandler)
ContextPtr:SetHide(true)
--------------------------------------------------------------------
function ShowXiaCapturePopup(BodyText, Button1)

	Controls.PopupText:LocalizeAndSetText(BodyText);
	Controls.Button1:LocalizeAndSetToolTip(Button1);

	ContextPtr:SetHide(false)
end
LuaEvents.ShowXiaCapturePopup.Add(ShowXiaCapturePopup)
--==========================================================================================================================
--==========================================================================================================================