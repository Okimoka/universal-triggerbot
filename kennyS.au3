#include "misc.au3"
#include <MsgBoxConstants.au3>

$screenW = 1920
$screenH = 1080
$color_treshold = 350000 ;The color difference which needs to be achieved to be triggered
;The scanned point is in the center, but offset one pixel to the bottom right. Make sure your crosshair doesn't overlap with this!

While 1
    If _IsPressed("08") Then ;08 = backspace. See https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm
        While 1
            $i_Color = PixelGetColor ($screenW/2+1, $screenH/2+1) ;current color
			If Abs($i_Color - PixelGetColor ($screenW/2+1, $screenH/2+1)) > $color_treshold Then
				If $i_Color <> 16777215 Then ;16777215 = white. Doesn't trigger when the screen turns white (CSGO flashbang)
						MouseClick("left")
				EndIf
                ExitLoop
            EndIf
        WEnd
    EndIf
WEnd