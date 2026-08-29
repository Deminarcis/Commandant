function containers_windows {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   WSL Distro Installer               " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   Pick your WSL Distro:                "
    Write-Host "   1. Ubuntu"
    Write-Host "   2. Fedora"
    Write-Host "   3. Kali Linux"
    Write-Host "   4. Arch Linux"
    Write-Host "   5. OpenSUSE Leap"
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   q to Quit                               " -foregroundcolor Green
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    do {
        $choice = Read-Host "Enter your choice or press 'o' to reload the options"
        if ($choice -eq 'q' -or $choice -eq 'quit') {
            break
        }
        switch ($choice) {
            '1' {
                Start-Process pwsh "-File", "container_ubuntu.ps1"
            }
            '2' {
                Start-Process pwsh "-File", "container_fedora.ps1"
            }
            '3' {
                Start-Process pwsh "-File", "container_kali.ps1"
            }
            '4' {
                Start-Process pwsh "-File", "container_arch.ps1"
            }
            '5' {
                Start-Process pwsh "-File", "container_leap.ps1"
            }
            'b' {
                exit
            }
            'o' {
                containers_windows
            }
        }
    } while ($true)
}
containers_windows