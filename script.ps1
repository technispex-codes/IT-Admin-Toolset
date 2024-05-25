## Set Execution Policy for the script to run properly.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted

## Create a working directory on the C drive to handle temp files.
New-Item -ItemType Directory -Path C:\working-temp

## I like it when my scripts talk.
Write-Host "Installing Sysinternals..."

## Sysinternals
wget -Uri "https://download.sysinternals.com/files/SysinternalsSuite.zip" -Outfile "C:\working-temp\SysinternalsSuite.zip" -Verbose
Expand-Archive -Path "C:\working-temp\SysinternalsSuite.zip" -Verbose -DestinationPath "C:\Users\Public\Desktop\Sysinternals"

## VS Code
Write-Host "Installing VS Code..."
wget -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64" -Outfile "C:\working-temp\VSCodeSetup.exe"
Start-Process "C:\working-temp\VSCodeSetup.exe" -Argument "/VERYSILENT /MERGETASKS=!runcode"

# Create a shortcut for VS Code
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\Public\Desktop\Visual Studio Code.lnk")
$Shortcut.TargetPath = "C:\Program Files\Microsoft VS Code\Code.exe"
$Shortcut.Save()

## Wireshark
Write-Host "Installing Wireshark..."
wget -Uri "https://2.na.dl.wireshark.org/win64/Wireshark-4.2.5-x64.exe" -OutFile "C:\working-temp\WiresharkInstaller.exe"
Start-Process "C:\working-temp\WiresharkInstaller.exe" -Argument "/S /desktopicon=YES"

## Clean up
Write-Host "Cleaning up..."
Start-Sleep 69
Remove-Item C:\working-temp -Recurse -Force
