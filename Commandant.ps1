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
# BEGIN YOUR SCIPT HERE:
#####

Remove-Variable -Name wingetInstalled
wingetInstalled = cmd /c where winget '2>&1'
if ( $wingetInstalled -like '*winget.exe*' )
{
    Write-Output "winget is already installed"
}
else
{
    Write-Output "Please install winget (App Installer) before continuing"
    exit
}
Set-ExecutionPolicy RemoteSigned
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Import-Module PSWindowsUpdate
# Change this later, it will break windows defender but is necessary to install Kali smoothly
Set-MpPreference -DisableRealtimeMonitoring $true
# Get Windows updates
Get-WindowsUpdate
wsl --install -n --web-download
### Break here for reboot
Write-Output 'The next step may fail if you dont have a Microsoft account logged in to the store or this PC'
winget upgrade --all
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
Write-Output 'Provsioning Kali'
winget install microsoft.powershell --accept-package-agreements -h --accept-source-agreements
Install-Package chocolatey
Start-Process powershell -ArgumentList {
    choco upgrade chocolatey -y
    choco install firefox sysinternals ChocolateyGUI adobereader vlc python 7zip testdisk-photorec git vscode putty filezilla wireshark postman boxstarter ffmpeg tor-browser qbittorrent openvpn rufus obs-studio bitwarden foobar2000 obsidian -y
} -Verb RunAs
