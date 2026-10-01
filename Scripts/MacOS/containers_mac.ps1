function containers_mac {
    Write-Host ""
    Write-Host ""
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   RECIPES                            "
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   1. Ubuntu                                              "
    Write-Host "   2. Fedora                                               "
    Write-Host "   3. CentOS                                              "
    Write-Host "   4. Red Hat                                             "
    Write-Host "   5. Kali                                                "
    Write-Host "   6. Blackarch                                           "
    Write-Host "   7. OpenSUSE                                            "
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" foregroundcolor Magenta
    Write-Host "   b to go back                                            "
    Write-Host "   o to View Options                                       "
    Write-Host "   q to Quit                                               "
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    do {
        Write-Host
        $choice = Read-Host "Enter your choice from the list above: "

        if ($choice -eq 'q' -or $choice -eq 'quit') {
            break
        }

        switch ($choice) {
            1 {
                Start-Process pwsh -ArgumentList "-File", "container_ubuntu.ps1"
            }
            2 {
                Start-Process pwsh -ArgumentList "-File", "container_fedora.ps1"
            }
            3 {
                Start-Process pwsh -ArgumentList "-File", "container_centos.ps1"
            }
            4 {
                Start-Process pwsh -ArgumentList "-File", "container_rhel.ps1"
            }
            5 {
                Start-Process pwsh -ArgumentList "-File", "container_kali.ps1"
            }
            6 {
                Start-Process pwsh -ArgumentList "-File", "container_blackarch.ps1"
            }
            7 {
                Start-Process pwsh -ArgumentList "-File", "container_leap.ps1"
            }
            'b' {
                exit
            }
            'o' {
                containers_mac
            }
            default {
                Write-Host "Invalid choice. Please select from the list above."
                continue
            }
        }
    } while ($true)
}
containers_mac
