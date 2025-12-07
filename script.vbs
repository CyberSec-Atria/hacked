Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

desktopPath = sh.SpecialFolders("Desktop")

' ---------------------------------------------------
' Create & launch 20 dialog boxes simultaneously
' ---------------------------------------------------
For i = 1 To 20
    msgScript = desktopPath & "\msg" & i & ".vbs"
    Set mf = fso.CreateTextFile(msgScript, True)
    mf.WriteLine "MsgBox ""You've been pranked by Deva!"", vbExclamation, ""PRANK ALERT"""
    mf.Close

    cmd = "wscript.exe //nologo """ & msgScript & """"
    sh.Run cmd, 0, False   ' non-blocking
Next

' ---------------------------------------------------
' Open Chrome and load the prank webpage
' ---------------------------------------------------
WScript.Sleep 1500   ' slight delay so popups launch first

sh.Run """C:\Program Files\Google\Chrome\Application\chrome.exe"" https://cybersec-atria.github.io/hacked/", 1, False
