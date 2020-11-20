
ahkpath:=A_AhkPath
; RegExMatch(ahkpath, "(.*\\AutoHotkey.exe)", ahkinstallpath)
ahkinstallpath:=StrReplace(ahkpath, "\AutoHotkey.exe")
; ahkinstallpath=C:\Program Files\AutoHotkey
msgbox, %ahkinstallpath%

ahk2exe_path =%ahkinstallpath%\Compiler\Ahk2Exe.exe

if not FileExist (ahk2exe_path){
	return 
	ExitAPP
}

command=/in %A_ScriptDir%\AHKC.ahk /out %A_ScriptDir%\AHKC.exe /ICON %A_ScriptDir%\icon.ico
msgbox,%command%
Run %ComSpec% /c "Ahk2Exe.exe %command%"
if not FileExist ("AHKC.exe"){
	return 
	ExitAPP
}

FileCopy AHKC.exe , %ahkinstallpath%\Compiler
