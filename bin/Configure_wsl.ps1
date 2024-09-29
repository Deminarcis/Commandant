#setting variables
Set-Variable -Name HOST_FOLDER -Value $(Get-Location)
### Install Kali as a container (intentionally unconfigured)
Write-Output '[+] Installing Kali from MS store'
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
### Install Ubuntu as a container
Write-Output '[+] Installing Ubuntu container from the MS Store'
winget install  9PDXGNCFSCZV -s msstore --accept-package-agreements -h --accept-source-agreements
### Provision Ubuntu container
Write-Output '[+] Installing components inside Ubuntu, you may be asked for a password multiple times'
Write-Output '[+] Adding Kisak repo for more up to date mesa'
wsl.exe -d Ubuntu --exec sudo add-apt-repository ppa:kisak/kisak-mesa -y
Write-Output '[+] Updating container'
wsl.exe -d Ubuntu --exec sudo apt update
wsl.exe -d Ubuntu --exec sudo apt full-upgrade -y
Write-Output '[+] Installing virt-manager, flatpak, mesa and vulkan drivers. also installing ubuntu themes and icons'
wsl.exe -d Ubuntu --exec sudo apt install mesa-utils mesa-opencl-icd mesa-common-dev mesa-drm-shim mesa-va-drivers mesa-vdpau-drivers mesa-vulkan-drivers libosmesa6 libglu1-mesa libgles2-mesa virt-manager flatpak yaru-theme* fonts-ubuntu*
Write-Output '[+] Setting up Flathub for flatpaks [More instructions on flathub.org if you want a GUI for flatpaks]'
wsl.exe -d Ubuntu --exec sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
### Refreshing the session for flatpak variables
Write-Output '[+] Refreshing session to apply changes'
wsl.exe --shutdown
Write-Output '[+] Installing adw-gtk3 theme'
wsl.exe -d Ubuntu --exec wget https://github.com/lassekongo83/adw-gtk3/releases/download/v5.3/adw-gtk3v5.3.tar.xz
wsl.exe -d Ubuntu --exec sudo tar -xjf adw-gtk3v5.3.tar.xz -C /usr/share/themes/
wsl.exe -d Ubuntu --exec rm adw-gtk3v5.3.tar.xz
Write-Output '[+] Applying Yaru and adw-gtk3 styling to apps'
wsl.exe -d Ubuntu --exec gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
wsl.exe -d Ubuntu --exec gsettings set org.gnome.desktop.interface color-scheme 'default'
wsl.exe -d Ubuntu --exec gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
Write-Output '[+] Installing flatpak theme to match styling on flatpaks'
wsl.exe -d Ubuntu --exec sudo flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
#setting up zshrc
wsl.exe -d Ubuntu --exec sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions zsh
wsl.exe -d Ubuntu --exec cp $HOST_FOLDER/Scripts/zshrc -rvfi ~/.zshrc
Clear-Variable -Name HOST_FOLDER
Write-Output "[!!] Done! [!!]"