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
    xcode_utils
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function ins_macports {
    # Install MacPorts
    xcode_utils
    echo -e ""
    echo -e ""
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${YELLOW}   Which version of MacOS do you have?                     ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${YELLOW}   1. Sequoia  (pick this one if you dont know)            ${RESET}"
    echo -e "${YELLOW}   2. Sonoma                                               ${RESET}"
    echo -e "${YELLOW}   3. Ventura                                              ${RESET}"
    echo -e "${YELLOW}   4. Monterey                                             ${RESET}"
    echo -e "${YELLOW}   5. Something else  (open website)                       ${RESET}"
    echo -e "${YELLOW}                                                           ${RESET}"
    echo -e "${YELLOW}                                                           ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${YELLOW}   b to go back                                            ${RESET}"
    echo -e "${YELLOW}   o to View Options                                       ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e ""
    echo -e ""
    echo -e "Pick a number to continue or press 'b' to go back or 'o' to view the options again: "
    read choice

    case $choice in
        1) curl -OL https://github.com/macports/macports-base/releases/download/v2.11.4/MacPorts-2.11.4-15-Sequoia.pkg
           chmod +x MacPorts-2.11.4-15-Sequoia.pkg
           open MacPorts-2.11.4-15-Sequoia.pkg
           ins_macports ;;
        2) curl -OL https://github.com/macports/macports-base/releases/download/v2.11.4/MacPorts-2.11.4-14-Sonoma.pkg
           chmod +x MacPorts-2.11.4-14-Sonoma.pkg
           open MacPorts-2.11.4-14-Sonoma.pkg
           ins_macports ;;
        3) curl -OL https://github.com/macports/macports-base/releases/download/v2.11.4/MacPorts-2.11.4-13-Ventura.pkg
           chmod +x MacPorts-2.11.4-13-Ventura.pkg
           open MacPorts-2.11.4-13-Ventura.pkg
           ins_macports ;;
        4) curl -OL https://github.com/macports/macports-base/releases/download/v2.11.4/MacPorts-2.11.4-12-Monterey.pkg
           chmod +x MacPorts-2.11.4-12-Monterey.pkg
           open MacPorts-2.11.4-12-Monterey.pkg
           ins_macports ;;
        5) open 'https://www.macports.org/install.php'
           ins_macports ;;
        b) show_tui ;;
        o) ins_macports ;;
        *) echo "please pick something from the list above"
    esac
}

function list_installed {
    brew list
    port installed
}

function ins_container {
    brew install --cask container
}

function setup_container {
    container system start
}

function setup_kali {
    setup_container
    container image pull kalilinux/kali-rolling:latest
    # container dir to share
    mkdir -p ~/containers/home/kali
    container create --name Kali --volume ~/containers/home/kali:/home/kali --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_rhel {
    setup_container
    container image pull redhat:ubi10
    # container dir to share
    mkdir -p ~/containers/home/rhel
    container create --name Kali --volume ~/containers/home/rhel:/home/rhel --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_centos {
    setup_container
    container image pull quay.io/centos/centos:stream10
    # container dir to share
    mkdir -p ~/containers/home/centos
    container create --name Kali --volume ~/containers/home/centos:/home/centos --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_leap {
    setup_container
    container image pull opensuse/leap:latest
    # container dir to share
    mkdir -p ~/containers/home/opensuse
    container create --name Kali --volume ~/containers/home/opensuse:/home/opensuse --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_fedora {
    setup_container
    container image pull fedora:latest
    # container dir to share
    mkdir -p ~/containers/home/fedora
    container create --name Kali --volume ~/containers/home/fedora:/home/fedora --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_ubuntu {
    setup_container
    container image pull ubuntu:latest
    # container dir to share
    mkdir -p ~/containers/home/ubuntu
    container create --name Kali --volume ~/containers/home/ubuntu:/home/ubuntu --volume /tmp/.X11-unix:/tmp/.X11-unix
}

function setup_blackarch {
    setup_container
    container image pull blackarch/blackarch:latest
    # container dir to share
    mkdir -p ~/containers/home/blackarch
    container create --name Kali --volume ~/containers/home/blackarch:/home/blackarch --volume /tmp/.X11-unix:/tmp/.X11-unix
}

### Put any code not related to the TUI above this
### App installer gui

function  show_tui_containers {
    echo -e ""
    echo -e ""
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${MAGENTA}   Pick your container recipe                              ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${MAGENTA}   1. Ubuntu                                              ${RESET}"
    echo -e "${MAGENTA}   2. Fedora                                               ${RESET}"
    echo -e "${MAGENTA}   3. CentOS                                              ${RESET}"
    echo -e "${MAGENTA}   4. Red Hat                                             ${RESET}"
    echo -e "${MAGENTA}   5. Kali                                                ${RESET}"
    echo -e "${MAGENTA}   6. Blackarch                                           ${RESET}"
    echo -e "${MAGENTA}   7. OpenSUSE                                            ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${MAGENTA}   b to go back                                            ${RESET}"
    echo -e "${MAGENTA}   o to View Options                                       ${RESET}"
    echo -e "${MAGENTA}   q to Quit                                               ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e ""
    echo -e ""
    echo -e "Pick a number to continue or press 'b' to go back or 'o' to view the options again: "
    read choice

    case $choice in
        1) setup_ubuntu
           show_tui_containers ;;
        2) setup_fedora
            show_tui_containers ;;
        3) setup_centos
            show_tui_containers ;;
        4) setup_rhel
            show_tui_containers ;;
        5) setup_kali
            show_tui_containers ;;
        6) setup_blackarch
            show_tui_containers ;;
        7) setup_leap
            show_tui_containers ;;
        b) show_tui;;
        o) show_tui_containers ;;
        q) exit ;;
    esac
}

function show_tui_apps {
    # Professional TUI for Commandant with rounded corners
    echo -e ""
    echo -e ""
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${RED}   Pick an app to install                                                   ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${RED}   1. Ghostty             2. iTerm2           3. Kitty                      ${RESET}"
    echo -e "${RED}   4. Alacritty           5. Tmux             6. Zellij                     ${RESET}"
    echo -e "${RED}   7. VSCode              8. Zed              9. Docker Destkop             ${RESET}"
    echo -e "${RED}   10. Podman Desktop     11. Crossover       12. UTM                       ${RESET}"
    echo -e "${RED}   13. Veracrypt          14. Orion           15. Google Chrome             ${RESET}"
    echo -e "${RED}   16. Brave Browser      17. Zen             18. Discord                   ${RESET}"
    echo -e "${RED}   19. Discord            20. xquartz         21. Wine                      ${RESET}"
    echo -e "${RED}   22. Wine               23. Intellidock     24. Grid (requires Licence)   ${RESET}"
    echo -e "${RED}   25. Jetbrains Toolbox  26. Bitwarden       27. Syncthing                 ${RESET}"
    echo -e "${RED}   28. Helix              29. Eza             30. Bat                       ${RESET}"
    echo -e "${RED}   31. Powershell         32. Mesa 3D         33. Vulkan Tools              ${RESET}"
    echo -e "${RED}                                                                            ${RESET}"
    echo -e "${RED}                                                                            ${RESET}"
    echo -e "${RED}                                                                            ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${RED}   f to install fomulaue not on this list                                   ${RESET}"
    echo -e "${RED}   c to install cask not on this list                                       ${RESET}"
    echo -e "${RED}   p to install port not on this list                                       ${RESET}"
    echo -e "${RED}   i to show apps already installed by homebrew and ports                   ${RESET}"
    echo -e "${RED}   b to go back                                                             ${RESET}"
    echo -e "${RED}   o to View Options                                                        ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
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
        20) brew install discord
           show_tui_apps ;;
        21) brew install xquartz
           show_tui_apps ;;
        22) brew install thunderbird
           show_tui_apps ;;
        23) brew install grid
           show_tui_apps ;;
        24) brew install jetbrains-toolbox
           show_tui_apps ;;
        25) brew install bitwarden
           show_tui_apps ;;
        26) brew install syncthing
           show_tui_apps ;;
        27) brew install helix
           show_tui_apps ;;
        28) brew install eza
           show_tui_apps ;;
        29) brew install bat
           show_tui_apps ;;
        30) brew install powershell
           show_tui_apps ;;
        31) brew install mesa
           show_tui_apps ;;
        32) brew install vulkan-tools
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
           sudo port install $port_name
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
     echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${BLUE}   Welcome to the Commandant                                  ${RESET}"
     echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${YELLOW}   System Setup and Tweaks:                                   ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${CYAN}   1  - Install Containerization  (needs brew installed)      ${RESET}"
    echo -e "${YELLOW}   2  - Install Homebrew                                     ${RESET}"
    echo -e "${MAGENTA}   3  - Install MacPorts                                     ${RESET}"
    echo -e "${WHITE}   4  - Install Apps    (needs brew or ports installed)       ${RESET}"
    echo -e "${GREEN}   i  - show installed apps                                   ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${CYAN}   Container Recipes                                          ${RESET}"
    echo -e "${MAGENTA}   5  - Setup Containers                                      ${RESET}"
    echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"
    echo -e "${YELLOW}  q to Quit                                                   ${RESET}"
    echo -e "${MAGENTA}  o to View Options                                           ${RESET}"
     echo -e "${MAGENTA}│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│${RESET}"

    echo -e ""
    echo -e ""
    echo -e "Pick a number to continue or press 'q' to quit or 'o' to view the options again: "
    read choice

    case $choice in
        1) ins_container
        show_tui ;;
        2) ins_brew
        show_tui ;;
        3) ins_macports ;;
        4) show_tui_apps ;;
        i) list_installed
        sleep 10
        show_tui ;;
        5) show_tui_containers ;;
        o) show_tui ;;
        q) exit ;;
        *) echo "Bad choice, please pick from the list above or press 'q' to quit" ;;
    esac
}

### show us the main menu
show_tui
