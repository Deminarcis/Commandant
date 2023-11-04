if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # add -noexit before -encodedcommand to keep the admin console open after the script is run
    start-process powershell "-encodedcommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script:MyInvocation.MyCommand.ScriptBlock)))" -Verb RunAs
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
SetExecutionPolicy RemoteSigned
Write-Output "[+]  Checking for updates"
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Import-Module PSWindowsUpdate
Get-WindowsUpdate
Write-Output "[+]  Installing WSL2"
wsl --install
### Break here for reboot?
Write-Output '[!!]  The next step may fail if you dont have a Microsoft account logged in to the store or this PC'
### Update everything Winget can find
winget upgrade -r --include-unknown
Write-Output "[+]  Installing Host Tools"
winget install 'Git.git' '7zip.7zip' 'Microsoft.VisualStudioCode' 'microsoft.Powertoys' 'oracle.virtualbox'
### Install Kali
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
Write-Output "[+]  Installing a newer Powershell"
winget install microsoft.powershell --accept-package-agreements -h --accept-source-agreements
Write-Output "[+]  setting up custom kernel for WSL"
powershell.exe /C 'Copy-Item .\WSL Kernel\bzImage $env:USERPROFILE'
powershell.exe /C 'Write-Output [wsl2]`nkernel=$env:USERPROFILE\bzImage | % {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII'
wsl.exe --shutdown
wsl.exe uname -a
Write-Output "[!!] Adding WSL paths as Windows Defender exceptions (Increases performance of containers) "
Add-MpPreference -ExclusionPath “\\wsl$\”
Add-MpPreference -ExclusionPath “\\wsl.localhost\”
Write-Output "[!!] Setup complete! Please restart your PC  [!!]"