function show_tui
{
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Welcome to the Commandant               " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   System Setup and Tweaks:                " -foregroundcolor Green
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   1. Install WSL2                                            " -foregroundcolor Green
    Write-Host "   2. Install Apps                                            " -foregroundcolor Green
    Write-Host "   3. Install Custom WSL Kernel                               " -foregroundcolor Green
    Write-Host "   4. Install Custom Powershell Prompt                        " -foregroundcolor Green
    Write-Host "   5. Install Scoop                                           " -foregroundcolor Green
    Write-Host "   U. Update Installed Apps                                   " -foregroundcolor Green
    Write-Host "   G. Enable God Mode                                         " -foregroundcolor Green
    Write-Host "   H. Install Hyper-V                                         " -foregroundcolor Green
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   WSL Distros                                 " -foregroundcolor Green
    Write-Host "   6.  Install WSL2 containers                 " -foregroundcolor Green
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               " -foregroundcolor Green
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
            { pwsh -File ..\Scripts\Windows\ins_wsl.ps1
            }
            2
            { pwsh -File ..\Scripts\Windows\ins_apps.ps1
            }
            3
            { pwsh -File ..\Scripts\Windows\ins_wsl_kernel.ps1
            }
            4
            { pwsh -File ..\Scripts\Windows\ps_prompt.ps1
            }
            5
            { pwsh -File ..\Scripts\Windows\ins_scoop.ps1
            }
            6
            { pwsh -File ..\Scripts\Windows\containers_windows.ps1
            }
            'o'
            { show_tui
            }
            'u'
            { pwsh -File ..\Scripts\Windows\update_apps.ps1
            }
            'g'
            { pwsh -File ..\Scripts\Windows\god_mode.ps1
            }
            'h'
            { cmd /c ..\Scripts\Windows\hyperv-on.bat
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
    Write-Host "   Welcome to the Commandant               " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   System Setup and Tweaks:                " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   1. Install Flathub                                        " -foregroundcolor Cyan
    Write-Host "   2. Install Pods                                           " -foregroundcolor Cyan
    Write-Host "   3. Install Homebrew                                       " -foregroundcolor Cyan
    Write-Host "   4. Install Nix package manager  (single user mode)        " -foregroundcolor Cyan
    Write-Host "   5. Set up custom zsh profile                              " -foregroundcolor Green
    Write-Host "   6. Set up custom powershell profile                              " -foregroundcolor Green
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Container Recipes                               " -foregroundcolor Green
    Write-Host "   7. Setup containers                             " -foregroundcolor Green
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               " -foregroundcolor Green
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
            { pwsh -File ../Scripts/Linux/ins_flathub.ps1
            }
            2
            { pwsh -File ../Scripts/Linux/ins_pods.ps1
            }
            3
            { pwsh -File ../Scripts/Linux/ins_brew.ps1
            }
            4
            { pwsh -File ../Scripts/Linux/ins_nix.ps1
            }
            5
            { pwsh -File ../Scripts/Linux/zsh_prompt.ps1
            }
            6
            { pwsh -File ../Scripts/Linux/ps_prompt.ps1
            }
            7
            { pwsh -File ../Scripts/Linux/containers_linux.ps1
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
    Write-Host "   Welcome to the Commandant               " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   System Setup and Tweaks:                " -foregroundcolor Green
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host "   1. Install Containerization                                " -foregroundcolor Green
    Write-Host "   2. Install Homebrew                                        " -foregroundcolor Green
    Write-Host "   3. Install MacPorts                                        " -foregroundcolor Green
    Write-Host "   4. Install Apps (needs brew)                               " -foregroundcolor Green
    Write-Host "   5. Install Nix                               " -foregroundcolor Green
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Container Recipes                               " -foregroundcolor Green
    Write-Host "   6. Setup containers                             " -foregroundcolor Green
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               " -foregroundcolor Green
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
            { pwsh -File ../Scripts/MacOS/ins_container.ps1
            }
            2
            { pwsh -File ../Scripts/MacOS/ins_brew.ps1
            }
            3
            { pwsh -File ../Scripts/MacOS/ins_macports.ps1
            }
            4
            { pwsh -File ../Scripts/MacOS/ins_apps_mac.ps1
            }
            5
            { pwsh -File ../Scripts/MacOS/nix_macos.ps1
            }
            6
            { pwsh -File ../Scripts/MacOS/containers_mac.ps1
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
if ($isMac -eq $true)
{
    show_mac_tui
} elseif ($isLinux -eq $true)
{
    show_linux_tui
} else
{
    show_tui
}
