 if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Install-Module -Name PSDepend -Repository PSGallery
Import-Module PSDepend
Get-Command -Module PSDepend
Install-Module Pscx -Scope CurrentUser -AllowClobber
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PSWindowsUpdate -Repository PSGallery
Install-Module -Name TabExpansionPlusPlus -Repository PSGallery -AllowClobber
Install-Module -Name PSUtil -Repository PSGallery
Import-Module Terminal-Icons
Import-Module PSUtil
Import-Module Pscx
Import-Module TabExpansionPlusPlus
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