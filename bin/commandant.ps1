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
        1  = @{ Name = "PowerShell Core"; ID = "Microsoft.Powershell" }
        2  = @{ Name = "Git CLI"; ID = "Git.git" }
        3  = @{ Name = "Visual Studio Code"; ID = "Microsoft.VisualStudioCode" }
        4  = @{ Name = "Microsoft Powertoys"; ID = "Microsoft.Powertoys" }
        5  = @{ Name = "Windows Terminal"; ID = "Microsoft.WindowsTerminal" }
        6  = @{ Name = "Zen Browser"; ID = "Zen-Team.Zen-Browser" }
        7  = @{ Name = "Firefox"; ID = "Mozilla.Firefox" }
        8  = @{ Name = "Floorp"; ID = "Ablaze.Floorp" }
        9  = @{ Name = "Brave"; ID = "Brave.brave" }
        10 = @{ Name = "Thunderbird"; ID = "Mozilla.Thunderbird" }
        11 = @{ Name = "Bat"; ID = "sharkdp.bat" }
        12 = @{ Name = "Nano"; ID = "GNU.Nano" }
        13 = @{ Name = "MS Edit"; ID = "Microsoft.Edit" }
        14 = @{ Name = "Eza"; ID = "eza-community.eza" }
        15 = @{ Name = "Helix"; ID = "helix.helix" }
        16 = @{ Name = "Sysinternals"; ID = "sysinternals" }
        17 = @{ Name = "Files"; ID = "filescommunity.files" }
        18 = @{ Name = "7Zip"; ID = "7zip.7zip" }
        19 = @{ Name = "Bitwarden"; ID = "Bitwarden.Bitwarden" }
        20 = @{ Name = "Bleachbit"; ID = "bleachbit.bleachbit" }
        21 = @{ Name = "FastFetch"; ID = "fastfetch-cli.fastfetch" }
        22 = @{ Name = "Wget"; ID = "Gnu.wget2" }
        23 = @{ Name = "Libreoffice"; ID = "TheDocumentFoundation.Libreoffice" }
        24 = @{ Name = "Discord"; ID = "Discord.Discord" }
        25 = @{ Name = "Telegram"; ID = "Telegram.TelegramDesktop" }
        26 = @{ Name = "Obsidian"; ID = "obsidian.obsidian" }
        27 = @{ Name = "Qbittorrent"; ID = "qbittorrent.qbittorrent" }
        28 = @{ Name = "Steam"; ID = "Valve.Steam" }
        29 = @{ Name = "Plex"; ID = "Plex.PlexMediaPlayer" }
        30 = @{ Name = "Haruna"; ID = "Kde.Haruna" }
        31 = @{ Name = "Okular PDF Viewer"; ID = "Kde.Okular" }
        32 = @{ Name = "Plex Server"; ID = "Plex.PlexMediaServer" }
        33 = @{ Name = "Jellyfin Media Server"; ID = "Jellyfin.Server" }
        34 = @{ Name = "Jellyfin Media Player"; ID = "Jellyfin.JellyfinMediaPlayer" }
        35 = @{ Name = "Github Desktop"; ID = "GitHub.GitHubDesktop" }
        36 = @{ Name = "Winfsp"; ID = "WinFsp.WinFsp" }
        37 = @{ Name = "Podman Desktop"; ID = "RedHat.Podman-Desktop" }
        38 = @{ Name = "Docker Desktop"; ID = "Docker.DockerDesktop" }
        39 = @{ Name = "Prism Launcher"; ID = "PrismLauncher.PrismLauncher" }
        40 = @{ Name = "Jetbrains Toolbox"; ID = "JetBrains.Toolbox" }
    }


    Write-Host "Select apps to install (use numbers separated by commas):"
    foreach ($key in $Apps.Keys) {
        Write-Host "$key) $($Apps[$key].Name)"
    }
    $selection = Read-Host "Enter your choices"
    $selectedIndexes = $selection -split "," | ForEach-Object { $_.Trim() -as [int] }

    $selectedApps = $selectedIndexes | Where-Object { $Apps.ContainsKey($_) } | ForEach-Object { $Apps[$_] }

    if ($selectedApps.Count -eq 0) {
        Write-Host "No valid selection made."
        return
    }

    Write-Host "Installing selected apps..."
    foreach ($app in $selectedApps) {
        Write-Host "Installing $($Apps.Name)..."
        try{
            winget install --id $Apps.ID --accept-package-agreements --accept-source-agreements
            Write-Host "$($Apps.Name) installed successfully"
        }
        catch{
            Write-Host "Error installing $($Apps.Name): $_" -ForegroundColor Red
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
