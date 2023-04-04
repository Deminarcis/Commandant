# if you started this script without admin rights, this will first start a new console with admin rights then run the script below
# the original console will be closed
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # add -noexit before -encodedcommand to keep the admin console open after the script is run
    start-process powershell "-encodedcommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script:MyInvocation.MyCommand.ScriptBlock)))" -Verb RunAs
    # comment this out to leave the non admin console open, but you'll not be needing it since a new one will open with admin rights
    # NOTE!: if you do comment this out, the rest of the script will be executed first as non admin, then again when the admin console appears
    # you could add another if statement down below saying if you're not admin, do something else, or add an else to this if statment
    exit
}

#####
# BEGIN YOUR SCIPT HERE:
#####

Remove-Variable -Name wingetInstalled
wingetInstalled = cmd /c where winget '2>&1'
if ( $wingetInstalled -like '*winget.exe*' )
{
    Write-Output "winget is already installed"
}
else
{
    Write-Output "Please install winget (App Installer) before continuing"
    exit
}
Set-ExecutionPolicy RemoteSigned
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Import-Module PSWindowsUpdate
# Change this later, it will break windows defender but is necessary to install Kali smoothly
Set-MpPreference -DisableRealtimeMonitoring $true
# Get Windows updates
Get-WindowsUpdate
wsl --install -n --web-download
### Break here for reboot
Write-Output 'The next step may fail if you dont have a Microsoft account logged in to the store or this PC'
Write-Output 'Provsioning Kali'
winget upgrade --all
winget install  9PKR34TNCV07 -s msstore --accept-package-agreements -h --accept-source-agreements
Start-Process powershell -ArgumentList {
    -wsl -d Kali ./Setup-kali.sh
}
winget install microsoft.powershell --accept-package-agreements -h --accept-source-agreements
Install-Package chocolatey
Start-Process powershell -ArgumentList {
    choco upgrade chocolatey -y
    choco install firefox sysinternals ChocolateyGUI FoxitReader vlc python 7zip testdisk-photorec git vscode filezilla wireshark postman boxstarter ffmpeg tor-browser qbittorrent openvpn rufus obs-studio bitwarden obsidian virtualbox veracrypt synctrayzor powertoys-y 
} -Verb RunAs

powershelProfile = powershell /c Write-Host $PROFILE

Write-Host @"
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Import-Module PSWindowsUpdate
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

function prompt {
    $Time = (Get-Date).ToString("hh:mm") 
    $host.ui.rawui.WindowTitle = (Get-Location)
    # The following block is surrounded by two delimiters.
    # These delimiters must not be modified. Thanks.
    # START KALI CONFIG VARIABLES
    $PROMPT_ALTERNATIVE='twoline'
    $NEWLINE_BEFORE_PROMPT='no'
    # STOP KALI CONFIG VARIABLES
    
      $esc = [char]27
      $bell = [char]7
      $bold = "$esc[1m"
      $reset = "$esc[0m"
      If ($NEWLINE_BEFORE_PROMPT -eq 'yes') { Write-Host }
      If ($PROMPT_ALTERNATIVE -eq 'twoline') {
        Write-Host "┌──[" -NoNewLine -ForegroundColor Magenta
        Write-Host "${bold}$([environment]::username)" -NoNewLine -ForegroundColor Red
        Write-Host "] 💀 [" -NoNewLine -ForegroundColor Magenta
        Write-Host "@$([system.environment]::MachineName)${reset}" -NoNewLine -ForegroundColor Green
        Write-Host " - $Time " -NoNewLine -ForegroundColor Blue
        Write-Host "]-[" -NoNewLine -ForegroundColor Magenta
        Write-Host "${bold}$(Get-Location)${reset}" -NoNewLine -ForegroundColor White
        Write-Host "]" -ForegroundColor Magenta
        Write-Host "└─" -NoNewLine -ForegroundColor Magenta
        Write-Host "${reset}" -NoNewLine -ForegroundColor Magenta
      } Else {
        Write-Host "${bold}PS " -NoNewLine -ForegroundColor Magenta
        Write-Host "$([environment]::username)@$([system.environment]::MachineName) " -NoNewLine -ForegroundColor Magenta
        Write-Host "$(Get-Location)>${reset}" -NoNewLine -ForegroundColor Magenta
      }
      # Terminal title
      Write-Host "${esc}]0;PS> $([environment]::username)@$([system.environment]::MachineName): $(Get-Location)${bell}" -NoNewLine
      return " "
}
"@ > $powershelProfile
