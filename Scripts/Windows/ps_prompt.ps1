function install_custom_prompt {
    Clear-Host
    Write-Host "[+] Installing custom powershell prompt..."
    New-Item "$env:USERPROFILE\Documents\PowerShell\" -Type Directory -Force
    Copy-Item '..\Resources\Microsoft.PowerShell_profile.ps1' "$env:USERPROFILE\Documents\PowerShell\"
    Write-Output "[+] Done!"
}
install_custom_prompt