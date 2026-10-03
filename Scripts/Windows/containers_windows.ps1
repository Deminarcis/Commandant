function containers_windows {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Color "┌────────────────────────────────────────────────────────────┐  " -color Magenta
    Write-Color "| ", "WSL DISTRO INSTALLER ", "                                      | " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "| ", "Pick your WSL Distro: ", "                                     | " -color Magenta, White, Magenta
    Write-Color "| ", "   1. Ubuntu", "                                               | " -color Magenta, White, Magenta
    Write-Color "| ", "   2. Fedora", "                                               | " -color Magenta, White, Magenta
    Write-Color "| ", "   3. Kali Linux", "                                           | " -color Magenta, White, Magenta
    Write-Color "| ", "   4. Arch Linux", "                                           | " -color Magenta, White, Magenta
    Write-Color "| ", "   5. OpenSUSE Leap", "                                        | " -color Magenta, White, Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "|                                                            |  " -color Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", " q to Quit ", "                                                |  " -color Magenta, White, Magenta
    Write-Color "└────────────────────────────────────────────────────────────┘  " -color Magenta
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
