#Requires AutoHotkey v2.0
#SingleInstance Force



;----------------------------<{ Key Remapping }> 

; Swap CapsLock and Esc Keys
CapsLock::Esc
Esc::CapsLock

; Use Vim motions for Arrow key replacement
!h::Left     ; Alt+h → Left arrow
!j::Down     ; Alt+j → Down arrow
!k::Up       ; Alt+k → Up arrow
!l::Right    ; Alt+l → Right arrow

; Add Highlight Selection to Vim Motions on holding Shift Key
+!h::Send "+{Left}"  
+!j::Send "+{Down}"  
+!k::Send "+{Up}"    
+!l::Send "+{Right}" 

; This Should move windows between screens...
^l::Send "+#{Right}"
^h::Send "+#{Left}"

; This Should move windows between zones of parent monitor...
!#l::Send "#{Right}"
!#h::Send "#{Left}"
!#k::Send "#{Up}"
!#j::Send "#{Down}"




;----------------------------<{ Shortcuts }> 

; Application/Link Variables
chromePath := "C:\Program Files\Google\Chrome\Application\chrome.exe"
downloadsPath := "C:\Users\Trist\Downloads"
todoistURL := "https://app.todoist.com/app/today"
spotifyURL := "https://open.spotify.com/playlist/140tJ4I1234W5u8F4J5PcV"
helpFile := A_ProgramFiles "\AutoHotkey\v2\AutoHotkey.chm"

#c::Run chromePath ; Open Chrome
#o::Run downloadsPath ; This Shortcut opens the Downloads folder
#h::Run helpFile ; This opens the AutoHotKey documentation for quick reference
#a::Edit ; This opens this file in the default editor for quick editing




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
