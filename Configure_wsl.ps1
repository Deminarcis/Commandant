### Install Kali as a container (intentionally unconfigured)
Write-Output '[+] Installing Kali from MS store'
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
### Install Ubuntu as a container
Write-Output '[+] Installing Ubuntu container from the MS Store'
winget install  9PDXGNCFSCZV -s msstore --accept-package-agreements -h --accept-source-agreements
### Provision Ubuntu container
Write-Output '[+] Installing components inside Ubuntu, you may be asked for a password multiple times'
wsl.exe -d Ubuntu -- "curl -s https://julianfairfax.gitlab.io/package-repo/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/julians-package-repo.gpg"
wsl.exe -d Ubuntu -- "echo 'deb [ signed-by=/usr/share/keyrings/julians-package-repo.gpg ] https://julianfairfax.gitlab.io/package-repo/debs packages main' | sudo tee /etc/apt/sources.list.d/julians-package-repo.list"
wsl.exe -d Ubuntu -- "sudo add-apt-repository ppa:kisak/kisak-mesa -y"
wsl.exe -d Ubuntu -- "sudo apt update"
wsl.exe -d Ubuntu -- "sudo apt full-upgrade -y"
wsl.exe -d Ubuntu -- "sudo apt install mesa-utils mesa-opencl-icd mesa-common-dev mesa-drm-shim mesa-va-drivers mesa-vdpau-drivers mesa-vulkan-drivers libosmesa6 libglu1-mesa libgles2-mesa virt-manager flatpak yaru-theme* fonts-ubuntu*"
wsl.exe -d Ubuntu -- "sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
### Refreshing the session for flatpak variables
wsl.exe --shutdown
wsl.exe -d Ubuntu -- "gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3' && gsettings set org.gnome.desktop.interface color-scheme 'default'"
wsl.exe -d Ubuntu -- "gsettings set org.gnome.desktop.interface icon-theme 'Yaru'"
wsl.exe -d Ubuntu -- "sudo flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark"