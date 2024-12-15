### Install kali-linux as a container (intentionally unconfigured)
Write-Output '[+] Installing kali-linux from MS store'
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
Write-Output '[!!] Please close the following two terminals manually when each step is done (scripts will tell you if they can) [!!]'
wsl.exe -d kali-linux --exec 'apt update && apt full-upgrade' | Out-Null
wsl.exe -d kali-linux --exec ../Scripts/configure_wsl.sh | Out-Null