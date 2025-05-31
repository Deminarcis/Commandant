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
    Write-Output "Please install winget (App Installer) from the Microsoft Store or GitHub before continuing"
    exit
}
pause

function show_tui {
    # Professional TUI for Commandant with rounded corners
    $border = "╭─────────────────────────────────────────╮"
    $borderEnd = "╰─────────────────────────────────────────╯"

    Write-Host ""
    Write-Host ""
    Write-Host $border
    Write-Host "|   Welcome to the Commandant             |"
    Write-Host "|   System Setup and Tweaks:              |"
    Write-Host "|   1. Install WSL2                       |"
    Write-Host "|   2. Install Apps                       |"
    Write-Host "|   3. Install Custom WSL Kernel          |"
    Write-Host "|   4. Install Custom Powershell Prompt   |"
    Write-Host "|   5. Install Everything  (1-5)          |"
    Write-Host "|-----------------------------------------|"
    Write-Host "|   WSL Distros                           |"
    Write-Host "|   6.  Fedora                            |"
    Write-Host "|   7.  Ubuntu                            |"
    Write-Host "|   8.  Kali                              |"
    Write-Host "|   9.  OpenSuse Leap                     |"
    Write-Host "|   10. Arch!                             |"
    Write-Host "|-----------------------------------------|"
    Write-Host "|   q to Quit                             |"
    Write-Host $borderEnd
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
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function install_apps {
    # List of available apps with descriptions
    $Apps= @{
        "PowerShell Core"       = 'Microsoft.Powershell'
        "Git CLI"               = 'Git.git'
        "Visual Studio Code"    = 'Microsoft.VisualStudioCode'
        "Microsoft Powertoys"   = 'Microsoft.Powertoys'
        "Windows Terminal"      = 'Microsoft.WindowsTerminal'
        "Zen Browser"           = 'Zen-Team.Zen-Browser'
        "Firefox"               = 'Mozilla.Firefox'
        "Floorp"                = 'Ablaze.Floorp'
        "Brave"                 = 'Brave.brave'
        "Thunderbird"           = 'Mozilla.Thunderbird'
        "Bat"                   = 'sharkdp.bat'
        "Nano"                  = 'GNU.Nano'
        "MS Edit"               = 'Microsoft.Edit'
        "Eza"                   = 'eza-community.eza'
        "Helix"                 = 'helix.helix'
        "Sysinternals"          = 'sysinternals'
        "Files"                 = 'filescommunity.files'
        "7Zip"                  = '7zip.7zip'
        "Bitwarden"             = 'Bitwarden.Bitwarden'
        "Bleachbit"             = 'bleachbit.bleachbit'
        "FastFetch"             = 'fastfetch-cli.fastfetch'
        "Wget"                  = 'Gnu.wget2'
        "Libreoffice"           = 'TheDocumentFoundation.Libreoffice'
        "Discord"               = 'Discord.Discord'
        "Telegram"              = 'Telegram.TelegramDesktop'
        "Obsidian"              = 'obsidian.obsidian'
        "Qbittorrent"           = 'qbittorrent.qbittorrent'
        "Steam"                 = 'Valve.Steam'
        "Plex"                  = 'Plex.PlexMediaPlayer'
        "Haruna"                = 'Kde.Haruna'
        "Okular PDF Viewer"     = 'Kde.Okular'
        "Plex Server"           = 'Plex.PlexMediaServer'
        "Jellyfin Media Server" = 'Jellyfin.Server'
        "Jellyfin Media Player" = 'Jellyfin.JellyfinMediaPlayer'
        "Github Desktop"        = 'GitHub.GitHubDesktop'
        "Winfsp"                = 'WinFsp.WinFsp'
        "Podman Desktop"        = 'RedHat.Podman-Desktop'
        "Docker Desktop"        = 'Docker.DockerDesktop'
        "Prism Launcher"        = 'PrismLauncher.PrismLauncher'
        "Jetbrains Toolbox"     = 'JetBrains.Toolbox'
        # Add more apps as needed...
    }


    Write-Host "Select apps to install (use numbers separated by commas):"
    $i = 1
    $Apps.Keys | ForEach-Object { [int]$i++; Write-Host "$i) $_"; $i++ }

    $selection = Read-Host "Enter your choices"
    $selectedIndexes = $selection -split "," | ForEach-Object { ($_ -as [int]) - 1 }

    $selectedApps = $selectedIndexes | Where-Object { $_ -gt 0 -and $_ -le $Apps.Count } | ForEach-Object { $Apps.Keys[$_] }

    if ($selectedApps.Count -eq 0) {
        Write-Host "No valid selection made."
        return
    }

    Write-Host "Installing selected apps..."
    foreach ($app in $selectedApps) {
        Write-Host "Installing $app..."
        try{
            winget install --id $Apps[$app] --accept-package-agreements --accept-source-agreements -ErrorAction Stop
            Write-Host "$app installed successfully"
        }
        catch{
            Write-Host "Error installing ${app}: $_" -ForegroundColor Red
        }
    }
    Write-Output "[+] Performing App Updates"
    winget upgrade -u --all
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function install_custom_kernel {
    Write-Host "[+] Installing custom kernel for WSL 2..."
    Write-Output "[+] Installing custom kernel for WSL"
    Copy-Item '..\WSL Kernel\bzImage' $env:USERPROFILE
    Write-Output "[wsl2]`nkernel=$env:USERPROFILE\bzImage" | ForEach-Object {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII -Append
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function install_custom_prompt {
    Write-Host "[+] Installing custom powershell prompt..."
    New-Item $env:USERPROFILE\Documents\PowerShell\ -Type Directory -Force
    Copy-Item '..\Scripts\Microsoft.PowerShell_profile.ps1' "$env:USERPROFILE\Documents\PowerShell\"
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function fedora_wsl {
    wsl --install FedoraLinux-42
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function ubuntu_wsl {
    wsl --install Ubuntu
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function arch_wsl {
    wsl --install archlinux
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function kali_wsl {
    wsl --install kali-linux
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}

function suse_leap_wsl {
    wsl --install openSUSE-Leap-15.6
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}


function install_everything {
    Write-Host "[+] Installing EVERYTHING!..."
    install_wsl2
    install_apps
    install_custom_kernel
    install_custom_prompt
    Write-Output "[+] Done!"
    sleep 10
    show_tui
}
#End of Functions list
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
        6 { fedora_wsl }
        7 { ubuntu_wsl }
        8 { kali_wsl }
        9 { suse_leap_wsl }
        10 { arch_wsl }
        'o' { show_tui }
        default { Write-Host "Pick a number to continue or press 'q' to quit ot 'o' to view the options again"
            continue
        }
    }
} while ($true)
