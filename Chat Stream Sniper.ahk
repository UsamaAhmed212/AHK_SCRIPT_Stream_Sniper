global repetitionsComment := "#PubgDaddy"

; global winComment := "SpikE | OP 5400684791"
; global winComment := "Hasib | 51775690258" ;umama
global winComment := "GUNDA . 0P  5244828288"
; global winComment := "S8ULNOOBEDIAN  51801336333"


; Multiline string containing multiple lines of text
winAccountString =
(
SpikE | OP  5400684791
Hasib | 51775690258
GUNDA . 0P  5244828288
S8ULNOOBEDIAN  51801336333
个EMO  51238048239
)


global repetitions := 250 ; Define the number of repetitions

global totalAccount := 25 ; Define the number of accounts

global tabChangeInterval := 3 ; Define the interval for tab change

global randomizeArray := True ; Randomize Array Fisher-Yates Algorithm

global windowChangeInterval := 8 ; Define the (interval or number of tabs) for window change

global loopState := True ; Initialize Loop State



F3:: ; Start
    ; Define your array of winAccounts
    winAccounts := []

    ; Split the string by (new line)
    winAccountStringArray := StrSplit(winAccountString, "`n")

    ; Loop through each value in winAccountStringArray and push it into winAccounts
    for index, value in winAccountStringArray
        winAccounts.Push(value)

    ; Concatenate all winAccounts into a single string
    winAccountsString := ""
    Loop % winAccounts.MaxIndex()
        winAccountsString .= winAccounts[A_Index] "`r`n"  ; Append each comment with a new line

    ; Define the filename for the temporary text file
    tempFile := "temp_chat_stream_sniper.txt"

    ; Save the concatenated comments to the temporary text file
    FileDelete, %tempFile%  ; Delete any existing temp file
    FileAppend, %winAccountsString%, %tempFile%  ; Append all comments to the temp file

    ; Open the temporary file using the default program (usually Notepad)
    Run, %tempFile%

    ; Read the contents of the temporary file
    FileRead, fileContents, %tempFile%

    ; Display the concatenated comments from the file in a message box
    MsgBox, % fileContents

    ; Copy the concatenated comments to the clipboard
    Clipboard := fileContents

    ; Delete the temporary file
    FileDelete, %tempFile%
return



Esc::
   loopState := False
return

F1::
    pause, toggle
    ToolTip, % (A_IsPaused ? "Script Paused" : "Script Resumed") ; Display tooltip indicating script state
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
return


; F2::  ; Start/Restart Loop
;     loopState := True
;     streamSniper(100, 150) ; 100 to 150
;     streamSniper(30, 99) ; 30 to 99
;     streamSniperDown(29, 0) ; 29 to 0
;     streamSniper(151, 200) ; 151 to 200
; return

; F3::  ; Start/Restart Loop
;     loopState := True
;     streamSniper(100, 200) ; 100 to 200
;     streamSniperDown(29, 0) ; 29 to 0
;     streamSniper(30, 100) ; 30 to 100
; return

F2::  ; Start/Restart Loop
    loopState := True
    streamSniperUp(0, 200) ; 0 to 200
return


F4::  ; Start/Restart Loop
    loopState := True
    streamSniper(201, 250) ; 201 to 250
return

F5::  ; Start/Restart Loop
    loopState := True
    streamSniper(0, 50) ; 0 to 50
return

F6::  ; Start/Restart Loop
    loopState := True
    streamSniper(51, 100) ; 51 to 100
return

F7::  ; Start/Restart Loop
    loopState := True
    streamSniper(100, 150) ; 100 to 150
return

F8::  ; Start/Restart Loop
    loopState := True
    streamSniper(150, 200) ; 150 to 200
return

; Function to shuffle an array using the Fisher-Yates algorithm
RandomizeArray(array) {
    Random, seed
    Random, random
    Random, random, 1, array.MaxIndex()
    Random, random, 1, array.MaxIndex()
    Random, random
    Loop, % array.MaxIndex() {
        Random, index, A_Index, array.MaxIndex()
        ; Swap array[A_Index] and array[index]
        temp := array[A_Index]
        array[A_Index] := array[index]
        array[index] := temp
    }
}

streamSniper(start, end) {
    ToolTip, Start ; Display tooltip indicating loop start
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
    
    LoopStartTime := A_TickCount ; Record loop start time
    
    ; Create an array of numbers from start to end
    randomNumbers := []

    Loop, % (end - start + 1) {
        if (!loopState) 
            break  ; Exit the loop
    
        randomNumbers.Push(start + A_Index - 1)

        ; Send % (start + A_Index - 1)
        ; Sleep, 10
        ; Send, {Enter}
        ; Sleep, 10
        
        ; if (Mod(A_Index, tabChangeInterval) = 0 && A_Index < repetitions) { ; If the current index is a multiple of tabChangeInterval
        ;     Send, ^{tab}  ; Send Ctrl+Tab
        ;     Sleep, 100
        ; }

        ; if (Mod(A_Index, tabChangeInterval * windowChangeInterval) = 0 && A_Index < repetitions) { ; If the current index is a multiple of (tabChangeInterval * windowChangeInterval)
        ;     Send !{Tab} ; Send Alt+Tab
        ;     Sleep, 500
        ; }
        
        
        ; if (Mod(A_Index, 3) = 0 && A_Index < repetitions) ; If the current index is a multiple of tabChangeInterval
        ;     Sleep, 15000
    }

    ; Check if randomizeArray is set to True and shuffle the array if needed
    if (randomizeArray) {
        RandomizeArray(randomNumbers) ; Shuffle the array using Fisher-Yates algorithm
    }

    ; Iterate through the shuffled array and send each unique number
    for index, number in randomNumbers {
        if (!loopState) 
            break  ; Exit the loop
    
        Send, % number
        Sleep, 10
        Send, {Enter}
        Sleep, 10
        
        if (Mod(A_Index, tabChangeInterval) = 0 && A_Index < repetitions) { ; If the current index is a multiple of tabChangeInterval
            Send, ^{tab}  ; Send Ctrl+Tab
            Sleep, 100
        }
    }
    
    LoopEndTime := A_TickCount ; Record loop end time
    LoopDuration := (LoopEndTime - LoopStartTime) / 1000 ; Calculate loop duration in Seconds

    ToolTip, Completed - Loop took %LoopDuration% Seconds
    
    ; ToolTip, Completed ; Display tooltip indicating loop completion
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
}

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


F12::
    Send, {Raw}%winComment%
return

F11::
    loopState := True
    findComment()
return

findComment() { ; Start/Restart Loop
    ToolTip, Start ; Display tooltip indicating loop start
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
    
    Loop, % totalAccount {  ; Start/Restart Loop
        if (!loopState)
            break  ; Exit the loop

        Send, ^f ; Send Ctrl+F
        Sleep, 100
        Send, ^v ; Send Ctrl+V
        Sleep, 100
        Send, {Enter}  ; Send Enter
        Sleep, 500
        Send, ^{tab}  ; Send Ctrl+Tab
        Sleep, 250
    }

    ToolTip, Completed ; Display tooltip indicating loop completion
    SetTimer, RemoveToolTip, 2000  ; Remove the tooltip after 2 Seconds
}

RemoveToolTip:
    ToolTip  ; Clear the tooltip
return

