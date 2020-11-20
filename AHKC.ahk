EnvGet ,Output,PATH
EnvGet ,currentdir,cd

; msgbox,%Output%
myOutput =%Output%
if not InStr(myOutput,"AutoHotkey\Compiler") {
	msgbox, Need to add ahk2exe to environment path.
	exitapp
}

; INFILE:=A_WorkingDir "\"a_args[1]
INFILE:= a_args[1]

RegExMatch(INFILE, "\w+", Fname)
; msgbox ,%Fname%


OUTFILE=%Fname%.exe
INFILE=%Fname%.ahk
MPRESS=
parameter =/in %INFILE% /out %OUTFILE% 
if StrLen (a_args[2] > 0){
ICONFILE :=a_args[2]
parameter = %parameter%  /ICON %ICONFILE%
}
else {
parameter = %parameter% /ICON icon.ico
}
msgbox , %parameter%
; msgbox ,"%INFILE% %OUTFILE%"
Run %ComSpec% /c "Ahk2Exe.exe %parameter%"
