#Requires AutoHotkey v2.0
#SingleInstance Force

; Send a message "hello"
!x::msgbox "hello world!"

; Key Remapping
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


; Hot Strings
::btw::by the way ; on tab/space
:*:brb::be right back ; instantaneous

; Run/Open Applications
#c::Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
; #::Run "chrome"
#o::Run "C:\Users\Trist\Downloads"
#h::Run A_ProgramFiles "\AutoHotkey\v2\AutoHotkey.chm" ; Open AutoHotKey Docs
#a::Edit ; This opens this file in the default editor

; Send Hot Keys
; +^0::{
;     Sleep 100
;     SetKeyDelay 50  ; 50ms between each keystroke
;     SendText "tristan.collier@bonnieplants.com"
; }
+^0:: {
    Sleep 200
    email := "tristan.collier@bonnieplants.com"
    for char in StrSplit(email)
    {
        Send char
        Sleep 50
    }
}


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

; Other Examples:
; Workspace Launcher
; ^!1:: {
;     Run "code"
;     Run "brave.exe --new-window https://stackoverflow.com"
;     Run "C:\Path\To\Slack.exe"
; }


; Learning Tutorial: https://www.youtube.com/watch?v=pT4BRiOEVY0&list=WL&index=5