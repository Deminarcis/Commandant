function show_tui {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "   Welcome to the Commandant               " -foregroundcolor Magenta
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "   System Setup and Tweaks:                " -foregroundcolor Green
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   1. Install WSL2                    2. Install Apps ( i - show installed )  " -foregroundcolor Green
    Write-Host "   3. Install Custom WSL Kernel       4. Install Custom Powershell Prompt     " -foregroundcolor Green
    Write-Host "   5. Install Scoop                   U. Update Installed Apps                " -foregroundcolor Green
    Write-Host "   G. Enable God Mode" -foregroundcolor Green
    Write-Host ""
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "   WSL Distros                             " -foregroundcolor Green
    Write-Host "   6.  Fedora             7.  Ubuntu             8.  Kali " -foregroundcolor Green
    Write-Host "   9.  OpenSuse Leap     10. Arch!             " -foregroundcolor Green
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               " -foregroundcolor Green
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()

    do {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit') {
            exit
        }

        switch ($choice) {
            1 { install_wsl2 }
            2 { install_apps }
            3 { install_custom_kernel }
            4 { install_custom_prompt }
            5 { install_scoop }
            6 { fedora_wsl }
            7 { ubuntu_wsl }
            8 { kali_wsl }
            9 { suse_leap_wsl }
            10 { arch_wsl }
            'o' { show_tui }
            'i' { show_installed_apps }
            'u' { update_installed }
            'g' { enable_god_mode }
            'q' { quit }

            default { Write-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}

function install_wsl2 {
    Clear-Host
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
    Start-Sleep 10
    Clear-Host
    show_tui
}

# New function for installing multiple apps
# Main function to install apps via winget

function install_apps {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "  Welcome to the Commandant               " -foregroundcolor Magenta
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "  Pick an app to install:                 " -foregroundcolor Red
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "  1. Powershell      2. VSCode      3. Powertoys " -foregroundcolor Red
    Write-Host "  4. Zen Browser     5. Google Chrome   6. Firefox Browser " -foregroundcolor Red
    Write-Host "  7. Mozilla Thunderbird   8. bat       9. Nano      " -foregroundcolor Red
    Write-Host "  10. MS Edit       11. lsd      12. Helix  " -foregroundcolor Red
    Write-Host "  13. sysinternals  14. 7zip     15. Bitwarden  " -foregroundcolor Red
    Write-Host "  16. Haruna        17. WinFsp     18. Zed  " -foregroundcolor Red
    Write-Host "  19. Bleachbit     20. Discord     21. Obsidian " -foregroundcolor Red
    Write-Host "  22 Mesa 3D " -foregroundcolor Red
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host "   s to search for package                 " -foregroundcolor Red
    Write-Host "   i to install unlisted app               " -foregroundcolor Red
    Write-Host "   u to update installed apps              " -foregroundcolor Red
    Write-Host "   b to Go Back                            " -foregroundcolor Red
    Write-Host "|--------------------------------------------------------------------------------│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()

    do {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit ot 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit') {
            exit
        }

        switch ($choice) {
            1 { scoop install pwsh && install_apps }
            2 { scoop install vscode && install_apps }
            3 { scoop install extras/powertoys && install_apps }
            4 { scoop install extras/zen-browser && install_apps }
            5 { scoop install extras/googlechrome && install_apps }
            6 { scoop install extras/firefox && install_apps }
            7 { scoop install extras/thunderbird && install_apps }
            8 { scoop install bat && install_apps }
            9 { scoop install nano && install_apps }
            10 { scoop install edit && install_apps }
            11 { scoop install lsd && install_apps }
            12 { scoop install helix && install_apps }
            13 { scoop install extras/sysinternals && install_apps }
            14 { scoop install 7zip && install_apps }
            15 { scoop install extras/bitwarden && install_apps }
            16 { winget install --id=KDE.Haruna -e && install_apps }
            17 { scoop install nonportable/winfsp-np && install_apps  }
            18 { scoop install extras/zed && install_apps }
            19 { scoop install extras/bleachbit && install_apps }
            20 { scoop install extras/discord && install_apps}
            21 { scoop install extras/obsidian && install_apps }
            22 { scoop install games/mesa3d && install_apps }
            23 { scoop install yt-dlp ffmpeg }
            24 { scoop install ffmpeg }
            'o' { install_apps }
            'i' { $unlisted_app = Read-Host "Enter the name of the app to install"; scoop install $unlisted_app }
            's' { $search_app = Read-Host "Enter the name of the package you are looking for: "; scoop search $search_app }
            'u' { update_installed }
            'b' { show_tui }
            default { Write-Host "Pick a number to continue or press 'b' to go back or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}

function update_installed {
    Clear-Host
    Write-Host "[+] Updating installed Scoop Apps..."
    scoop update *
    Write-Host ""
    Write-Host "[+] Updating installed Winget Apps..."
    winget upgrade --all
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function show_installed_apps {
    Clear-Host
    Write-Host ""
    Write-Host "[+] Installed Winget Apps:"
    winget list
    Write-Host ""
    Write-Host "[+] Installed Scoop Apps:"
    scoop list
    Start-Sleep -Seconds 10
    Clear-Host
    show_tui
}

function install_custom_kernel {
    Clear-Host
    Write-Host "[+] Installing custom kernel for WSL 2..."
    Write-Output "[+] Installing custom kernel for WSL"
    Copy-Item '..\WSL Kernel\bzImage' $env:USERPROFILE
    Write-Output "[wsl2]`nkernel=$env:USERPROFILE\bzImage" | ForEach-Object {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII -Append
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function install_custom_prompt {
    Clear-Host
    Write-Host "[+] Installing custom powershell prompt..."
    New-Item "$env:USERPROFILE\Documents\PowerShell\" -Type Directory -Force
    Copy-Item '..\Scripts\Microsoft.PowerShell_profile.ps1' "$env:USERPROFILE\Documents\PowerShell\"
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function fedora_wsl {
    wsl --install FedoraLinux-42
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function ubuntu_wsl {
    wsl --install Ubuntu
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function arch_wsl {
    wsl --install archlinux
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function kali_wsl {
    wsl --install kali-linux
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function suse_leap_wsl {
    wsl --install openSUSE-Leap-15.6
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}


function install_scoop {
    Clear-Host
    Write-Host "[+] Installing Scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    scoop bucket add main
    scoop bucket add extras
    scoop bucket add nerd-fonts
    scoop bucket add nonportable
    scoop bucket add games
    scoop install aria2
    scoop install sudo
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function enable_god_mode {
    Clear-Host
    Write-Host "[+] Enabling God Mode..."
    New-Item "$env:USERPROFILE\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" -Type Directory -Force
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function quit {
    Write-Host "[+] Exiting... Buh-bye!"
    exit
}

#End of Functions list
show_tui
