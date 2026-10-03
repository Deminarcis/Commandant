function containers_mac {
    Write-Host ""
    Write-Host ""
    Write-Color "┌────────────────────────────────────────────────────────────┐  " -color Magenta
    Write-Color "| ", "RECIPES ", "                                                   |  " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "1. Ubuntu ", "                                                 |  " -color Magenta, White, Magenta
    Write-Color "| ", "2. Fedora ", "                                                 |  " -color Magenta, White, Magenta
    Write-Color "| ", "3. CentOS ", "                                                 |  " -color Magenta, White, Magenta
    Write-Color "| ", "4. Red Hat ", "                                                |  " -color Magenta, White, Magenta
    Write-Color "| ", "5. Kali ", "                                                   |  " -color Magenta, White, Magenta
    Write-Color "| ", "6. Blackarch ", "                                              |  " -color Magenta, White, Magenta
    Write-Color "| ", "7. OpenSUSE ", "                                               |  " -color Magenta, White, Magenta
    Write-Color "|────────────────────────────────────────────────────────────|  " -color Magenta
    Write-Color "| ", "b to go back ", "                                              |  " -color Magenta, White, Magenta
    Write-Color "| ", "o to View Options ", "                                         |  " -color Magenta, White, Magenta
    Write-Color "| ", "q to Quit ", "                                                 |  " -color Magenta, White, Magenta
    Write-Color "└────────────────────────────────────────────────────────────┘  " -color Magenta
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
