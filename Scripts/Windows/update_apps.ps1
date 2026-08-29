function update_installed {
    Clear-Host
    Write-Host "[+] Updating installed Scoop Apps..."
    scoop update *
    Write-Host ""
    Write-Host "[+] Updating installed Winget Apps..."
    winget upgrade --all
    Write-Output "[+] Done!"
    Start-Sleep 10
    show_tui
}
update_installed