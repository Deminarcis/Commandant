function ins_flathub {
    if (get-command flatpak ) {
        Write-Output "[+] Flatpak is available, setting up flathub"
        Write-Output "You may need sudo priveliges to make these changes"
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
        Write-Output "[+] Done! please log out and back in for changes to take effect"
    }
    else {
        Write-Output "[!!] Please install flatpak and run this again"
    }
}