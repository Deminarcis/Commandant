function ps_prompt_linux {
    Write-Output "[+] Setting up PowerShell prompt..."
    mkdir -p ~/.config/powershell
    cp -rvf ../Resources/Microsoft.PowerShell_profile.ps1 ~/.config/powershell
    Write-Output "[+] Done!"
}
ps_prompt_linux
