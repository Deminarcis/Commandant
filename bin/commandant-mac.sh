#!/usr/bin/env zsh
if [[ $UID == 0 || $EUID == 0 ]]; then
    echo "please dont run this as root. we will ask for admin priveliges if we need them."
    break
fi
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
pomdan pull docker.io/kalilinux/kali-rolling:latest
podman pull docker.io/library/ubuntu:latest
podman create --name=Kali docker.io/kalilinux/kali-rolling:latest
podman create --name=Ubuntu docker.io/library/ubuntu:latest
echo -e "Adding custom zshrc"
cp -rvf ../Scripts/.zshrc ~/.zshrc