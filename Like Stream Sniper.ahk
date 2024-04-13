
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

        ; Pass Parameter to likeStream function based on the loop index, specifying the number of times to press the Tab key
        (A_Index = 1) ? likeStream(2) : ""
        (A_Index = 2) ? likeStream(6) : ""
        (A_Index = 3) ? likeStream(3) : ""
        (A_Index = 4) ? likeStream(9) : ""
        (A_Index = 5) ? likeStream(3) : ""
        (A_Index = 6) ? likeStream(12) : ""
        (A_Index = 7) ? likeStream(14) : ""
        (A_Index = 8) ? likeStream(3) : ""
        (A_Index = 9) ? likeStream(4) : ""
        (A_Index = 10) ? likeStream(5) : ""
        (A_Index = 11) ? likeStream(6) : ""
        (A_Index = 12) ? likeStream(7) : ""
        (A_Index = 13) ? likeStream(8) : ""
        (A_Index = 14) ? likeStream(9) : ""
        (A_Index = 15) ? likeStream(10) : ""
        (A_Index = 16) ? likeStream(11) : ""
        (A_Index = 17) ? likeStream(12) : ""
        (A_Index = 18) ? likeStream(13) : ""
        (A_Index = 19) ? likeStream(27) : ""
        (A_Index = 20) ? likeStream(3) : ""
        (A_Index = 21) ? likeStream(30) : ""
        (A_Index = 22) ? likeStream(3) : ""
        (A_Index = 23) ? likeStream(33) : ""
        (A_Index = 24) ? likeStream(3) : ""
        (A_Index = 25) ? likeStream(36) : ""
        (A_Index = 26) ? likeStream(3) : ""

        Sleep, 6000
        Send, +{=} ; Send Shift+=
        Sleep, 1000
    }

    LoopEndTime := A_TickCount ; Record loop end time
    LoopDuration := (LoopEndTime - LoopStartTime) / 1000 ; Calculate loop duration in seconds

    Minutes := Floor(LoopDuration / 60) ; Get the number of minutes
    Seconds := Floor(Mod(LoopDuration, 60)) ; Get the remaining seconds
    
    ToolTip, Completed - Loop took %Minutes% Minutes %Seconds% Seconds
    
    SetTimer, RemoveToolTip, 3000  ; Remove the tooltip after 2 Seconds
return

likeStream(TabsToPress) {
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

RemoveToolTip:
    ToolTip  ; Clear the tooltip
return

