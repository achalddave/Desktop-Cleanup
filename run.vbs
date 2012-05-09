Dim objShell
Set objShell=CreateObject("WScript.Shell")
strExpression="""& 'C:\Users\Achal\Documents\Achal\My Work\Programming\Powershell\Desktop-Cleanup\DesktopCleanup.ps1'"""
strCMD="powershell -sta -noProfile -NonInteractive  -nologo -command " & Chr(34) &_
"&{" & strExpression &"}" & Chr(34) 
objShell.Run strCMD,0