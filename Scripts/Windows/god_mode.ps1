function god_mode {
    Clear-Host
    Write-Host "[+] Enabling God Mode..."
    New-Item "$env:USERPROFILE\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" -Type Directory -Force
    Write-Output "[+] Done!"
}
god_mode
