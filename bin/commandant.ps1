#Requires -RunAsAdministrator

$skipdeps = 0
$wingetInstalled = cmd /c where winget '2>&1'
if ( $wingetInstalled -like '*winget.exe*' )
{
    Write-Output "[!!] Winget is already installed, continuing to set up"
}
elseif ($skipdeps -eq 1 ) {
    Write-Output "skipping dependency checks for test runs"
}else
{
    Write-Output "Please install winget (App Installer) from the store before continuing"
    exit
}
pause

function show_tui {
# Simple TUI for Commandant with a fancy border
Write-Host ""
Write-Host ""
Write-Host "┌─────────────────────────────────────────┐"
Write-Host "|   Welcome to the Commandant             |"
Write-Host "|   Available actions:                    |"
Write-Host "|   1. Install WSL2                       |"
Write-Host "|   2. Install Apps                       |"
Write-Host "|   3. Install Custom WSL Kernel          |"
Write-Host "|   4. Install Custom Powershell Prompt   |"
Write-Host "|   5. Install everything                 |"
Write-Host "|   q to Quit                             |"
Write-Host "└─────────────────────────────────────────┘"
Write-Host ""
Write-Host ""
}

function install_wsl2 {
    Write-Host "[+] Installing WSL2..."
    function wsl_branch {
        $options = @(
            "Stable"
            "Pre Release"
        )
        $choice = Read-Host "Which Branch of WSL should be installed? ($($options -join ', '))"
        if ($choice -eq "Stable") {
            Write-Output "[+]  Installing WSL2 Stable Branch"
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
            wsl --install --no-distribution
        } elseif ($choice -eq "Pre Release") {
            Write-Output "[+]  Installing WSL2 Pre Release Branch"
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
            wsl --install --no-distribution --pre-release
        }
    }
    wsl_branch
}

function install_apps {
    Write-Host "[+] Installing Apps..."
    Write-Host "
    This script installs the following apps:
    - Powershell Core
    - Git CLI
    - Visual Studio Code
    - Microsoft Powertoys
    - Windows Terminal
    - DevHome
    - Firefox
    - Thunderbird
    - Nano
    - Bat
    - Helix
    - Eza
    - Peazip
    - Superfile
    - Sysinternals
    - Python 3
    "
    Write-Output "[+]  Updating installed apps before we start"
    winget upgrade --all --accept-package-agreements --accept-source-agreements
    Write-Output "[+]  Installing Apps"
    winget install --accept-package-agreements --accept-source-agreements 'Microsoft.Powershell' 'Git.git' 'Microsoft.VisualStudioCode' 'Microsoft.Powertoys' 'Microsoft.DevHome' 'Mozilla.Firefox' 'Mozilla.Thunderbird' 'Microsoft.WindowsTerminal' 'GNU.Nano' 'sharkdp.bat' 'helix.helix' 'eza-community.eza' 'Giorgiotani.Peazip'
    powershell -ExecutionPolicy Bypass -Command "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://superfile.netlify.app/install.ps1'))"
    ### Install  sysinternals
    winget install 9P7KNL5RWT25 -s msstore --accept-package-agreements --accept-source-agreements
    winget install 9NCVDN91XZQP -s msstore --accept-package-agreements --accept-source-agreements
    Write-Output "[+] Done!"
}

function install_custom_kernel {
    Write-Host "[+] Installing custom kernel for WSL 2..."
    Write-Output "[+] Installing custom kernel for WSL"
    Copy-Item '..\WSL Kernel\bzImage' $env:USERPROFILE
    Write-Output "[wsl2]`nkernel=$env:USERPROFILE\bzImage" | ForEach-Object {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII
    Write-Output "[+] Done!"
}

function install_custom_prompt {
    Write-Host "[+] Installing custom powershell prompt..."
    New-Item $env:USERPROFILE\Documents\PowerShell\ -Type Directory -Force
    Copy-Item '..\Scripts\Microsoft.PowerShell_profile.ps1' "$env:USERPROFILE\Documents\PowerShell\"
    Write-Output "[+] Done!"
}

function install_everything {
    Write-Host "[+] Installing EVERYTHING!..."
    install_wsl2
    install_apps
    install_custom_kernel
    install_custom_prompt
}

show_tui
$choices = @()

do {
    Write-Host
    $choice = Read-Host "Pick a number to continue or press 'q' to quit ot 'o' to view the options again"

    if ($choice -eq 'q' -or $choice -eq 'quit') {
        exit
    }

    switch ($choice) {
        1 { install_wsl2 }
        2 { install_apps }
        3 { install_custom_kernel }
        4 { install_custom_prompt }
        5 { install_everything }
        'o' { show_tui }
        default { Write-Host "Pick a number to continue or press 'q' to quit ot 'o' to view the options again"
            continue
        }
    }
} while ($true)
