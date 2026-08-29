function xcode_utils {
    # Install Xcode Command Line Tools
    xcode-select --install
}

function ins_brew {
    # Install Homebrew
    xcode_utils
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
ins_brew