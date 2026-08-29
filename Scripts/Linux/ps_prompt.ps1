function ps_prompt_linux {
    mkdir -p ~/.config/powershell
    cp -rvf ../Resources/Microsoft.PowerShell_profile.ps1 ~/.config/powershell
    Write-Output "[+] Done!"
}
ps_prompt_linux