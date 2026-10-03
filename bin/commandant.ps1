if (-not (Get-Module -ListAvailable -Name "PSWriteColor"))
{
    Install-Module -Name "PSWriteColor" -Scope CurrentUser -Force -SkipPublisherCheck
}
Import-Module -Name PSWriteColor

function show_tui
{
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Color "┌────────────────────────────────────────────────────────────┐  " -color Magenta
    Write-Color "| ", "WELCOME TO COMMANDANT", "                                      |  " -color Magenta, Red, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "SYSTEM TWEAKS AND TOOLS:", "                                   |  " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "| ", "1. Install WSL2", "                                            |  " -color Magenta, White, Magenta
    Write-Color "| ", "2. Install Apps", "                                            |  " -color Magenta, White, Magenta
    Write-Color "| ", "3. Install Custom WSL Kernel", "                               |  " -color Magenta, White, Magenta
    Write-Color "| ", "4. Install Custom Powershell Prompt", "                        |  " -color Magenta, White, Magenta
    Write-Color "| ", "5. Install Scoop", "                                           |  " -color Magenta, White, Magenta
    Write-Color "| ", "U. Update Installed Apps", "                                   |  " -color Magenta, White, Magenta
    Write-Color "| ", "G. Enable God Mode", "                                         |  " -color Magenta, White, Magenta
    Write-Color "| ", "H. Install Hyper-V", "                                         |  " -color Magenta, White, Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "WSL CONTAINERS", "                                             |  " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "|                                                            |  " -Color Magenta
    Write-Color "| ", "6.  Install WSL2 containers", "                                |  " -color Magenta, White, Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "DEBLOAT TOOLS", "                                              |  " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "| ",  "C. Chris Titus' Tools ", "                                     |  " -color Magenta, White, Magenta
    Write-Color "| ",  "W. Windows11 Debloat  ", "                                     |  " -color Magenta, White, Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ",  "q to Quit ", "                                                 |  " -color Magenta, White, Magenta
    Write-Color "└────────────────────────────────────────────────────────────┘  " -color Magenta
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
            { Start-Process Powershell -Verb RunAs -ArgumentList "irm https://christitus.com/win | iex" -Wait && show_tui
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
    Write-Color "┌────────────────────────────────────────────────────────────┐  " -color Magenta
    Write-Color "| ", "  WELCOME TO COMMANDANT", "                                    |  " -color Magenta, Red, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "SYSTEM TWEAKS AND TOOLS: ", "                                  |  " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "| ", "1. Install Flathub ", "                                        |  " -color Magenta, White, Magenta
    Write-Color "| ", "2. Install Pods ", "                                           |  " -color Magenta, White, Magenta
    Write-Color "| ", "3. Install Homebrew ", "                                       |  " -color Magenta, White, Magenta
    Write-Color "| ", "4. Install Nix package manager  (single user mode)", "         |  " -color Magenta, White, Magenta
    Write-Color "| ", "5. Set up custom zsh profile ", "                              |  " -color Magenta, White, Magenta
    Write-Color "| ", "6. Set up custom powershell profile ", "                       |  " -color Magenta, White, Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "CONTAINERS ", "                                                |  " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "| ", "7. Container Recipes ", "                                      |  " -color Magenta, White, Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "q to Quit ", "                                                 |  " -color Magenta, White, Magenta
    Write-Color "└────────────────────────────────────────────────────────────┘  " -color Magenta
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
    Write-Color "┌────────────────────────────────────────────────────────────┐  " -color Magenta
    Write-Color "| ", "WELCOME TO COMMANDANT", "                                      | " -color Magenta, Red, Magenta
    Write-Color "|────────────────────────────────────────────────────────────│" -color Magenta
    Write-Color "| ", "SYSTEM SETUP AND TWEAKS: ", "                                  | " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────│" -color Magenta
    Write-Color "|                                                            | " -color Magenta
    Write-Color "| ", "1. Install Containerization ", "                               | " -color Magenta, White, Magenta
    Write-Color "| ", "2. Install Homebrew ", "                                       | " -color Magenta, White, Magenta
    Write-Color "| ", "3. Install MacPorts ", "                                       | " -color Magenta, White, Magenta
    Write-Color "| ", "4. Install Apps (needs brew) ", "                              | " -color Magenta, White, Magenta
    Write-Color "| ", "5. Install Nix ", "                                            | " -color Magenta, White, Magenta
    Write-Color "|                                                            | " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────│ " -color Magenta
    Write-Color "| ", "CONTAINERS", "                                                 | " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────│ " -color Magenta
    Write-Color "|                                                            | " -color Magenta
    Write-Color "| ", "6. Container Recipes ", "                                      | " -color Magenta, White, Magenta
    Write-Color "|                                                            | " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────│ " -color Magenta
    Write-Color "| ", "q to Quit ", "                                                 | " -color Magenta
    Write-Color "└────────────────────────────────────────────────────────────┘  " -color Magenta
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
