global repetitionsComment := "#PubgDaddy"

global winComment := "SpikE | OP 5400684791"
; global winComment := "Hasib | 51775690258" ;umama

global repetitions := 200 ; Define the number of repetitions

global totalAccount := 28 ; Define the number of accounts

global tabChangeInterval := 3 ; Define the interval for tab change

global windowChangeInterval := 8 ; Define the (interval or number of tabs) for window change

global loopState := True ; Initialize Loop State


Esc::
   loopState := False
return

F1::
    pause, toggle
    ToolTip, % (A_IsPaused ? "Script Paused" : "Script Resumed") ; Display tooltip indicating script state
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
return


F2::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(100, 150) ; 100 to 150
    streamSniperUp(30, 99) ; 30 to 99
    streamSniperDown(29, 0) ; 29 to 0
    streamSniperUp(151, 200) ; 151 to 200
return

F3::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(100, 200) ; 100 to 200
    streamSniperDown(29, 0) ; 29 to 0
    streamSniperUp(30, 100) ; 30 to 100
return

F4::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(0, 200) ; 0 to 200
return


F5::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(0, 50) ; 0 to 50
return

F6::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(51, 100) ; 51 to 100
return

F7::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(100, 150) ; 100 to 150
return

F8::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(150, 200) ; 150 to 200
return

streamSniperUp(start, end) {
    ToolTip, Start ; Display tooltip indicating loop start
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
    
    LoopStartTime := A_TickCount ; Record loop start time

    Loop, % (end - start + 1) {
        if (!loopState) 
            break  ; Exit the loop
    
        Send % (start + A_Index - 1)
        Sleep, 10
        Send, {Enter}
        Sleep, 10
        
        if (Mod(A_Index, tabChangeInterval) = 0 && A_Index < repetitions) { ; If the current index is a multiple of tabChangeInterval
            Send, ^{tab}  ; Send Ctrl+Tab
            Sleep, 100
        }

        ; if (Mod(A_Index, tabChangeInterval * windowChangeInterval) = 0 && A_Index < repetitions) { ; If the current index is a multiple of (tabChangeInterval * windowChangeInterval)
        ;     Send !{Tab} ; Send Alt+Tab
        ;     Sleep, 500
        ; }
        
        
        ; if (Mod(A_Index, 3) = 0 && A_Index < repetitions) ; If the current index is a multiple of tabChangeInterval
        ;     Sleep, 15000
    }
    
    LoopEndTime := A_TickCount ; Record loop end time
    LoopDuration := (LoopEndTime - LoopStartTime) / 1000 ; Calculate loop duration in Seconds

    ToolTip, Completed - Loop took %LoopDuration% Seconds
    
    ; ToolTip, Completed ; Display tooltip indicating loop completion
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
}

streamSniperDown(start, end) {
    Loop, % (start - end + 1) {
        if (!loopState) 
            break  ; Exit the loop
        
        Send % (start - A_Index + 1)
        Sleep, 10
        Send, {Enter}
        Sleep, 50
        
        if (Mod(A_Index, tabChangeInterval) = 0 && A_Index < repetitions) { ; If the current index is a multiple of tabChangeInterval
            Send, ^{tab}  ; Send Ctrl+Tab
            Sleep, 200
        }

        ; if (Mod(A_Index, tabChangeInterval * windowChangeInterval) = 0 && A_Index < repetitions) { ; If the current index is a multiple of (tabChangeInterval * windowChangeInterval)
        ;     Send !{Tab} ; Send Alt+Tab
        ;     Sleep, 200
        ; }
    }
}

F9::
    loopState := True
    commentFunction(repetitionsComment)
return

F10::
    loopState := True
    commentFunction(winComment)
return


commentFunction(comment) { ; Start/Restart Loop
    ToolTip, Start ; Display tooltip indicating loop start
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
    
    Loop, % totalAccount {  ; Start/Restart Loop
        if (!loopState)
            break  ; Exit the loop

        Send, {Raw}%comment%
        Sleep, 250
        send, {enter}
        Sleep, 250
        send,{enter}
        Sleep, 250
        Send, ^{tab}  ; Send Ctrl+Tab
        Sleep, 250
    }

    ToolTip, Completed ; Display tooltip indicating loop completion
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
}

RemoveToolTip:
    ToolTip  ; Clear the tooltip
return

