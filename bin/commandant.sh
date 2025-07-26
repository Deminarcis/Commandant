#!/usr/bin/env zsh
if [ $EUID -eq "0" ]; then
    echo "Please do not run this script as root"
    exit 1
fi

function ins_brew {
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

}

function ins_macports {
    # Install MacPorts
    curl -fsSL https://raw.githubusercontent.com/macports/macports-base/master/configure | sh
}

function list_installed {
    brew list
    port installed
}

function ins_container {
    brew install --cask container
}

### Put any code not related to the TUI above this

### App installer gui
function show_tui_apps {
    # Professional TUI for Commandant with rounded corners
    echo -e ""
    echo -e ""
    echo -e "╭────────────────────────────────────────────────────────────────────────────╮"
    echo -e "|   Welcome to the Commandant                                                |"
    echo -e "|   Pick an app to install                                                   |"
    echo -e "|   1. Ghostty             2. iTerm2           3. Kitty                      |"
    echo -e "|   4. Alacritty           5. Tmux             6. Zellij                     |"
    echo -e "|   7. VSCode              8. Cursor           9. Zed                        |"
    echo -e "|   10. Docker Destkop     11. Podman Desktop  12. Crossover                 |"
    echo -e "|   13. UTM                14. VirtualBox      15. Veracrypt                 |"
    echo -e "|   16. Orion              17. Google Chrome   18. Brave Browser             |"
    echo -e "|   19. Zen                20. Firefox         21. Discord                   |"
    echo -e "|   22. Thunderbird        23. Slack           24. Teams                     |"
    echo -e "|   25. Zoom               26. Intellidock     27. Grid (requires Licence)   |"
    echo -e "|   28. Jetbrains Toolbox  29. Bitwarden       30. Syncthing                 |"
    echo -e "|   31. Helix              32. Eza             33. Bat                       |"
    echo -e "|   34. Powershell                                                           |"
    echo -e "|                                                                            |"
    echo -e "|   f to install fomulaue not on this list                                   |"
    echo -e "|   c to install cask not on this list                                       |"
    echo -e "|   p to install port not on this list                                       |"
    echo -e "|   i to show apps already installed by homebrew                             |"
    echo -e "|   b to go back                                                             |"
    echo -e "|   o to View Options                                                        |"
    echo -e "╰────────────────────────────────────────────────────────────────────────────╯"
    echo -e ""
    echo -e ""

    echo -e "Pick a number to continue or press 'q' to quit or 'o' to view the options again: "
    read choice

    case $choice in
        1) brew install ghostty
           show_tui_apps ;;
        2) brew install iterm2
           show_tui_apps ;;
        3) brew install kitty
           show_tui_apps ;;
        4) brew install alacritty
           show_tui_apps ;;
        5) brew install tmux
           show_tui_apps ;;
        6) brew install zellij
           show_tui_apps ;;
        7) brew install visual-studio-code
           show_tui_apps ;;
        8) brew install cursor
           show_tui_apps ;;
        9) brew install zed
           show_tui_apps ;;
        10) brew install docker-desktop
           show_tui_apps ;;
        11) brew install podman-desktop
           show_tui_apps ;;
        12) brew install crossover
           show_tui_apps ;;
        13) brew install utm
           show_tui_apps ;;
        14) brew install virtualbox
           show_tui_apps ;;
        15) brew install veracrypt
           show_tui_apps ;;
        16) brew install orion
           show_tui_apps ;;
        17) brew install google-chrome
           show_tui_apps ;;
        18) brew install brave-browser
           show_tui_apps ;;
        19) brew install zen
           show_tui_apps ;;
        20) brew install firefox
           show_tui_apps ;;
        21) brew install discord
           show_tui_apps ;;
        22) brew install thunderbird
           show_tui_apps ;;
        23) brew install slack
           show_tui_apps ;;
        24) brew install microsoft-teams
           show_tui_apps ;;
        25) brew install zoom
           show_tui_apps ;;
        26) brew install intellidock
           show_tui_apps ;;
        27) brew install grid
           show_tui_apps ;;
        28) brew install jetbrains-toolbox
           show_tui_apps ;;
        29) brew install bitwarden
           show_tui_apps ;;
        30) brew install syncthing
           show_tui_apps ;;
        31) brew install helix
           show_tui_apps ;;
        32) brew install eza
           show_tui_apps ;;
        33) brew install bat
           show_tui_apps ;;
        34) brew install powershell
           show_tui_apps ;;
        f) echo "Enter the name of the package you want to install"
           read package_name
           brew install $package_name
           show_tui_apps;;
        c) echo "Enter the name of the cask you want to install"
           read cask_name
           brew install --cask $cask_name
           show_tui_apps;;
        p) echo "Enter the name of the port you want to install"
           read port_name
           port install $port_name
           show_tui_apps;;
        i) list_installed
           sleep 10
           show_tui_apps ;;
        b) show_tui ;;
        o) show_tui_apps ;;
        q) exit ;;
        *) echo "Bad choice, please pick from the list above or press 'b' to go back or 'q' to quit" ;;
    esac
}

### Main menu
function show_tui {
    # Professional TUI for Commandant with rounded corners
    echo -e ""
    echo -e ""
    echo -e "╭──────────────────────────────────────────────────────────────╮"
    echo -e "|   Welcome to the Commandant                                  |"
    echo -e "|   System Setup and Tweaks:                                   |"
    echo -e "|   1. Install Containerization  (needs brew installed)        |"
    echo -e "|   2. Install Homebrew                                        |"
    echo -e "|   3. Install MacPorts                                        |"
    echo -e "|   4. Install Apps    (needs brew or ports installed)         |"
    echo -e "|   i - show installed apps                                    |"
    echo -e "|--------------------------------------------------------------|"
    echo -e "|   Container Templates (WIP)                                  |"
    echo -e "|   6.  Fedora                                                 |"
    echo -e "|   7.  Ubuntu                                                 |"
    echo -e "|   8.  Kali                                                   |"
    echo -e "|   9.  OpenSuse Leap                                          |"
    echo -e "|   10. Arch!                                                  |"
    echo -e "|--------------------------------------------------------------|"
    echo -e "|   q to Quit                                                  |"
    echo -e "|   o to View Options                                          |"
    echo -e "╰──────────────────────────────────────────────────────────────╯"
    echo -e ""
    echo -e ""

    echo -e "Pick a number to continue or press 'q' to quit or 'o' to view the options again: "
    read choice

    case $choice in
        1) ins_container
        show_tui ;;
        2) ins_brew
        show_tui ;;
        3) ins_macports
        show_tui ;;
        4) show_tui_apps ;;
        i) list_installed
        sleep 10
        show_tui ;;
        o) show_tui ;;
        q) exit ;;
        *) echo "Bad choice, please pick from the list above or press 'q' to quit" ;;
    esac
}

### show us the main menu
show_tui
