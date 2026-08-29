function ins_nix_linux {
    Write-Output "[+]  Installing Nix Package Manager (multi user mode)"
    curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon
}
ins_nix_linux