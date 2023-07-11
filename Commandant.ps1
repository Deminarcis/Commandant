# if you started this script without admin rights, this will first start a new console with admin rights then run the script below
# the original console will be closed
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # add -noexit before -encodedcommand to keep the admin console open after the script is run
    start-process powershell "-encodedcommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script:MyInvocation.MyCommand.ScriptBlock)))" -Verb RunAs
    # comment this out to leave the non admin console open, but you'll not be needing it since a new one will open with admin rights
    # NOTE!: if you do comment this out, the rest of the script will be executed first as non admin, then again when the admin console appears
    # you could add another if statement down below saying if you're not admin, do something else, or add an else to this if statment
    exit
}

#####
# BEGIN SCIPT:
#####
$wingetInstalled = cmd /c where winget '2>&1'
if ( $wingetInstalled -like '*winget.exe*' )
{
    Write-Output "[!!] winget is already installed"
}
else
{
    Write-Output "Please install winget (App Installer) from the store before continuing"
    exit
}
Write-Output "[+]  Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Set-ExecutionPolicy RemoteSigned
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Import-Module PSWindowsUpdate
# Change this later, it will break windows defender but is necessary to install Kali smoothly
#Set-MpPreference -DisableRealtimeMonitoring $true
# Get Windows updates
Write-Output "[+]  Checking for updates"
Get-WindowsUpdate
Write-Output "[+]  Installing WSL2"
wsl --install
### Break here for reboot?
Write-Output '[!!]  The next step may fail if you dont have a Microsoft account logged in to the store or this PC'
### Update everything Winget can find
winget upgrade -r --include-unknown
### Install Kali
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
### Install Tumbleweed for QEMU/KVM
winget install  9MSSK2ZXXN11 -s msstore --accept-package-agreements -h --accept-source-agreements
Write-Output "[+]  Installing a newer Powershell"
winget install microsoft.powershell --accept-package-agreements -h --accept-source-agreements
Write-Output "[+]  Installing Host Tools"
Start-Process powershell -ArgumentList {
    choco upgrade chocolatey -y
    choco install firefox vivaldi sysinternals ChocolateyGUI FoxitReader vlc python 7zip testdisk-photorec git vscode filezilla wireshark postman ffmpeg tor-browser qbittorrent openvpn rufus obs-studio bitwarden obsidian veracrypt synctrayzor powertoys -y
} -Verb RunAs
Write-Output "[+]  Enabling KVM/QEMU"
powershell.exe /C 'Copy-Item .\WSL Kernel\bzImage $env:USERPROFILE'
powershell.exe /C 'Write-Output [wsl2]`nkernel=$env:USERPROFILE\bzImage | % {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII'
wsl.exe --shutdown
wsl.exe uname -a
Write-Output "[!!] Setup complete! Please restart your PC  [!!]"