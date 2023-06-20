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
$licenseType = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" | ` Format-List ProductName
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
winget upgrade -r --include-unknown
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
Write-Output "[+]  Installing a newer Powershell"
winget install microsoft.powershell --accept-package-agreements -h --accept-source-agreements
Write-Output "[+]  Installing Host Tools"
Start-Process powershell -ArgumentList {
    choco upgrade chocolatey -y
    choco install firefox sysinternals ChocolateyGUI FoxitReader vlc python 7zip testdisk-photorec git vscode filezilla wireshark postman ffmpeg tor-browser qbittorrent openvpn rufus obs-studio bitwarden obsidian veracrypt synctrayzor powertoys -y
} -Verb RunAs
Write-Output "[+]  Enabling Hyper-V"
if ( $licenseType -like 'Windows * Home' )
{
    cmd /c pushd "%~dp0"
    cmd /c dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum > hyper-v.txt
    cmd /c for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
    cmd /c del hyper-v.txt
    cmd /c Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL
    cmd /c pause
}
else {
    DISM /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-all
}
Write-Output "[!!] Setup complete! Please restart your PC  [!!]"