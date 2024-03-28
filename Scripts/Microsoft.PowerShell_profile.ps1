 if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

if ($IsWindows) {
  Install-Module -Name PSDepend -Scope CurrentUser -Repository PSGallery
  Import-Module PSDepend
  Install-Module Pscx -Scope CurrentUser -AllowClobber
  Install-Module -Name Terminal-Icons -Scope CurrentUser -Repository PSGallery
  Install-Module -Name TabExpansionPlusPlus -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name PSUtil -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name ImportExcel -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name PSWriteHTML -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name PSWritePDF -Scope CurrentUser -Repository PSGallery -AllowClobber -Force
  Install-Module -Name PSWriteWord -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name PSScriptTools -Scope CurrentUser -Repository PSGallery -AllowClobber
  Import-Module Terminal-Icons
  Import-Module PSUtil
  Import-Module Pscx
  Import-Module TabExpansionPlusPlus
  Import-Module ImportExcel
  Import-Module PSWriteHTML
  Import-Module PSWritePDF
  Import-Module PSWriteWord
  Import-Module PSScriptTools
}
else {
  Install-Module -Name PSDepend -Scope CurrentUser -Repository PSGallery
  Import-Module PSDepend
  Install-Module -Name Terminal-Icons -Scope CurrentUser -Repository PSGallery
  Install-Module -Name TabExpansionPlusPlus -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name PSUtil -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name PSUnixUtilCompleters -Scope CurrentUser -Repository PSGallery -AllowClobber
  Install-Module -Name PSScriptTools -Scope CurrentUser -Repository PSGallery -AllowClobber
  Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
  $env:COMPLETION_SHELL_PREFERENCE = '/usr/bin/zsh'
  Import-Module PSUnixUtilCompleters
  Import-Module Terminal-Icons
  Import-Module PSScriptTools
  Import-Module PSUtil
  Import-Module TabExpansionPlusPlus
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

function prompt {
    $Time = (Get-Date).ToString("HH:mm")
    $host.ui.rawui.WindowTitle = (Get-Location)
    # START CONFIG VARIABLES
    $PROMPT_ALTERNATIVE='twoline'
    $NEWLINE_BEFORE_PROMPT='no'
    # STOP CONFIG VARIABLES

      $esc = [char]27
      $bell = [char]7
      $bold = "$esc[1m"
      $reset = "$esc[0m"
      If ($NEWLINE_BEFORE_PROMPT -eq 'yes') { Write-Host }
      If ($PROMPT_ALTERNATIVE -eq 'twoline') {
        Write-Host "┌──[" -NoNewLine -ForegroundColor Magenta
        Write-Host "${bold}$([environment]::username)" -NoNewLine -ForegroundColor Red
        Write-Host "] 💀 [" -NoNewLine -ForegroundColor Magenta
        Write-Host "@$([system.environment]::MachineName)${reset}" -NoNewLine -ForegroundColor Yellow
        Write-Host " - $Time " -NoNewLine -ForegroundColor Cyan
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