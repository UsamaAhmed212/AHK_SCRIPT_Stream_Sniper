
global loopState := True ; Initialize Loop State

Esc::
   loopState := False
return

F1::
    pause, toggle
return


F2::  ; Start/Restart Loop
    loopState := True

    LoopStartTime := A_TickCount ; Record loop start time

    Loop, 26 {
        if (!loopState)
            break  ; Exit the loop

        ToolTip % A_Index

        ; Pass Parameter to launchChat function based on the loop index, specifying the number of times to press the Tab key
        (A_Index = 1) ? launchChat(2) : ""
        (A_Index = 2) ? launchChat(6) : ""
        (A_Index = 3) ? launchChat(3) : ""
        (A_Index = 4) ? launchChat(9) : ""
        (A_Index = 5) ? launchChat(3) : ""
        (A_Index = 6) ? launchChat(12) : ""
        (A_Index = 7) ? launchChat(14) : ""
        (A_Index = 8) ? launchChat(3) : ""
        (A_Index = 9) ? launchChat(4) : ""
        (A_Index = 10) ? launchChat(5) : ""
        (A_Index = 11) ? launchChat(6) : ""
        (A_Index = 12) ? launchChat(7) : ""
        (A_Index = 13) ? launchChat(8) : ""
        (A_Index = 14) ? launchChat(9) : ""
        (A_Index = 15) ? launchChat(10) : ""
        (A_Index = 16) ? launchChat(11) : ""
        (A_Index = 17) ? launchChat(12) : ""
        (A_Index = 18) ? launchChat(13) : ""
        (A_Index = 19) ? launchChat(27) : ""
        (A_Index = 20) ? launchChat(3) : ""
        (A_Index = 21) ? launchChat(30) : ""
        (A_Index = 22) ? launchChat(3) : ""
        (A_Index = 23) ? launchChat(33) : ""
        (A_Index = 24) ? launchChat(3) : ""
        (A_Index = 25) ? launchChat(36) : ""
        (A_Index = 26) ? launchChat(3) : ""

        Sleep, 1000
        Send, ^q ; Send Ctrl+V
        Sleep, 1000
        Send, ^v ; Send Ctrl+V
        Sleep, 1000
        Send, {Enter}  ; Sends the Enter key
        Sleep, 3000
        Send, ^{tab}  ; Send Ctrl+Tab
        Sleep, 4000
    }

    LoopEndTime := A_TickCount ; Record loop end time
    LoopDuration := (LoopEndTime - LoopStartTime) / 1000 ; Calculate loop duration in seconds

    Minutes := Floor(LoopDuration / 60) ; Get the number of minutes
    Seconds := Floor(Mod(LoopDuration, 60)) ; Get the remaining seconds
    
    ToolTip, Completed - Loop took %Minutes% Minutes %Seconds% Seconds
    
    SetTimer, RemoveToolTip, 3000  ; Remove the tooltip after 2 Seconds
return

launchChat(TabsToPress) {
    Send, / ; Sends a forward slash ("/")
    Sleep, 500
    ; Send, {Tab 5}  ; Sends the Tab key five times
    Loop, 5 {  ; Sends the Tab key five times
        Send, {Tab}
        Sleep, 500
    }
    Sleep, 500
    Send, {Enter}  ; Sends the Enter key
    Sleep, 1000
    Send, {Tab}  ; Sends a single Tab key press
    Sleep, 500
    Send, {Enter}  ; Sends the Enter key
    Sleep, 1000
    ; Send, {Tab %TabsToPress%}  ; Sends the Tab key six times
    Loop, % TabsToPress {  ; Sends the Tab key six times
        Send, {Tab}
        Sleep, 500
    }
    Sleep, 500
    Send, {Enter}  ; Sends the Enter key
}


F9::  ; Start/Restart Loop
    loopState := True

    LoopStartTime := A_TickCount ; Record loop start time

    Loop, 99999 {
        if (!loopState)
            break  ; Exit the loop

        ToolTip % A_Index
        Send, ^{tab}  ; Send Ctrl+Tab
        Sleep, 2000
    }
    
    LoopEndTime := A_TickCount ; Record loop end time
    LoopDuration := (LoopEndTime - LoopStartTime) / 1000 ; Calculate loop duration in seconds

    Minutes := Floor(LoopDuration / 60) ; Get the number of minutes
    Seconds := Floor(Mod(LoopDuration, 60)) ; Get the remaining seconds
    
    ToolTip, Completed - Loop took %Minutes% Minutes %Seconds% Seconds
    
    SetTimer, RemoveToolTip, 3000  ; Remove the tooltip after 2 Seconds
return

RemoveToolTip:
    ToolTip  ; Clear the tooltip
return

