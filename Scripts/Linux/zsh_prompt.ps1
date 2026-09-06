function zsh_prompt {
    Write-Output "[+] Setting up ZSH prompt..."
    cp -rvf ../Resources/zshrc ~/.zshrc
    Write-Output "[+] Done!"
}
zsh_prompt
