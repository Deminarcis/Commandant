#!/usr/bin/env bash
echo -e "[+] Installing Brew and updating it's sources"
/bin/bash -c "$(curl -FsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(homebrew/bin/brew shellenv)"
brew udpate
echo -e "[+] Installing Podman"
brew install podman podman-desktop
echo -e "[+] Geting UTM, python, ruby, powershell, git. 7zip, firefox, thunderbird, some shell tools and fonts"
brew install utm python ruby powershell git 7zip firefox thunderbird intellidock visual-studio-code xquartz iterm2 syncthing bat nano coreutils zsh
brew tap homebrew-cask-fonts
brew install font-gohufont-nerd-font font-cozette
echo -e "[+] Setting up Podman and it's containers"
podman machine init
podman machine start
podman info
echo -e "Adding custom zshrc"
cp -rvf ./Scripts/.zshrc ~/.zshrc