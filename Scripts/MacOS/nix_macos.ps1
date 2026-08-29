function ins_nix_macos {
    Write-Output "[+]  Installing Nix Package Manager"
    /bin/bash -c "$(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)"
}
ins_nix_macos