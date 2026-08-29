function ins_distroshelf {
    if (get-command flatpak ) {
        Write-Output "[+] Flatpak is available, Installing Distroshelf"
        Write-Output "You need flathub. if this install fails make sure flathub is set up first"
        flatpak install com.github.marhkb.Pods
        Write-Output "[+] Done!"
    }
    else {
        Write-Output "[!!] Please install flatpak and run this again"
    }
}