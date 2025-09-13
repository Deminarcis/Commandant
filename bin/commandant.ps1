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

function show_tui {
    Write-Host ""
    Write-Host ""
    Write-Host "╭───────────────────────────────────────────╮"
    Write-Host "│   Welcome to the Commandant               │"
    Write-Host "│   System Setup and Tweaks:                │"
    Write-Host "│   1. Install WSL2                         │"
    Write-Host "│   2. Install Apps ( i - show installed )  │"
    Write-Host "│   3. Install Custom WSL Kernel            │"
    Write-Host "│   4. Install Custom Powershell Prompt     │"
    Write-Host "│   5. Install Everything  (1-5)            │"
    Write-Host "│-------------------------------------------│"
    Write-Host "│   WSL Distros                             │"
    Write-Host "│   6.  Fedora                              │"
    Write-Host "│   7.  Ubuntu                              │"
    Write-Host "│   8.  Kali                                │"
    Write-Host "│   9.  OpenSuse Leap                       │"
    Write-Host "│   10. Arch!                               │"
    Write-Host "│-------------------------------------------│"
    Write-Host "│   q to Quit                               │"
    Write-Host "╰───────────────────────────────────────────╯"
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
            'i' { show_installed_apps }
            default { Write-Host "Pick a number to continue or press 'q' to quit ot 'o' to view the options again"
                continue
            }
        }
    } while ($true)
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
    Start-Sleep 10
    show_tui
}

# New function for installing multiple apps
# Main function to install apps via winget

function install_apps {
    Write-Host ""
    Write-Host ""
    Write-Host "╭───────────────────────────────────────────╮"
    Write-Host "│   Welcome to the Commandant               │"
    Write-Host "│   Pick an app to install:                 │"
    Write-Host "│    1. Powershell                          │"
    Write-Host "│    2. VSCode                              │"
    Write-Host "│    3. Powertoys                           │"
    Write-Host "│    4. Zen Browser                         │"
    Write-Host "│    5. Brave Browser                       │"
    Write-Host "│    6. Firefox Browser                     │"
    Write-Host "│    7. Mozilla Thunderbird                 │"
    Write-Host "│    8. bat                                 │"
    Write-Host "│    9. Nano                               │"
    Write-Host "│    10. MS Edit                            │"
    Write-Host "│    11. Eza                                │"
    Write-Host "│    12. Helix                              │"
    Write-Host "│    13. sysinternals                       │"
    Write-Host "│    14. 7zip                               │"
    Write-Host "│    15. Bitwarden                          │"
    Write-Host "│    16. Bleachbit                          │"
    Write-Host "│    17. Discord                            │"
    Write-Host "│    18. Obsidian                           │"
    Write-Host "│    19. Haruna                             │"
    Write-Host "│    20. WinFsp                             │"
    Write-Host "│-------------------------------------------│"
    Write-Host "│   b to Go Back                            │"
    Write-Host "╰───────────────────────────────────────────╯"
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
            1 { winget install --id=Microsoft.PowerShell -e }
            2 { winget install --id=Microsoft.VisualStudioCode -e }
            3 { winget install --id=Microsoft.Powertoys -e }
            4 { winget install --id=Zen-Team.Zen-Browser  -e}
            5 { winget install --id=Brave.Brave -e }
            6 { winget install --id=Mozilla.Firefox -e }
            7 { winget install --id=Mozilla.Thunderbird -e }
            8 { winget install --id=sharkdp.bat -e }
            9 { winget install --id=gnu.nano -e }
            10 { winget install --id=Microsoft.edit -e }
            11 { winget install --id=eza-community.eza -e }
            12 { winget install --id=helix.helix -e }
            13 { winget install --id=Microsoft.Sysinternals.Suite -e }
            14 { winget install --id=7zip.7zip -e }
            15 { winget install --id=Bitwarden.Bitwarden -e }
            16 { winget install --id=Bleachbit.bleachbit -e }
            17 { winget install --id=Discord.Discord -e }
            18 { winget install --id=Obsidian.Obsidian -e }
            19 { winget install --id=Haruna.Haruna -e }
            20 { winget install --id=WinFsp.WinFsp -e }
            'o' { install_apps }
            'i' { show_installed_apps }
            default { Write-Host "Pick a number to continue or press 'b' to go back or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}

# Function to show installed apps
function show_installed_apps {
    winget list | out-host -paging
    Start-Sleep -Seconds 10
    show_tui
}

function install_custom_kernel {
    Write-Host "[+] Installing custom kernel for WSL 2..."
    Write-Output "[+] Installing custom kernel for WSL"
    Copy-Item '..\WSL Kernel\bzImage' $env:USERPROFILE
    Write-Output "[wsl2]`nkernel=$env:USERPROFILE\bzImage" | ForEach-Object {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII -Append
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function install_custom_prompt {
    Write-Host "[+] Installing custom powershell prompt..."
    New-Item $env:USERPROFILE\Documents\PowerShell\ -Type Directory -Force
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


function install_everything {
    Write-Host "[+] Installing EVERYTHING!..."
    install_wsl2
    install_apps
    install_custom_kernel
    install_custom_prompt
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}
#End of Functions list
show_tui
