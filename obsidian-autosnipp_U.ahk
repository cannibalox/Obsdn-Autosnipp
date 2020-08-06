^+c::		 	 ; CTRL+SHIFT+C - define shortcut here 
	Clipboard := ; Clear the clipboard
	send ^c		 ; COPY selection
	ClipWait	 ; wait for the clipboard to contain data.
	gosub AutoSnipp
return

^+x::			 ; CTRL+SHIFT+X define shortcut here. 
	Clipboard := ; Clear the clipboard
	send ^x		 ; CUT selection
	ClipWait	 ; wait for the clipboard to contain data.
	gosub AutoSnipp
return

AutoSnipp:
	; ===== retrieve windows title ======
	WinGetActiveTitle, Title	

	; windows title beautification - remove the ending part with the program name e.g. - Firefox
	StringGetPos,pos,Title,%A_space%-,R
	if (pos != -1)
	Title := SubStr(Title,1,pos)


	; ===== create folder vault\snippets\yyyyMM ======
	Snipdir := "P:\phi\obsidian\obsdn-vault\snippets" ; !!! change this to your own folder !!!
	FormatTime, thismonth,, yyyyMM
	FileID = xx_%A_Now%-%A_Msec%_%Title%
	IfNotExist, %Snipdir%\%thismonth%\
		FileCreateDir, %Snipdir%\%thismonth%\

	; ===== create snippet =====
	BadChars := "+=!@#$%^&*?()|/\,><};{"	; list invalid characters
	;loop trough all the characters that need to be replaced in filename
	Loop, Parse, BadChars
		{
			;if a bad character is found, remove it
			StringReplace, FileID, FileID, %A_LoopField%,, All
		}
	
	; ====== create a new .md file with clipboard contents =======
	FileEncoding UTF-8-RAW
	FileAppend, %Clipboard%, %Snipdir%\%thismonth%\%FileID%.md	
	ClipWait
	
	; ====== create the transclusion link, put it in clipboard =======
	Clipboard = ![[%FileID%]]	
	MsgBox saved selection in \snippets\%thismonth%\ as`n%FileID%.md`nTransclusion link ready to be pasted ; remove this line for faster operation
return