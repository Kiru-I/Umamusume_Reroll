#Persistent
SetTitleMatchMode, 2 ; Partial match
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

checking := false
clickCount := 0
lastMatch := A_TickCount
rerolling := true  ; Start reroll loop

F3::
IfWinActive, Umamusume
{
    Loop{
    ; Terms and Privacy Policy
    Click
    Sleep 2000
    Click, 1168, 481
    Sleep 10
    Click, 1175, 601
    Sleep 500
    Send, ^w
    Send, ^w
    Sleep 100
    Send, !{Tab}
    Sleep 50
    Click, 1109, 771
    Sleep 1000

    ; Select Region
    Click, 1157, 568
    Sleep 1000
    Click, 1103, 781
    Sleep 1000
    Click, 1100, 711
    Sleep 1000
    Click, 969, 572
    Sleep 100
    Send, 200707
    Sleep 1000
    Click, 1100, 711
    Sleep 10000
    Click

    ; Insert name
    Sleep 1000
    Click, 959, 493
    Sleep 100
    Send, #{Space}
    Sleep 100
    Send, !{CapsLock}
    Sleep 300
    Send kirui
    Sleep 300
    Send, #{Space}
    Sleep 1000
    Click, 1029, 577
    Sleep 300
    Click, 1024, 706
    Sleep 2500
    Click
    Sleep 5000

    ; Skipping Login
    clickCount := 0
    checking := true
    lastMatch := A_TickCount  ; Initialize the last match time
    SetTimer, CheckColorLoop, 100

    ; Wait until the CheckColorLoop finishes (checking = false)
    While (checking)
        Sleep, 200
    
    ; Claiming Gifts
    Click 559, 701
    Sleep 1000
    Click 559, 1004
    Sleep 1500
    Click, 806, 770
    Sleep 2000
    Click, 693, 993
    Sleep 3000
    Click, 558, 1005
    Sleep 2000
    Click, 431, 997
    Sleep 1500
    ; Clicking Scout
    Click, 806, 1041
    Sleep 3000
    ; Click on Free SSR Card Banner
    Click, 273, 663
    Sleep 1500

    ; Gambling Free SSR Card
    Click, 562, 864
    Sleep 2000
    Click, 700, 700
    Sleep 5000

    clickCount := 0
    checking := true
    lastMatch := A_TickCount
    SetTimer, CheckColorLoop, 100

    While (checking)
        Sleep, 200
    
    ; Reroll
    Click, 678, 766
    Sleep 2000
    Click, 700, 700
    Sleep 2000

    clickCount := 0
    checking := true
    lastMatch := A_TickCount
    SetTimer, CheckColorLoop, 100

    While (checking)
        Sleep, 200
    
    ; Complete and Automatically switch back to Teio banner
    Sleep 1000
    Click, 558, 764
    Sleep 10000
    if (!rerolling)
        break  ; Exit loop if rerolling is false

    ; Roll 10 Times 
    Click, 743, 865
    Sleep 2000
    Click, 700, 700
    Sleep 4000

    clickCount := 0
    checking := true
    lastMatch := A_TickCount  ; Initialize timeout timer
    SetTimer, CheckColorLoop, 100

    While (checking) ; Wait until CheckColorLoop sets checking := false
        Sleep, 200

    ; Reroll
    Click, 700, 1000
    Sleep 2000
    Click, 700, 700
    Sleep 3000

    clickCount := 0
    checking := true
    lastMatch := A_TickCount
    SetTimer, CheckColorLoop, 100

    While (checking)
        Sleep, 200

    ; To Title Screen
    Click, 1500, 900
    Sleep 4000
    Click
    Sleep 1000
    Click
    Sleep 1000
    Click, 1835, 1000
    Sleep 1000
    Click, 950, 760
    Sleep 1000
    Click, 1100, 700
    Sleep 1000
    Click, 1100, 700
    Sleep 2000
    Click, 960, 700
    ; Skip Intro
    Sleep 4000
    Click 
    Sleep 1000
    Click
    Sleep 2000
}
}
Else
{
    MsgBox, Uma Musume window is not active!
}
Return

F2::ExitApp

F4::  ; stop loop
checking := false
SetTimer, CheckColorLoop, Off
ToolTip 
Return

F5:: 
checking := true
SetTimer, CheckColorLoop, 100
Return

; Declare this globally (outside any function or hotkey)
lastMatch := A_TickCount

CheckColorLoop:
IfWinActive, Umamusume
{
    if (checking)
    {
        PixelGetColor, color, 906, 1029, RGB
        ToolTip, Clicks: %clickCount% | Color: %color%

        if (color = 0x8C4F21 || color = 0x8D5222)
        {
            Click, 903, 1027
            clickCount++
            lastMatch := A_TickCount  ; Reset timeout timer
        }
        else
        {
            ; Stop if no match after 5 seconds
            if ((A_TickCount - lastMatch) > 5000)
            {
                checking := false
                SetTimer, CheckColorLoop, Off
                ToolTip
            }
        }
    }
}
Return