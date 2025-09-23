
#Requires AutoHotkey v2.0
#SingleInstance Force

;--------------<{ ; layer }> 

global powerPinky := false

`;:: {
    global powerPinky
    KeyWait(";", "T0.15") ; Wait up to 200ms for release

    if (!GetKeyState(";", "P")) {
        ; Tap detected
        SendText(";")
    } else {
        ; Hold detected;
        powerPinky := true
        ; Wait until key is released
        KeyWait(";")
        powerPinky := false
    }
}  

#HotIf powerPinky

; Escape common patterns
w::Send(":w")
q::Send(":q")

; VD Commander integration
1:: Run("python ..\pyvda\test.py --switch 1", , "Hide")
2:: Run("python ..\pyvda\test.py --switch 2", , "Hide")
3:: Run("python ..\pyvda\test.py --switch 3", , "Hide")
4:: Run("python ..\pyvda\test.py --switch 4", , "Hide")
5:: Run("python ..\pyvda\test.py --switch 5", , "Hide")




#HotIf



;----------------------------<{ z layer }> 

global zLayer := false

z:: {
    global zLayer
    KeyWait("z", "T0.15") ; Wait up to 200ms for release

    if (!GetKeyState("z", "P")) {
        ; Tap detected
        SendText("z")
    } else {
        ; Hold detected
        zLayer := true
        ; Wait until key is released
        KeyWait("z")
        zLayer := false
    }
}

#HotIf zLayer

; Escape common patterns
i::Send("zi")
o::Send("zo")

; Emails
e::Send("hi@ethanppl.com")
g::Send("hi@ethanppl.com")

; Simplify complicated shortcut keys
v::Send("^+v")
n::Send("^+a")
x::Send("!{F4}")

; Arrows
j::Send("{Down}")
k::Send("{Up}")
h::Send("{Left}")
l::Send("{Right}")

#HotIf



;----------------------------<{ Key Remapping }> 

; Swap CapsLock and Esc Keys
CapsLock::Esc
Esc::CapsLock

; Use Vim motions for Arrow key replacement
!h::Left     ; Alt+h → Left arrow
;!j::Down     ; Alt+j → Down arrow
;!k::Up       ; Alt+k → Up arrow
!l::Right    ; Alt+l → Right arrow

; Add Highlight Selection to Vim Motions on holding Shift Key
+!h::Send "+{Left}"  
+!j::Send "+{Down}"  
+!k::Send "+{Up}"    
+!l::Send "+{Right}" 

; This Should move windows between screens...
+^l::Send "+#{Right}"
+^h::Send "+#{Left}"

; This Should move windows between zones of parent monitor...
!#l::Send "#{Right}"
!#h::Send "#{Left}"
!#k::Send "#{Up}"
!#j::Send "#{Down}"





;----------------------------<{ Shortcuts }> 

; Application/Link Variables
chromePath := "C:\Program Files\Google\Chrome\Application\chrome.exe"
downloadsPath := "C:\Users\Trist\Downloads"
todoist := "chrome.exe --new-window --app=https://app.todoist.com/app/today"
spotify := "chrome.exe --new-window --app=https://open.spotify.com/playlist/140tJ4I1234W5u8F4J5PcV"
helpFile := A_ProgramFiles "\AutoHotkey\v2\AutoHotkey.chm"

#b::Run chromePath ; Open Chrome
#o::Run downloadsPath ; This Shortcut opens the Downloads folder
#h::Run helpFile ; This opens the AutoHotKey documentation for quick reference
#a::Edit ; This opens this file in the default editor for quick editing
#t::Run todoist
#s::Run spotify


;----------------------------<{ VD Commander }> 
#1:: Run "python ..\pyvda\test.py --switch 1"
#2:: Run "python ..\pyvda\test.py --switch 2"
#3:: Run "python ..\pyvda\test.py --switch 3"
#4:: Run "python ..\pyvda\test.py --switch 4"
#5:: Run "python ..\pyvda\test.py --switch 5"

; Some alt F4 action!
#p:: Send "!{f4}"

;----------------------------<{ Hot Strings }> 
::btw::by the way ; on tab/space
:*:brb::be right back ; instantaneous
+^0:: {
    Sleep 200
    email := "tristan.collier@bonnieplants.com"
    for char in StrSplit(email)
    {
        Send char
        Sleep 50
    }
}




;----------------------------<{ Script Automation & Dev Shortcuts }> 

; Hot reload the script for faster editing
#HotIf WinActive("ahk_exe Code.exe")
~^s:: ; ~ means "pass through" non-blocking hotkey
{
    Sleep 100
    Reload
}




;----------------------------<{ Key Legend }> 
; # = Windows Key
; ! = Alt Key
; ^ = Control
; + = Shift
; {Left} = left
; {Enter} = Enter
; {Home} = Home
; {End} = End
; {PgUp} = Page Up
; {PgDn} = Page Down
; {F1} - {F24} = Function keys




;----------------------------<{ Other }> 
; Workspace Launcher Example:
; ^!1:: {
;     Run "code"
;     Run "brave.exe --new-window https://stackoverflow.com"
;     Run "C:\Path\To\Slack.exe"
; }
