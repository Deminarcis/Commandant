function xcode_utils {
    # Install Xcode Command Line Tools
    xcode-select --install
}

unction ins_macports
{
    # Install MacPorts
    xcode_utils
    Write-Host ""
    Write-Host ""
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   CHOOSE YOUR MACOS VERSION                    "
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   1. Tahoe                                                "
    Write-Host "   2. Sequoia                                              "
    Write-Host "   3. Sonoma                                               "
    Write-Host "   4. Ventura                                              "
    Write-Host "   5. Monterey                                             "
    Write-Host "   6. Something else  (open website)                       "
    Write-Host "                                                           "
    Write-Host "                                                           "
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   b to go back                                            "
    Write-Host "   o to View Options                                       "
    Write-Host "│╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    do
    {
        Write-Host
        $choice =  Read-Host "Which version of MacOS do you have?"

        if ($choice -eq 'q' -or $choice -eq 'quit')
        {
            break
        }

        switch ($choice)
        {
            '1'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-26-Tahoe.pkg"; chmod +x MacPorts-2.12.5-26-Tahoe.pkg; open MacPorts-2.12.5-26-Tahoe.pkg; ins_macports
            }
            '2'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-15-Sequoia.pkg"; chmod +x MacPorts-2.12.5-15-Sequoia.pkg; open MacPorts-2.12.5-15-Sequoia.pkg; ins_macports
            }
            '3'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-14-Sonoma.pkg"; chmod +x MacPorts-2.12.5-14-Sonoma.pkg; open MacPorts-2.12.5-14-Sonoma.pkg; ins_macports
            }
            '4'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-13-Ventura.pkg"; chmod +x MacPorts-2.12.5-13-Ventura.pkg; open MacPorts-2.12.5-13-Ventura.pkg; ins_macports
            }
            '5'
            { curl -OL "https://github.com/macports/macports-base/releases/download/v2.12.5/MacPorts-2.12.5-12-Monterey.pkg"; chmod +x MacPorts-2.12.5-12-Monterey.pkg; open MacPorts-2.12.5-12-Monterey.pkg; ins_macports
            }
            '6'
            { open 'https://www.macports.org/install.php'; ins_macports
            }
            'b'
            { show_mac_tui
            }
            'o'
            { ins_macports
            }
            default
            {
                Write-Host "Invalid choice. Please select from the list above."
                continue
            }
        }
    } while ($true)
}
ins_macports
