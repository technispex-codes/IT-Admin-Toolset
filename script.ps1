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
Start-Process "C:\working-temp\VSCodeSetup.exe" -Arguments "/VERYSILENT /MERGETASKS=!runcode"

## Wireshark
Write-Host "Installing Wireshark..."


## Clean up

