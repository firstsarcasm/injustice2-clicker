Global $g_bPaused = False

Fight()

;WinActivate($hWnd)
Func Fight()
	HotKeySet("{F11}", "HotKeyPressed")
	HotKeySet('{PAUSE}', 'HotKeyPressed')
	Opt("SendKeyDelay", 2500)
	Opt("SendKeyDownDelay", 200)
	;ShellExecuteWait(@DesktopDir & "\Injustice™ 2.url")
    ;WinWait("[CLASS:LaunchUnrealUWindowsClient]");

	$hWnd = WinGetHandle("[CLASS:LaunchUnrealUWindowsClient]")
    WinMove($hWnd, "", 1500, 750)

	$heroCounter = 4
	While True
		Sleep(4000)
		;ControlFocus($hWnd, "", "")
		WinActivate($hWnd)
		$color1 = PixelGetColor(1654, 1202, $hWnd)
		$color2 = PixelGetColor(2179, 1215, $hWnd)
		If $color1 = 11909764 And $color2 = 15170898 Then
			ConsoleWrite("This is heros page" & @CRLF)
			SendToInactive($hWnd, "{DOWN}")
		;	For $i = 1 To $heroCounter Step 1
		;		SendToInactive($hWnd, "{LEFT}")
			;Next

			SetAiLoadout($hWnd)
		;	$heroCounter = $heroCounter + 1
			;If $heroCounter >= 11 Then
			;	$heroCounter = 3
			;EndIf
		Else
			ConsoleWrite("Some another page" & @CRLF)
			SendToInactive($hWnd, "{SPACE}")
			SendToInactive($hWnd, "{ENTER}")
		EndIf
	WEnd
EndFunc

Func SetAiLoadout(ByRef $hWnd)
	SendToInactive($hWnd, "a")
	SendToInactive($hWnd, "{LEFT 2}")
	SendToInactive($hWnd, "{ENTER 2}")
EndFunc

Func SendToInactive(ByRef $hWnd, $value = "")
	ControlFocus($hWnd, "", "")
	ControlSend($hWnd, "", "", $value)
EndFunc


Func HotKeyPressed()
    Switch @HotKeyPressed
        Case "{PAUSE}"
            $g_bPaused = Not $g_bPaused
            While $g_bPaused
                Sleep(500)
                ToolTip('Script is "Paused"', 0, 0)
            WEnd
            ToolTip("")

        Case "{F11}"
            Exit
    EndSwitch
EndFunc
