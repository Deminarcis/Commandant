function install_apps_mac {
    Write-Host ""
    Write-Host ""
    Write-Color "┌────────────────────────────────────────────────────────────┐  " -color Magenta
    Write-Color "| ", "APP INSTALLER", "                                              |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "1. Ghostty             2. iTerm2           3. Kitty ", "       |  " -color Magenta, White, Magenta
    Write-Color "| ", "4. Alacritty           5. Zellij           6. VSCode ", "      |  " -color Magenta, White, Magenta
    Write-Color "| ", "7. Zed                 8. Podman Desktop   9. Crossover ", "   |  " -color Magenta, White, Magenta
    Write-Color "| ", "10. UTM                11. Handbrake       12. Mole ", "       |  " -color Magenta, White, Magenta
    Write-Color "| ", "13. Veracrypt          14. Orion           15. Google Chrome ",|  " -color Magenta, White, Magenta
    Write-Color "| ", "16. Helium             17. Zen             18. Discord ", "    |  " -color Magenta, White, Magenta
    Write-Color "| ", "19. Thunderbird        20. xquartz         21. Superfile ", "  |  " -color Magenta, White, Magenta
    Write-Color "| ", "22. Ghidra             23. Intellidock     24. Grid (requires Licence) ", "  |  " -color Magenta, White, Magenta
    Write-Color "| ", "25. Jetbrains Toolbox  26. Bitwarden       27. LMStudio ", "  |  " -color Magenta, White, Magenta
    Write-Color "| ", "28. Helix              29. lsd             30. Bat ", "  |  " -color Magenta, White, Magenta
    Write-Color "| ", "31. Powershell         32. Mesa 3D         33. Vulkan Tools ", "  |  " -color Magenta, White, Magenta
    Write-Color "|                                                                    |  " -color Magenta
    Write-Color "|                                                                    |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "|   f to install fomulaue not on this list                           |  " -color Magenta
    Write-Color "|   c to install cask not on this list                               |  " -color Magenta
    Write-Color "|   p to install port not on this list                               |  " -color Magenta
    Write-Color "|   b to go back                                                     |  " -color Magenta
    Write-Color "| ", "o to View Options", "                                          |  " -color Magenta
    Write-Color "└────────────────────────────────────────────────────────────┘  " -color Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()
    $cask_choices = Read-Host "Enter the name of the brew cask you want to install"
    $port_choices = Read-Host "Enter the name of the port you want to install"
    $brew_choices = Read-Host "Enter the name of the brew formula you want to install"

    do {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit') {
            exit
        }

        switch ($choice) {
            1 {
                brew install ghostty; show_tui_apps_mac
            }
            2 {
                brew install iterm2; show_tui_apps_mac
            }
            3 {
                brew install kitty; show_tui_apps_mac
            }
            4 {
                brew install alacritty; show_tui_apps_mac
            }
            5 {
                brew install zellij; show_tui_apps_mac
            }
            6 {
                brew install visual-studio-code; show_tui_apps_mac
            }
            7 {
                brew install zed; show_tui_apps_mac
            }
            8 {
                brew install podman-desktop; show_tui_apps_mac
            }
            9 {
                brew install crossover; show_tui_apps_mac
            }
            10 {
                brew install utm; show_tui_apps_mac
            }
            11 {
                brew install handbrake; show_tui_apps_mac
            }
            12 {
                brew install mole; show_tui_apps_mac
            }
            13 {
                brew install veracrypt; show_tui_apps_mac
            }
            14 {
                brew install orion; show_tui_apps_mac
            }
            15 {
                brew install google-chrome; show_tui_apps_mac
            }
            16 {
                brew install --cask helium-browser; show_tui_apps_mac
            }
            17 {
                brew install zen; show_tui_apps_mac
            }
            18 {
                brew install discord; show_tui_apps_mac
            }
            19 {
                brew install thunderbird; show_tui_apps_mac
            }
            20 {
                brew install xquartz; show_tui_apps_mac
            }
            21 {
                brew install superfile; show_tui_apps_mac
            }
            22 {
                brew install ghidra; show_tui_apps_mac
            }
            23 {
                brew install intellidock; show_tui_apps_mac
            }
            24 {
                brew install grid; show_tui_apps_mac
            }
            25 {
                brew install jetbrains-toolbox; show_tui_apps_mac
            }
            26 {
                brew install bitwarden; show_tui_apps_mac
            }
            27 {
                brew install --cask lm-studio; show_tui_apps_mac
            }
            28 {
                brew install helix; show_tui_apps_mac
            }
            29 {
                brew install lsd; show_tui_apps_mac
            }
            30 {
                brew install bat; show_tui_apps_mac
            }
            31 {
                brew install powershell; show_tui_apps_mac
            }
            32 {
                brew install mesa; show_tui_apps_mac
            }
            33 {
                brew install vulkan-tools; show_tui_apps_mac
            }
            'c' {
                cask_choices
            }
            'p' {
                port_choices
            }
            'b' {
                show_mac_tui
            }
            'f' {
                brew_choices
            }
            'o' {
                show_tui_apps_mac
            }
            default {
                Write-Host "Pick a number to continue or press 'q' to quit or 'o' to view the options again"
                continue
            }
        }
    } while ($true)

}
install_apps_mac
