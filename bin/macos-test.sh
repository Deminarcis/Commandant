#!/usr/bin/env zsh
ignoreDeps = 0
if [[ $ignoreDeps == 0 ]]; then
    which brew
    if [[ $? != 0 ]]; then
        # Install Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew update
    fi
else
    echo "[!!] Skipping dependency checks and installation."
fi

function list_installed {
    brew list
}

function ins_container {
    brew install --cask container
}


# Keep this out of any functions so any part of our code can use it
# Define a nested array for apps and their installation commands
typeset -A apps=(
    "iTerm2"     "brew install iterm2"
    "Btop"        "brew install btop"
    "Zed"         "brew install zed"
    "Obsidian"    "brew install obsidian"
    "Superfile"   "brew install superfile"
    "Eza"         "brew install eza"
    "UTM"         "brew install utm"
    "Zellij"      "brew install zellij"
    "Helix"       "brew install helix"
    "Orion"       "brew install orion"
    "Kitty"       "brew install kitty"
)
function app_install{
    # Function that works with separate display and command arrays
    select_and_execute() {
        local app_names=("$@")  # Array of items to display (passed as arguments)
        local command_items=()   # Remaining arguments are the commands

        # Get commands in the same order as app names
        for name in "${app_names[@]}"; do
            command_items+=("${apps[$name]}")
        done

        while true; do
            select_from_list "${app_names[@]}"

            case $? in
                0) selected_item=${app_names[0]} selected_command=${command_items[0]} ;;
                1) selected_item=${app_names[1]} selected_command=${command_items[1]} ;;
                2) selected_item=${app_names[2]} selected_command=${command_items[2]} ;;
                3) selected_item=${app_names[3]} selected_command=${command_items[3]} ;;
                4) selected_item=${app_names[4]} selected_command=${command_items[4]} ;;
                5) selected_item=${app_names[5]} selected_command=${command_items[5]} ;;
                6) selected_item=${app_names[6]} selected_command=${command_items[6]} ;;
                7) selected_item=${app_names[7]} selected_command=${command_items[7]} ;;
                8) selected_item=${app_names[8]} selected_command=${command_items[8]} ;;
                9) selected_item=${app_names[9]} selected_command=${command_items[9]} ;;
                10) selected_item=${app_names[10]} selected_command=${command_items[10]} ;;
                11) selected_item=${app_names[11]} selected_command=${command_items[11]} ;;
            esac

            echo "Executing: $selected_item..."
            eval "$selected_command"

            if [[ $? -eq 0 ]]; then
                echo "$selected_item executed successfully!"
            else
                echo "Failed to execute $selected_item."
            fi

            read -p "Execute another command? (y/n) " answer
            [[ $answer != "y" ]] && break
        done
    }

### Put any code not related to the TUI above this

function show_tui {
    # Professional TUI for Commandant with rounded corners
    border = "╭───────────────────────────────────────────╮"
    borderEnd = "╰───────────────────────────────────────────╯"

    echo -e ""
    echo -e ""
    echo -e "$border"
    echo -e "|   Welcome to the Commandant for MacOS     |"
    echo -e "|   System Setup and Tweaks:                |"
    echo -e "|   1. Install Containerization             |"
    echo -e "|   2. Install Apps ( i - show installed )  |"
    echo -e "|   3. Install Custom WSL Kernel            |"
    echo -e "|   5. Install Everything  (1-5)            |"
    echo -e "|-------------------------------------------|"
    echo -e "|   Container Templates (WIP)               |"
    echo -e "|   6.  Fedora                              |"
    echo -e "|   7.  Ubuntu                              |"
    echo -e "|   8.  Kali                                |"
    echo -e "|   9.  OpenSuse Leap                       |"
    echo -e "|   10. Arch!                               |"
    echo -e "|-------------------------------------------|"
    echo -e "|   q to Quit                               |"
    echo -e "$borderEnd"
    echo -e ""
    echo -e ""
}

#End of Functions list
show_tui
while true; do
    echo ""
    read -q "Pick a number to continue or press 'q' to quit or 'o' to view the options again: " REPLY

    case $REPLY in
        q|quit) exit ;;
        1) ins_container ;;
        2) install_apps ;;
        5) install_everything ;;
        6) fedora ;;
        7) ubuntu ;;
        8) kali ;;
        9) suse ;;
        10) arch_wsl ;;
        o) show_tui ;;
        i) list_installed ;;
        *) echo -e "Pick a number to continue or press 'q' to quit or 'o' to view the options again"
           continue
           ;;
    esac
done
