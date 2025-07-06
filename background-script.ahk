#Requires AutoHotkey v2.0
#SingleInstance Force

chromePath := "C:\Program Files\Google\Chrome\Application\chrome.exe"
downloadsPath := "C:\Users\Trist\Downloads"
helpFile := A_ProgramFiles "\AutoHotkey\v2\AutoHotkey.chm"
email := "tristan.collier@bonnieplants.com"


;----------------------------<{ Key Remapping }> 
CapsLock::Esc
Esc::CapsLock
!h::Left     ; Alt+h → Left arrow
!j::Down     ; Alt+j → Down arrow
!k::Up       ; Alt+k → Up arrow
!l::Right    ; Alt+l → Right arrow
+!h::Send "+{Left}"   ; Alt+Shift+h
+!j::Send "+{Down}"   ; Alt+Shift+j
+!k::Send "+{Up}"     ; Alt+Shift+k
+!l::Send "+{Right}"  ; Alt+Shift+l


;----------------------------<{ Shortcuts }> 
#c::Run chromePath
#o::Run downloadsPath
#h::Run helpFile
#a::Edit ; This opens this file in the default editor


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
; Hot reload the script
#HotIf WinActive("ahk_exe Code.exe")
~^s:: ; ~ mean "pass through" non-blocking hotkey
{
    Sleep 100
    Reload
}


;----------------------------<{ Key Legend }> 
; # = Windows Key
; ! = Alt Key
; + = Control
; ^ = Shift
; {Left} = left
; {Enter} = Enter
; {Home}        = Home
; {End}         = End
; {PgUp}        = Page Up
; {PgDn}        = Page Down
; {F1} - {F24}   = Function keys



;----------------------------<{ Other }> 
; Workspace Launcher Example:
; ^!1:: {
;     Run "code"
;     Run "brave.exe --new-window https://stackoverflow.com"
;     Run "C:\Path\To\Slack.exe"
; }

; Learning Tutorial: https://www.youtube.com/watch?v=pT4BRiOEVY0&list=WL&index=5