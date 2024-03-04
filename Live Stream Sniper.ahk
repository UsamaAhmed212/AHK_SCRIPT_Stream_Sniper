; Multiline string containing multiple lines of text
messagesString =
(
{U+2764}
{U+2665}
{U+1FA82}
{U+1F396}
{U+1F3C6}
{U+1F3C5}
{U+1F947}
{U+1F948}
{U+1F949}
{U+1F3AF}
{U+1F451}
{U+1F3AE}
)

; Define your array of messages
messages := []

; Split the string by commas
messagesStrSplitArray := StrSplit(messagesString, "`n")

; Loop through each value in messagesStrSplitArray and push it into messages
for index, value in messagesStrSplitArray
    messages.Push(value)


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
    Loop, 999 {
        if (!loopState)
            break  ; Exit the loop
        
        ; Generate a random index within the range of the array
        Random, randomIndex, 1, messages.MaxIndex()

        Send % messages[randomIndex]
        Send, {Enter}
        Sleep, 250000
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

