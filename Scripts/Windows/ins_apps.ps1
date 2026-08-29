function install_apps {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "  Welcome to the Commandant               " -foregroundcolor Cyan
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "  Pick an app to install:                 " -foregroundcolor Red
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "  1. Powershell      2. VSCode      3. Powertoys " -foregroundcolor Red
    Write-Host "  4. Zen Browser     5. Google Chrome   6. Firefox Browser " -foregroundcolor Red
    Write-Host "  7. Mozilla Thunderbird   8. bat       9. Nano      " -foregroundcolor Red
    Write-Host "  10. MS Edit       11. lsd      12. Helix  " -foregroundcolor Red
    Write-Host "  13. sysinternals  14. 7zip     15. Bitwarden  " -foregroundcolor Red
    Write-Host "  16. Haruna        17. WinFsp     18. Zed  " -foregroundcolor Red
    Write-Host "  19. Bleachbit     20. Discord     21. Obsidian " -foregroundcolor Red
    Write-Host "  22 Mesa 3D       23. YT-Dlp     24. ffmpeg " -foregroundcolor Red
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host "   s to search for package                 " -foregroundcolor Red
    Write-Host "   i to install unlisted app               " -foregroundcolor Red
    Write-Host "   b to Go Back                            " -foregroundcolor Red
    Write-Host "|╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍│" -foregroundcolor Magenta
    Write-Host ""
    Write-Host ""

    $choices = @()

    do {
        Write-Host
        $choice = Read-Host "Pick a number to continue or press 'q' to quit ot 'o' to view the options again"

        if ($choice -eq 'q' -or $choice -eq 'quit') {
            exit
        }

        switch ($choice) {
            1 {
                scoop install pwsh && install_apps
            }
            2 {
                scoop install vscode && install_apps
            }
            3 {
                scoop install extras/powertoys && install_apps
            }
            4 {
                scoop install extras/zen-browser && install_apps
            }
            5 {
                scoop install extras/googlechrome && install_apps
            }
            6 {
                scoop install extras/firefox && install_apps
            }
            7 {
                scoop install extras/thunderbird && install_apps
            }
            8 {
                scoop install bat && install_apps
            }
            9 {
                scoop install nano && install_apps
            }
            10 {
                scoop install edit && install_apps
            }
            11 {
                scoop install lsd && install_apps
            }
            12 {
                scoop install helix && install_apps
            }
            13 {
                scoop install extras/sysinternals && install_apps
            }
            14 {
                scoop install 7zip && install_apps
            }
            15 {
                scoop install extras/bitwarden && install_apps
            }
            16 {
                winget install --id=KDE.Haruna -e && install_apps
            }
            17 {
                scoop install nonportable/winfsp-np && install_apps
            }
            18 {
                scoop install extras/zed && install_apps
            }
            19 {
                scoop install extras/bleachbit && install_apps
            }
            20 {
                scoop install extras/discord && install_apps
            }
            21 {
                scoop install extras/obsidian && install_apps
            }
            22 {
                scoop install games/mesa3d && install_apps
            }
            23 {
                scoop install yt-dlp ffmpeg
            }
            24 {
                scoop install ffmpeg
            }
            'o' {
                install_apps
            }
            'i' {
                $unlisted_app = Read-Host "Enter the name of the app to install"; scoop install $unlisted_app
            }
            's' {
                $search_app = Read-Host "Enter the name of the package you are looking for: "; scoop search $search_app
            }
            'b' {
                exit
            }
            default {
                Write-Host "Pick a number to continue or press 'b' to go back or 'o' to view the options again"
                continue
            }
        }
    } while ($true)
}
install_apps