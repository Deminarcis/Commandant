function install_scoop {
    Clear-Host
    Write-Host "[+] Installing Scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    scoop bucket add main
    scoop bucket add extras
    scoop bucket add nerd-fonts
    scoop bucket add nonportable
    scoop bucket add games
    scoop install aria2
    Write-Output "[+] Done!"
}
install_scoop