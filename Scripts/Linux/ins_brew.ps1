function ins_brew_linux {
    # Install Homebrew on Linux
    Write-Output "[!!] Running outside powershell as this function doesnt work when executed using powershell \n"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
ins_brew_linux