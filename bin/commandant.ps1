function show_tui
{
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   WELCOME TO COMMANDANT               " -foregroundcolor Yellow
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   SYSTEM TWEAKS AND TOOLS:                "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   1. Install WSL2                                            "
    Write-Host "   2. Install Apps                                            "
    Write-Host "   3. Install Custom WSL Kernel                               "
    Write-Host "   4. Install Custom Powershell Prompt                        "
    Write-Host "   5. Install Scoop                                           "
    Write-Host "   U. Update Installed Apps                                   "
    Write-Host "   G. Enable God Mode                                         "
    Write-Host "   H. Install Hyper-V                                         "
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   WSL CONTAINERS                                "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   6.  Install WSL2 containers                 "
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   DEBLOAT TOOLS                                             "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   C. Chris Titus' Tools"
    Write-Host "   W. Windows11 Debloat"
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()

    do
    {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            exit
        }

        switch ($choice)
        {
            1
            { pwsh -File ..\Scripts\Windows\ins_wsl.ps1 && show_tui
            }
            2
            { pwsh -File ..\Scripts\Windows\ins_apps.ps1 && show_tui
            }
            3
            { pwsh -File ..\Scripts\Windows\ins_wsl_kernel.ps1 && show_tui
            }
            4
            { pwsh -File ..\Scripts\Windows\ps_prompt.ps1 && show_tui
            }
            5
            { pwsh -File ..\Scripts\Windows\ins_scoop.ps1 && show_tui
            }
            6
            { pwsh -File ..\Scripts\Windows\containers_windows.ps1 && show_tui
            }
            'o'
            { show_tui
            }
            'u'
            { pwsh -File ..\Scripts\Windows\update_apps.ps1 && show_tui
            }
            'g'
            { pwsh -File ..\Scripts\Windows\god_mode.ps1 && show_tui
            }
            'h'
            { cmd /c ..\Scripts\Windows\hyperv-on.bat && show_tui
            }
            'c'
            { pwsh -Verb RunAs -Command "irm https://christitus.com/win | iex" && show_tui
            }
            'w'
            { pwsh -Command "& ([scriptblock]::Create((irm 'https://debloat.raphi.re/')))" && show_tui
            }
            'q'
            { abort
            }
            default
            { Write-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}


function show_linux_tui
{
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   WELCOME TO COMMANDANT               " -foregroundcolor Yellow
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   SYSTEM TWEAKS AND TOOLS:                "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   1. Install Flathub                                        "
    Write-Host "   2. Install Pods                                           "
    Write-Host "   3. Install Homebrew                                       "
    Write-Host "   4. Install Nix package manager  (single user mode)        "
    Write-Host "   5. Set up custom zsh profile                              "
    Write-Host "   6. Set up custom powershell profile                       "
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   CONTAINERS                               "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   7. Container Recipes                            "
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                                       "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()

    do
    {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            exit
        }

        switch ($choice)
        {
            1
            { pwsh -File ../Scripts/Linux/ins_flathub.ps1 && show_linux_tui
            }
            2
            { pwsh -File ../Scripts/Linux/ins_pods.ps1 && show_linux_tui
            }
            3
            { pwsh -File ../Scripts/Linux/ins_brew.ps1 && show_linux_tui
            }
            4
            { pwsh -File ../Scripts/Linux/ins_nix.ps1 && show_linux_tui
            }
            5
            { pwsh -File ../Scripts/Linux/zsh_prompt.ps1 && show_linux_tui
            }
            6
            { pwsh -File ../Scripts/Linux/ps_prompt.ps1 && show_linux_tui
            }
            7
            { pwsh -File ../Scripts/Linux/containers_linux.ps1 && show_linux_tui
            }
            'o'
            { show_linux_tui
            }
            'q'
            { abort
            }

            default
            { Write-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}

function show_mac_tui
{
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   WELCOME TO COMMANDANT               " -foregroundcolor Yellow
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   SYSTEM SETUP AND TWEAKS:                "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   1. Install Containerization                                "
    Write-Host "   2. Install Homebrew                                        "
    Write-Host "   3. Install MacPorts                                        "
    Write-Host "   4. Install Apps (needs brew)                               "
    Write-Host "   5. Install Nix                                             "
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   CONTAINERS                               "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   6. Container Recipes                             "
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               "
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()

    do
    {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            exit
        }

        switch ($choice)
        {
            1
            { pwsh -File ../Scripts/MacOS/ins_container.ps1 && show_mac_tui
            }
            2
            { pwsh -File ../Scripts/MacOS/ins_brew.ps1 && show_mac_tui
            }
            3
            { pwsh -File ../Scripts/MacOS/ins_macports.ps1 && show_mac_tui
            }
            4
            { pwsh -File ../Scripts/MacOS/ins_apps_mac.ps1 && show_mac_tui
            }
            5
            { pwsh -File ../Scripts/MacOS/nix_macos.ps1 && show_mac_tui
            }
            6
            { pwsh -File ../Scripts/MacOS/containers_mac.ps1 && show_mac_tui
            }
            'o'
            { show_mac_tui
            }
            'q'
            { abort
            }

            default
            { Write-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}

function abort
{
    Write-Output "[+] Exiting... Buh-bye!"
    exit
}

#End of Functions list
if ($isMacOS -eq $true)
{
    show_mac_tui
} elseif ($isLinux -eq $true)
{
    show_linux_tui
} else
{
    show_tui
}
