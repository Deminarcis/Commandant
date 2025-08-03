#!/usr/bin/env zsh
if [ $EUID -eq "0" ]; then
    echo "Please do not run this script as root"
    exit 1
fi

#colour codes for the UI
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`
BOLD=`tput bold`
RESET=`tput sgr0`

function xcode_utils() {
    # Install Xcode Command Line Tools
    xcode-select --install
}

function ins_brew {
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

}

function ins_macports {
    # Install MacPorts
    xcode_utils
    curl -O https://github.com/macports/macports-base/releases/download/v2.11.4/MacPorts-2.11.4-15-Sequoia.pkg
    ./MacPorts-2.11.4-15-Sequoia.pkg
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
    echo -e "${RED}╭────────────────────────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${RED}│${RESET}   Pick an app to install                                                   ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   1. Ghostty             2. iTerm2           3. Kitty                      ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   4. Alacritty           5. Tmux             6. Zellij                     ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   7. VSCode              8. Cursor           9. Zed                        ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   10. Docker Destkop     11. Podman Desktop  12. Crossover                 ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   13. UTM                14. VirtualBox      15. Veracrypt                 ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   16. Orion              17. Google Chrome   18. Brave Browser             ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   19. Zen                20. Firefox         21. Discord                   ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   22. Thunderbird        23. Slack           24. Teams                     ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   25. Zoom               26. Intellidock     27. Grid (requires Licence)   ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   28. Jetbrains Toolbox  29. Bitwarden       30. Syncthing                 ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   31. Helix              32. Eza             33. Bat                       ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   34. Powershell                                                           ${RED}│${RESET}"
    echo -e "${RED}│${RESET}                                                                            ${RED}│${RESET}"
    echo -e "${RED}│${RESET}                                                                            ${RED}│${RESET}"
    echo -e "${RED}│${RESET}                                                                            ${RED}│${RESET}"
    echo -e "${RED}│${MAGENTA}╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍${RED}│${RESET}"
    echo -e "${RED}│${RESET}   f to install fomulaue not on this list                                   ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   c to install cask not on this list                                       ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   p to install port not on this list                                       ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   i to show apps already installed by homebrew and ports                   ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   b to go back                                                             ${RED}│${RESET}"
    echo -e "${RED}│${RESET}   o to View Options                                                        ${RED}│${RESET}"
    echo -e "${RED}╰────────────────────────────────────────────────────────────────────────────╯${RESET}"
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
    echo -e "${RED}╭──────────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${BLUE}│${RESET}   Welcome to the Commandant                                  ${BLUE}│${RESET}"
    echo -e "${YELLOW}│${RESET}   System Setup and Tweaks:                                   ${YELLOW}│${RESET}"
    echo -e "${CYAN}│${RESET}   1  - Install Containerization  (needs brew installed)      ${CYAN}│${RESET}"
    echo -e "${ORANGE}│${RESET}   2  - Install Homebrew                                      ${ORANGE}│${RESET}"
    echo -e "${MAGENTA}│${RESET}   3  - Install MacPorts                                      ${MAGENTA}│${RESET}"
    echo -e "${WHITE}│   4  - Install Apps    (needs brew or ports installed)       │${RESET}"
    echo -e "${GREEN}│${RESET}   i  - show installed apps                                   ${GREEN}│${RESET}"
    echo -e "${RED}│${MAGENTA}╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍${RESET}│${RESET}"
    echo -e "${CYAN}│${RESET}   Container Templates (WIP)                                  ${CYAN}│${RESET}"
    echo -e "${MAGENTA}│${RESET}   5  - Fedora                                                ${MAGENTA}│${RESET}"
    echo -e "${ORANGE}│${RESET}   6  - Ubuntu                                                ${ORANGE}│${RESET}"
    echo -e "${GREEN}│${RESET}   7  - Kali                                                  ${GREEN}│${RESET}"
    echo -e "${MAGENTA}│${RESET}   8  - Arch!                                                 ${MAGENTA}│${RESET}"
    echo -e "${YELLOW}│${RESET}   9  - CentOS                                                ${YELLOW}│${RESET}"
    echo -e "${ORANGE}│${RESET}   10 - Blackarch                                             ${ORANGE}│${RESET}"
    echo -e "${RED}│${MAGENTA}╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍${RED}│${RESET}"
    echo -e "${ORANGE}│${RESET}  q to Quit                                                   ${ORANGE}│${RESET}"
    echo -e "${MAGENTA}│${RESET}  o to View Options                                           ${MAGENTA}│${RESET}"
    echo -e "${RED}╰──────────────────────────────────────────────────────────────╯${RESET}"
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
        5) show_tui ;;
        6) show_tui ;;
        7) show_tui ;;
        8) show_tui ;;
        9) show_tui ;;
        10) show_tui ;;
        o) show_tui ;;
        q) exit ;;
        *) echo "Bad choice, please pick from the list above or press 'q' to quit" ;;
    esac
}

### show us the main menu
show_tui
