### Provision kali-linux container
echo -e '[+] Updating container'
sudo apt update
sudo apt full-upgrade -y
echo -e '[+] Installing virt-manager, flatpak, mesa and vulkan drivers. also installing kali-linux themes and icons'
sudo apt install mesa-utils mesa-opencl-icd mesa-common-dev mesa-drm-shim mesa-va-drivers mesa-vdpau-drivers mesa-vulkan-drivers libosmesa6 libglu1-mesa libgles2-mesa virt-manager flatpak gnome-software-plugin-flatpak kali-win-kex kali-tweaks kali-system-core kali-linux-headless kali-defaults-desktop
echo -e '[+] Setting up Flathub for flatpaks'
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo -e '[+] Installing theming'
#TODO: Get branded theming to work
sudo apt install kali-themes kali-themes-common desktop-base kali-wallpapers-all kali-themes-purple kali-desktop-xfce adw-gtk3-kali
#echo -e '[+] Applying styling to apps'
#gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
#gsettings set org.gnome.desktop.interface color-scheme 'default'
echo -e '[+] Installing flatpak theme to match styling on flatpaks'
mkdir -p ~/.themes
cp -a /usr/share/themes/* ~/.themes/
sudo flatpak override --filesystem=~/.themes/
#setting up zshrc
echo -e "[!!] Done! [!!]"
