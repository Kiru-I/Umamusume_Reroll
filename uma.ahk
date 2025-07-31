#Persistent
SetTitleMatchMode, 2 ; Partial match
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

rerolling := false
checking := false
clickCount := 0
lastMatch := A_TickCount
 maxRerolls := 11
rerollCount := 1  ; First pull already done

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
    Sleep 1000
    Send, ^w
    Sleep 2000
    Send, ^w
    Sleep 500
    Send, !{Tab}
    Sleep 100
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
    Sleep 2000
    Click 559, 1004
    Sleep 2000
    Click, 806, 770
    Sleep 2500
    Click, 693, 993
    Sleep 3000
    Click, 558, 1005
    Sleep 2500
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

    ; Run Python script
    RunWait, python check.py,, Hide
    if (ErrorLevel = 0) {
        rerolling := false
        ToolTip, Lucky! Character Found!
        Return
    } else{
        ToolTip, Rerolling
        rerolling := true
    }

    ; Reroll
    if (rerollCount < maxRerolls){
    Loop {
        
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

        ; Check again
        RunWait, python check.py,, Hide
        if (ErrorLevel = 0) {
            ToolTip, Lucky! Character Found!
            SetTimer, HideToolTip, -2000
            Break  ; Exit the loop
        } else {
            ToolTip, Rerolling
            SetTimer, HideToolTip, -1000
        }
        rerollCount++
    }
    }
    rerolling := true
    Loop {
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

        ; Check again
        RunWait, python check.py,, Hide
        if (ErrorLevel = 0) {
            ToolTip, Lucky! Character Found!
            SetTimer, HideToolTip, -2000
            Break  ; Exit the loop
        } else {
            ToolTip, Rerolling
            SetTimer, HideToolTip, -1000
        }
    }

    ; Roll on Kitasan Black
    Sleep 500
    Click, 420, 1000
    Sleep 5000
    Click, 555, 1000
    Sleep 1000
    Click, 920, 655
    Sleep 1000
    Click, 920, 655
    
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

    ; Run Python script
    RunWait, python check.py,, Hide
    if (ErrorLevel = 0) {
        rerolling := false
        ToolTip, Lucky! Character Found!
        Return
    } else{
        ToolTip, Rerolling
        rerolling := true
    }

    ; Reroll
    rerolling := true
    Loop {
        if (rerollCount < maxRerolls) {
            ToolTip, Max rerolls reached — continue to next step
            SetTimer, HideToolTip, -3000
        }
        
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

        ; Check again
        RunWait, python check.py,, Hide
        if (ErrorLevel = 0) {
            ToolTip, Lucky! Character Found!
            SetTimer, HideToolTip, -2000
            Break  ; Exit the loop
        } else {
            ToolTip, Rerolling
            SetTimer, HideToolTip, -1000
        }
        rerollCount++
    }
    rerolling := true
    Loop {
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

        ; Check again
        RunWait, python check.py,, Hide
        if (ErrorLevel = 0) {
            ToolTip, Lucky! Character Found!
            SetTimer, HideToolTip, -2000
            Break  ; Exit the loop
        } else {
            ToolTip, Rerolling
            SetTimer, HideToolTip, -1000
        }
    }



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

HideToolTip:
ToolTip
Return