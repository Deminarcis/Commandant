###################################################################
#  Check context is running as the administrator, if not elevate  #
###################################################################
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # add -noexit before -encodedcommand to keep the admin console open after the script is run
    start-process powershell "-encodedcommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script:MyInvocation.MyCommand.ScriptBlock)))" -Verb RunAs
    exit
}

##################
#  BEGIN SCIPT:  #
##################
$wingetInstalled = cmd /c where winget '2>&1'
if ( $wingetInstalled -like '*winget.exe*' )
{
    Write-Output "[!!] Winget is already installed, continuing to set up"
}
else
{
    Write-Output "Please install winget (App Installer) from the store before continuing"
    exit
}
Set-ExecutionPolicy RemoteSigned
Write-Output "[+]  Installing WSL2"
Write-Output "[!!]  Enabling Hyper V and the use of Hyper V on this system after installing WSL2 this way will remove the ability to use nested virtualization which is turned on by default in WSL2"
Write-Output "[!!]  This will stop you running things like KVM/QEMU inside of WSL2"
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
wsl --install --no-distribution
Write-Output '[!!]  The next step may fail if you dont have a Microsoft account logged in to the store or this PC'
Write-Output "[+]  Updating everything Winget can find already installed"
winget upgrade -r --include-unknown
Write-Output "[+]  Installing Additional Apps"
winget install --accept-package-agreements -h --accept-source-agreements 'Microsoft.Powershell' 'Git.git' '7zip.7zip' 'Microsoft.VisualStudioCode' 'Microsoft.Powertoys' 'Microsoft.DevHome' 'Mozilla.Firefox' 'Mozilla.Thunderbird' 'Microsoft.WindowsTerminal' 'Oracle.Virtualbox' 'GNU.Nano' 'sharkdp.bat'
### Install  sysinternals
Write-Output '[+] Installing SysInternals from MS store'
winget install 9P7KNL5RWT25 -s msstore --accept-package-agreements -h --accept-source-agreements
Write-Output '[+] Installing latest Python from MS store'
winget install 9NCVDN91XZQP -s msstore --accept-package-agreements -h --accept-source-agreements
Write-Output '[+] Installing Wintoys from MS store'
winget install 9P8LTPGCBZXD -s msstore --accept-package-agreements -h --accept-source-agreements
### Copy Custom kernel for WSL
Write-Output "[+]  setting up custom kernel for WSL"
Copy-Item '..\WSL Kernel\bzImage' $env:USERPROFILE
Write-Output [wsl2]`nkernel=$env:USERPROFILE\bzImage | ForEach-Object {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII
Write-Output "[+] Adding WSL paths as Windows Defender exceptions (Increases performance of containers) "
Add-MpPreference -ExclusionPath “\\wsl$\”
Add-MpPreference -ExclusionPath “\\wsl.localhost\”
### Setting up Powershell profile
New-Item $env:USERPROFILE\Documents\PowerShell\ -Type Directory
Copy-Item '..\Scripts\Microsoft.PowerShell_profile.ps1' $env:USERPROFILE\Documents\PowerShell\
Write-Output "[+]  Setting Hypervisor extensions to auto"
bcdedit /set hypervisorlaunchtype auto
Copy-Item '.\Configure_wsl.ps1' 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\'
Write-Output "[!!] Setup complete! Please restart your PC. then run configure_wsl from the same folder to finish installation [!!]"