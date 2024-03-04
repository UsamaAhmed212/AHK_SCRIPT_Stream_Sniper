
global loopState := True ; Initialize Loop State

Esc::
   loopState := False
return

F1::
    pause, toggle
return


F2::  ; Start/Restart Loop
    ToolTip, Live Stream Sniper Runing ; Display tooltip indicating loop Runing
    loopState := True
    LoopStartTime := A_TickCount ; Record loop start time
    Loop, 18 {
        ; send % loopState
        if (!loopState)
            break  ; Exit the loop

        ; ToolTip % A_Index
        Send % (A_Index)
        Send, {Enter}
        Sleep, 1000
    }
    LoopEndTime := A_TickCount ; Record loop end time
    LoopDuration := (LoopEndTime - LoopStartTime) / 1000 ; Calculate loop duration in seconds

    ToolTip, Completed - Loop took %LoopDuration% seconds
    
    ; ToolTip, Completed ; Display tooltip indicating loop completion
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 seconds
return


RemoveToolTip:
    ToolTip  ; Clear the tooltip
return

