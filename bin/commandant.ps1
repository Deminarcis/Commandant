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
    Write-Host "   S. Enable sudo (sd to disable)                             " -foregroundcolor Green
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
            { install_wsl2
            }
            2
            { install_apps
            }
            3
            { install_custom_kernel
            }
            4
            { install_custom_prompt
            }
            5
            { install_scoop
            }
            6
            { contaners_windows
            }
            'o'
            { show_tui
            }
            'u'
            { update_installed
            }
            'g'
            { enable_god_mode
            }
            's'
            { enable_sudo
            }
            'sd'
            { disable_sudo
            }
            'h'
            { install_hyperv
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

function containers_windows
{
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   WSL Distro Installer               " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Pick your WSL Distro:                "
    Write-Host "   1. Ubuntu"
    Write-Host "   2. Fedora"
    Write-Host "   3. Kali Linux"
    Write-Host "   4. Arch Linux"
    Write-Host "   5. OpenSUSE Leap"
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               " -foregroundcolor Green
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    do
    {
        $choice = Read-Host "Enter your choice or press 'o' to reload the options"
        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            break
        }
        switch ($choice)
        {
            '1'
            { ubuntu_wsl; containers_windows
            }
            '2'
            { fedora_wsl; containers_windows
            }
            '3'
            { kali_linux_wsl; containers_windows
            }
            '4'
            { arch_linux_wsl; containers_windows
            }
            '5'
            { opensuse_leap_wsl; containers_windows
            }
            'b'
            { show_tui
            }
            'o'
            { containers_windows
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
    Write-Host "   2. Install Distroshelf                                    " -foregroundcolor Cyan
    Write-Host "   3. Install Homebrew                                       " -foregroundcolor Cyan
    Write-Host "   4. Install Nix package manager                            " -foregroundcolor Cyan
    Write-Host "   5. Set up custom zsh profile                              " -foregroundcolor Green
    Write-Host "   6. Set up custom powershell profile                              " -foregroundcolor Green
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Container Recipes                               " -foregroundcolor Green
    Write-Host "   5. Setup containers                             " -foregroundcolor Green
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
            { ins_flathub
            }
            2
            { ins_distroshelf
            }
            3
            { ins_brew_linux
            }
            4
            { ins_nix
            }
            5
            { cp -rvf ../Scripts/zshrc ~/.zshrc; Write-Output "[+] Done!"
            }
            6
            { mkdir -p ~/.config/powershell; cp -rvf ../Scripts/Microsoft.PowerShell_profile.ps1 ~/.config/powershell; Write-Output "[+] Done!"
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
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Container Recipes                               " -foregroundcolor Green
    Write-Host "   5. Setup containers                             " -foregroundcolor Green
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
            { ins_container
            }
            2
            { ins_brew
            }
            3
            { ins_macports
            }
            4
            { show_tui_apps_mac
            }
            5
            { show_tui_containers_mac
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

function show_tui_apps_mac
{
    Write-Host ""
    Write-Host ""
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Pick an app to install                                                   " -foregroundcolor Red
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   1. Ghostty             2. iTerm2           3. Kitty                      " -foregroundcolor Red
    Write-Host "   4. Alacritty           5. Zellij           6. VSCode                     " -foregroundcolor Red
    Write-Host "   7. Zed                 8. Podman Desktop   9. Crossover                 "  -foregroundcolor Red
    Write-Host "   10. UTM                11. Handbrake       12. Mole                     " -foregroundcolor Red
    Write-Host "   13. Veracrypt          14. Orion           15. Google Chrome             " -foregroundcolor Red
    Write-Host "   16. Helium             17. Zen             18. Discord                   " -foregroundcolor Red
    Write-Host "   19. Thunderbird        20. xquartz         21. Superfile                 " -foregroundcolor Red
    Write-Host "   22. Ghidra             23. Intellidock     24. Grid (requires Licence)   " -foregroundcolor Red
    Write-Host "   25. Jetbrains Toolbox  26. Bitwarden       27. LMStudio                  " -foregroundcolor Red
    Write-Host "   28. Helix              29. lsd             30. Bat                       " -foregroundcolor Red
    Write-Host "   31. Powershell         32. Mesa 3D         33. Vulkan Tools              " -foregroundcolor Red
    Write-Host "                                                                            " -foregroundcolor Red
    Write-Host "                                                                            " -foregroundcolor Red
    Write-Host "                                                                            " -foregroundcolor Red
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   f to install fomulaue not on this list                                   " -foregroundcolor Red
    Write-Host "   c to install cask not on this list                                       " -foregroundcolor Red
    Write-Host "   p to install port not on this list                                       " -foregroundcolor Red
    Write-Host "   b to go back                                                             " -foregroundcolor Red
    Write-Host "   o to View Options                                                        " -foregroundcolor Red
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()
    $cask_choices = Read-Host "Enter the name of the brew cask you want to install"
    $port_choices = Read-Host "Enter the name of the port you want to install"
    $brew_choices = Read-Host "Enter the name of the brew formula you want to install"

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
            { brew install ghostty; show_tui_apps_mac
            }
            2
            { brew install iterm2; show_tui_apps_mac
            }
            3
            { brew install kitty; show_tui_apps_mac
            }
            4
            { brew install alacritty; show_tui_apps_mac
            }
            5
            { brew install zellij; show_tui_apps_mac
            }
            6
            { brew install visual-studio-code; show_tui_apps_mac
            }
            7
            { brew install zed; show_tui_apps_mac
            }
            8
            { brew install podman-desktop; show_tui_apps_mac
            }
            9
            { brew install crossover; show_tui_apps_mac
            }
            10
            { brew install utm; show_tui_apps_mac
            }
            11
            { brew install handbrake; show_tui_apps_mac
            }
            12
            { brew install mole; show_tui_apps_mac
            }
            13
            { brew install veracrypt; show_tui_apps_mac
            }
            14
            { brew install orion; show_tui_apps_mac
            }
            15
            { brew install google-chrome; show_tui_apps_mac
            }
            16
            { brew install --cask helium-browser; show_tui_apps_mac
            }
            17
            { brew install zen; show_tui_apps_mac
            }
            18
            { brew install discord; show_tui_apps_mac
            }
            19
            { brew install thunderbird; show_tui_apps_mac
            }
            20
            { brew install xquartz; show_tui_apps_mac
            }
            21
            { brew install superfile; show_tui_apps_mac
            }
            22
            { brew install ghidra; show_tui_apps_mac
            }
            23
            { brew install intellidock; show_tui_apps_mac
            }
            24
            { brew install grid; show_tui_apps_mac
            }
            25
            { brew install jetbrains-toolbox; show_tui_apps_mac
            }
            26
            { brew install bitwarden; show_tui_apps_mac
            }
            27
            { brew install --cask lm-studio; show_tui_apps_mac
            }
            28
            { brew install helix; show_tui_apps_mac
            }
            29
            { brew install lsd; show_tui_apps_mac
            }
            30
            { brew install bat; show_tui_apps_mac
            }
            31
            { brew install powershell; show_tui_apps_mac
            }
            32
            { brew install mesa; show_tui_apps_mac
            }
            33
            { brew install vulkan-tools; show_tui_apps_mac
            }
            'c'
            { cask_choices
            }
            'p'
            { port_choices
            }
            'b'
            { show_mac_tui
            }
            'f'
            { brew_choices
            }
            'o'
            { show_tui_apps_mac
            }
            default
            { Write-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"
                continue
            }
        }
    } while ($true)

}

function  show_tui_containers
{
    Write-Host ""
    Write-Host ""
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Pick your container recipe                              "  -foregroundcolor Magenta
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   1. Ubuntu                                              " -foregroundcolor Magenta
    Write-Host "   2. Fedora                                               " -foregroundcolor Magenta
    Write-Host "   3. CentOS                                              " -foregroundcolor Magenta
    Write-Host "   4. Red Hat                                             " -foregroundcolor Magenta
    Write-Host "   5. Kali                                                " -foregroundcolor Magenta
    Write-Host "   6. Blackarch                                           " -foregroundcolor Magenta
    Write-Host "   7. OpenSUSE                                            " -foregroundcolor Magenta
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   b to go back                                            " -foregroundcolor Magenta
    Write-Host "   o to View Options                                       " -foregroundcolor Magenta
    Write-Host "   q to Quit                                               " -foregroundcolor Magenta
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    do
    {
        Write-Host
        $choice = Read-Host "Enter your choice from the list above: "

        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            break
        }

        switch ($choice)
        {
            1
            { setup_ubuntu
            }
            2
            { setup_fedora
            }
            3
            { setup_centos
            }
            4
            { setup_rhel
            }
            5
            { setup_kali
            }
            6
            { setup_blackarch
            }
            7
            { setup_leap
            }
            'b'
            { show_mac_tui
            }
            'o'
            { show_tui_containers
            }
            default
            {
                Write-Host "Invalid choice. Please select from the list above."
                continue
            }
        }
    } while ($true)
}

function ins_macports
{
    # Install MacPorts
    xcode_utils
    Write-Host ""
    Write-Host ""
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Which version of MacOS do you have?                     "
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   1. Tahoe                                                " -foregroundcolor Yellow
    Write-Host "   2. Sequoia                                              " -foregroundcolor Yellow
    Write-Host "   3. Sonoma                                               " -foregroundcolor Yellow
    Write-Host "   4. Ventura                                              " -foregroundcolor Yellow
    Write-Host "   5. Monterey                                             " -foregroundcolor Yellow
    Write-Host "   6. Something else  (open website)                       " -foregroundcolor Yellow
    Write-Host "                                                           " -foregroundcolor Yellow
    Write-Host "                                                           " -foregroundcolor Yellow
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   b to go back                                            " -foregroundcolor Yellow
    Write-Host "   o to View Options                                       " -foregroundcolor Yellow
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    do
    {
        Write-Host
        $choice =  Read-Host "Which version of MacOS do you have?"

        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            break
        }

        switch ($choice)
        {
            '1'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-26-Tahoe.pkg"; chmod +x MacPorts-2.12.5-26-Tahoe.pkg; open MacPorts-2.12.5-26-Tahoe.pkg; ins_macports
            }
            '2'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-15-Sequoia.pkg"; chmod +x MacPorts-2.12.5-15-Sequoia.pkg; open MacPorts-2.12.5-15-Sequoia.pkg; ins_macports
            }
            '3'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-14-Sonoma.pkg"; chmod +x MacPorts-2.12.5-14-Sonoma.pkg; open MacPorts-2.12.5-14-Sonoma.pkg; ins_macports
            }
            '4'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-13-Ventura.pkg"; chmod +x MacPorts-2.12.5-13-Ventura.pkg; open MacPorts-2.12.5-13-Ventura.pkg; ins_macports
            }
            '5'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-12-Monterey.pkg"; chmod +x MacPorts-2.12.5-12-Monterey.pkg; open MacPorts-2.12.5-12-Monterey.pkg; ins_macports
            }
            '6'
            { open 'https://www.macports.org/install.php'; ins_macports
            }
            'b'
            { show_mac_tui
            }
            'o'
            { ins_macports
            }
            default
            {
                Write-Host "Invalid choice. Please select from the list above."
                continue
            }
        }
    } while ($true)
}

function setup_kali
{
    setup_container
    container image pull kalilinux/kali-rolling:latest
    # container dir to share
    mkdir -p ~/containers/home/kali
    container create --name Kali --volume ~/containers/home/kali:/home/kali --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_rhel
{
    setup_container
    container image pull redhat:ubi10
    # container dir to share
    mkdir -p ~/containers/home/rhel
    container create --name Kali --volume ~/containers/home/rhel:/home/rhel --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_centos
{
    setup_container
    container image pull quay.io/centos/centos:stream10
    # container dir to share
    mkdir -p ~/containers/home/centos
    container create --name Kali --volume ~/containers/home/centos:/home/centos --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_leap
{
    setup_container
    container image pull opensuse/leap:latest
    # container dir to share
    mkdir -p ~/containers/home/opensuse
    container create --name Kali --volume ~/containers/home/opensuse:/home/opensuse --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_fedora
{
    setup_container
    container image pull fedora:latest
    # container dir to share
    mkdir -p ~/containers/home/fedora
    container create --name Kali --volume ~/containers/home/fedora:/home/fedora --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_ubuntu
{
    setup_container
    container image pull ubuntu:latest
    # container dir to share
    mkdir -p ~/containers/home/ubuntu
    container create --name Kali --volume ~/containers/home/ubuntu:/home/ubuntu --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_blackarch
{
    setup_container
    container image pull blackarch/blackarch:latest
    # container dir to share
    mkdir -p ~/containers/home/blackarch
    container create --name Kali --volume ~/containers/home/blackarch:/home/blackarch --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function ins_container
{
    brew install --cask container
}

function setup_container
{
    container system start
}
function xcode_utils
{
    # Install Xcode Command Line Tools
    xcode-select --install
}

function ins_brew
{
    # Install Homebrew
    xcode_utils
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function ins_brew_linux
{
    # Install Homebrew on Linux
    Write-Output "[!!] Please do this outside powershell by running \n /bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
}

function install_wsl2
{
    Clear-Host
    Write-Host "[+] Installing WSL2..."
    function wsl_branch
    {
        $options = @(
            "Stable"
            "Pre Release"
        )
        $choice = Read-Host "Which Branch of WSL should be installed? ($($options -join ', '))"
        if ($choice -eq "Stable")
        {
            Write-Output "[+]  Installing WSL2 Stable Branch"
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
            Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
            wsl --install --no-distribution
        } elseif ($choice -eq "Pre Release")
        {
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

function install_apps
{
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "  Welcome to the Commandant               " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "  Pick an app to install:                 " -foregroundcolor Red
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "  1. Powershell      2. VSCode      3. Powertoys " -foregroundcolor Red
    Write-Host "  4. Zen Browser     5. Google Chrome   6. Firefox Browser " -foregroundcolor Red
    Write-Host "  7. Mozilla Thunderbird   8. bat       9. Nano      " -foregroundcolor Red
    Write-Host "  10. MS Edit       11. lsd      12. Helix  " -foregroundcolor Red
    Write-Host "  13. sysinternals  14. 7zip     15. Bitwarden  " -foregroundcolor Red
    Write-Host "  16. Haruna        17. WinFsp     18. Zed  " -foregroundcolor Red
    Write-Host "  19. Bleachbit     20. Discord     21. Obsidian " -foregroundcolor Red
    Write-Host "  22 Mesa 3D       23. YT-Dlp     24. ffmpeg " -foregroundcolor Red
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   s to search for package                 " -foregroundcolor Red
    Write-Host "   i to install unlisted app               " -foregroundcolor Red
    Write-Host "   u to update installed apps              " -foregroundcolor Red
    Write-Host "   b to Go Back                            " -foregroundcolor Red
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()

    do
    {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit ot 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            exit
        }

        switch ($choice)
        {
            1
            { scoop install pwsh && install_apps
            }
            2
            { scoop install vscode && install_apps
            }
            3
            { scoop install extras/powertoys && install_apps
            }
            4
            { scoop install extras/zen-browser && install_apps
            }
            5
            { scoop install extras/googlechrome && install_apps
            }
            6
            { scoop install extras/firefox && install_apps
            }
            7
            { scoop install extras/thunderbird && install_apps
            }
            8
            { scoop install bat && install_apps
            }
            9
            { scoop install nano && install_apps
            }
            10
            { scoop install edit && install_apps
            }
            11
            { scoop install lsd && install_apps
            }
            12
            { scoop install helix && install_apps
            }
            13
            { scoop install extras/sysinternals && install_apps
            }
            14
            { scoop install 7zip && install_apps
            }
            15
            { scoop install extras/bitwarden && install_apps
            }
            16
            { winget install --id=KDE.Haruna -e && install_apps
            }
            17
            { scoop install nonportable/winfsp-np && install_apps
            }
            18
            { scoop install extras/zed && install_apps
            }
            19
            { scoop install extras/bleachbit && install_apps
            }
            20
            { scoop install extras/discord && install_apps
            }
            21
            { scoop install extras/obsidian && install_apps
            }
            22
            { scoop install games/mesa3d && install_apps
            }
            23
            { scoop install yt-dlp ffmpeg
            }
            24
            { scoop install ffmpeg
            }
            'o'
            { install_apps
            }
            'i'
            { $unlisted_app = Read-Host "Enter the name of the app to install"; scoop install $unlisted_app
            }
            's'
            { $search_app = Read-Host "Enter the name of the package you are looking for: "; scoop search $search_app
            }
            'u'
            { update_installed
            }
            'b'
            { show_tui
            }
            default
            { Write-Host "Pick a number to continue or press 'b' to go back or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}

function update_installed
{
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

function enable_sudo
{
    Clear-Host
    Write-Host "[+] Enabling sudo..."
    Start-Process PowerShell -Argument "..\Scripts\sudo-on.ps1" -Verb RunAs
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function disable_sudo
{
    Clear-Host
    Write-Host "[+] Disabling sudo..."
    Start-Process PowerShell -Argument "..\Scripts\sudo-off.ps1" -Verb RunAs
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function install_hyperv
{
    Clear-Host
    Write-Host "[+] Installing Hyper-V..."
    Start-Process PowerShell -Argument "cmd.exe /c ..\Scripts\hyperv-on.bat" -Verb RunAs
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function install_custom_kernel
{
    Clear-Host
    Write-Host "[+] Installing custom kernel for WSL 2..."
    Write-Output "[+] Installing custom kernel for WSL"
    Copy-Item '..\WSL Kernel\bzImage' $env:USERPROFILE
    Write-Output "[wsl2]`nkernel=$env:USERPROFILE\bzImage" | ForEach-Object {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII -Append
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function install_custom_prompt
{
    Clear-Host
    Write-Host "[+] Installing custom powershell prompt..."
    New-Item "$env:USERPROFILE\Documents\PowerShell\" -Type Directory -Force
    Copy-Item '..\Scripts\Microsoft.PowerShell_profile.ps1' "$env:USERPROFILE\Documents\PowerShell\"
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function fedora_wsl
{
    wsl --install FedoraLinux-44
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function ubuntu_wsl
{
    wsl --install Ubuntu
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function arch_wsl
{
    wsl --install archlinux
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function kali_wsl
{
    wsl --install kali-linux
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function suse_leap_wsl
{
    wsl --install openSUSE-Leap-15.6
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}


function install_scoop
{
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
    Write-Output "[+] Done!"
    Start-Sleep 10
    Clear-Host
    show_tui
}

function enable_god_mode
{
    Clear-Host
    Write-Host "[+] Enabling God Mode..."
    New-Item "$env:USERPROFILE\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" -Type Directory -Force
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}

function abort
{
    Write-Host "[+] Exiting... Buh-bye!"
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
