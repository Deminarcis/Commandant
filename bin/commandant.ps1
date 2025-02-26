###################################################################
#  Check context is running as the administrator, if not elevate  #
###################################################################
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # add -noexit before -encodedcommand to keep the admin console open after the script is run
    start-process powershell "-encodedcommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script:MyInvocation.MyCommand.ScriptBlock)))" -Verb RunAs
    exit
}
###################
#  BEGIN SCRIPT:  #
###################
Write-Host "                               #                        #                
                                           ##                       ##               
  ###### #######  ##   ## ##   ## ######## ###  ## ####### ######## ###  ## ######## 
 ###           ## ### ### ### ###       ## #### ##       ##      ## #### ##    ###   
 ###      ##   ## ####### #######  ####### #######  ###  ## ####### #######    ###   
 ###      ##   ## ## # ## ## # ##  ###  ## ### ###  ###  ## ###  ## ### ###    ###   
  ######   #####  ##   ## ##   ##  ###  ## ###  ##  ######  ###  ## ###  ##    ###   
                  ##      ##                     #                        #          
"
$DependencyCheck = 0
$wingetInstalled = cmd /c where winget '2>&1'
if ( $wingetInstalled -like '*winget.exe*' )
{
    Write-Output "[!!] Winget is already installed, continuing to set up"
}
elseif ($DependencyCheck -eq 1 ) {
    Write-Output "skipping dependency checks for test runs"
}
else
{
    Write-Output "Please install winget (App Installer) from the store before continuing"
    exit
}
pause
Set-ExecutionPolicy RemoteSigned
function wsl-branch {
    $options = @(
        "Stable"
        "Pre Release"
        "Dont Install WSL"
    )
    $choice = $options | Out-GridView -Title "Select WSL Branch" -OutputMode Single
    switch ($choice) {
        "Stable" {
            Write-Output "[+]  Installing WSL2 Stable Branch"
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
            wsl --install --no-distribution
        }
        "Pre Release" {
            Write-Output "[+]  Installing WSL2 Pre Release Branch"
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
            wsl --install --no-distribution --pre-release
        }
        "Dont Install WSL" {
            Write-Output "[+]  Skipping WSL Installation"
        }
    }
}
wsl-branch
Write-Output "[+]  Updating everything Winget can find"
winget upgrade --all --accept-package-agreements --accept-source-agreements
Write-Output "[+]  Installing Additional Apps"
winget install --accept-package-agreements --accept-source-agreements 'Microsoft.Powershell' 'Git.git' 'Microsoft.VisualStudioCode' 'Microsoft.Powertoys' 'Microsoft.DevHome' 'Mozilla.Firefox' 'Mozilla.Thunderbird' 'Microsoft.WindowsTerminal' 'GNU.Nano' 'sharkdp.bat' 'helix.helix' 'eza-community.eza' 'Giorgiotani.Peazip'
powershell -ExecutionPolicy Bypass -Command "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://superfile.netlify.app/install.ps1'))"
### Install  sysinternals
Write-Output '[+] Installing SysInternals from MS store'
winget install 9P7KNL5RWT25 -s msstore --accept-package-agreements --accept-source-agreements
Write-Output '[+] Installing latest Python from MS store'
winget install 9NCVDN91XZQP -s msstore --accept-package-agreements --accept-source-agreements
### Copy Custom kernel for WSL
function CustomKernel{
    $options = @(
        "Yes"
        "No"
    )
    $choice = Read-Host "Do you want to install a custom kernel for WSL? ($($options -join ', '))"
    if ($choice -eq "Yes") {
        Write-Output "[+] Installing custom kernel for WSL"
        Copy-Item '..\WSL Kernel\bzImage' $env:USERPROFILE
        Write-Output "[wsl2]`nkernel=$env:USERPROFILE\bzImage" | ForEach-Object {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII
    } else {
        Write-Output "[+] Skipping custom kernel installation"
    }
}
Write-Output "[+]  setting up custom kernel for WSL"
CustomKernel
Write-Output "[+] Adding WSL paths as Windows Defender exceptions (Increases performance of containers) "
Add-MpPreference -ExclusionPath "\\wsl$\"
Add-MpPreference -ExclusionPath "\\wsl.localhost\"
### Setting up Powershell profile
function customPS {
    $options = @(
        "Yes"
        "No"
    )
    $choice = Read-Host "Do you want to install a Powershell Prompt? ($($options -join ', '))"
    if ($choice -eq "Yes") {
        Write-Output "[+] Installing custom powershell prompt"
        New-Item $env:USERPROFILE\Documents\PowerShell\ -Type Directory -Force
        Copy-Item '..\Scripts\Microsoft.PowerShell_profile.ps1' "$env:USERPROFILE\Documents\PowerShell\"
    } else {
        Write-Output "[+] Skipping custom powershell prompt"
    }
}
customPS
Write-Output "[+]  Setting Hypervisor extensions to auto"
bcdedit /set hypervisorlaunchtype auto
Write-Output "[!!] Setup complete! Please restart your PC. [!!]"
