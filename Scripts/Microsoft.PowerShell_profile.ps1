 if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
function modules {
  if ($IsWindows) {
    Install-Module -Name PSDepend -Scope CurrentUser -Repository PSGallery
    Install-Module Pscx -Scope CurrentUser -AllowClobber
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Repository PSGallery
    Install-Module -Name TabExpansionPlusPlus -Scope CurrentUser -Repository PSGallery -AllowClobber
    Install-Module -Name PSUtil -Scope CurrentUser -Repository PSGallery -AllowClobber
  }
  else {
    Install-Module -Name PSDepend -Scope CurrentUser -Repository PSGallery
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Repository PSGallery
    Install-Module -Name TabExpansionPlusPlus -Scope CurrentUser -Repository PSGallery -AllowClobber
    Install-Module -Name PSUtil -Scope CurrentUser -Repository PSGallery -AllowClobber
  }
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#Prompt V1
#function prompt {
#    $Time = (Get-Date).ToString("HH:mm")
#    $host.ui.rawui.WindowTitle = (Get-Location)
#    # START CONFIG VARIABLES
#    $PROMPT_ALTERNATIVE='twoline'
#    $NEWLINE_BEFORE_PROMPT='no'
#    # STOP CONFIG VARIABLES
#
#     $esc = [char]27
#      $bell = [char]7
#      $bold = "$esc[1m"
#      $reset = "$esc[0m"
#      If ($NEWLINE_BEFORE_PROMPT -eq 'yes') { Write-Host }
#      If ($PROMPT_ALTERNATIVE -eq 'twoline') {
#        Write-Host "┌──[" -NoNewLine -ForegroundColor Magenta
#        Write-Host "${bold}$([environment]::username)" -NoNewLine -ForegroundColor Red
#        Write-Host "]-[ 💀 ]-[" -NoNewLine -ForegroundColor Magenta
#        Write-Host "@$([system.environment]::MachineName)${reset}" -NoNewLine -ForegroundColor Yellow
#        Write-Host " - $Time " -NoNewLine -ForegroundColor Cyan
#        Write-Host "]-[" -NoNewLine -ForegroundColor Magenta
#        Write-Host "${bold}$(Get-Location)${reset}" -NoNewLine -ForegroundColor White
#        Write-Host "]" -ForegroundColor Magenta
#        Write-Host "└─" -NoNewLine -ForegroundColor Magenta
#        Write-Host "${reset}" -NoNewLine -ForegroundColor Magenta
#      } Else {
#        Write-Host "${bold}PS " -NoNewLine -ForegroundColor Magenta
#        Write-Host "$([environment]::username)@$([system.environment]::MachineName) " -NoNewLine -ForegroundColor Magenta
#        Write-Host "$(Get-Location)>${reset}" -NoNewLine -ForegroundColor Magenta
#      }
#      # Terminal title
#      Write-Host "${esc}]0;PS> $([environment]::username)@$([system.environment]::MachineName): $(Get-Location)${bell}" -NoNewLine
#      return " "
#}

#Prompt V2 (no icons)
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
        Write-Host "$([environment]::username)" -NoNewLine -ForegroundColor Red
        Write-Host "]--[" -NoNewLine -ForegroundColor Magenta
        Write-Host "@$([system.environment]::MachineName)${reset}" -NoNewLine -ForegroundColor Yellow
        Write-Host " - $Time " -NoNewLine -ForegroundColor Cyan
        Write-Host "]-[" -NoNewLine -ForegroundColor Magenta
        Write-Host "$(Get-Location)${reset}" -NoNewLine -ForegroundColor White
        Write-Host "]" -ForegroundColor Magenta
        Write-Host "└─" -NoNewLine -ForegroundColor Magenta
        Write-Host "${reset}" -NoNewLine -ForegroundColor Magenta
      } Else {
        Write-Host "PS " -NoNewLine -ForegroundColor Magenta
        Write-Host "$([environment]::username)@$([system.environment]::MachineName) " -NoNewLine -ForegroundColor Magenta
        Write-Host "$(Get-Location)>${reset}" -NoNewLine -ForegroundColor Magenta
      }
      # Terminal title
      Write-Host "${esc}]0;PS> $([environment]::username)@$([system.environment]::MachineName): $(Get-Location)${bell}" -NoNewLine
      return " "
}
### Aliases
Set-Alias update-modules modules

### Import modules
if (!(Test-Path "env:USERPROFILE\Documents\PowerShell\Terminal-Icons")) {
    Import-Module Terminal-Icons
}
if (!(Test-Path "env:USERPROFILE\Documents\PowerShell\PSDepend")) {
  Import-Module PSDepend
}
if (!(Test-Path "env:USERPROFILE\Documents\PowerShell\Pscx")) {
  Import-Module Pscx
}
if (!(Test-Path "env:USERPROFILE\Documents\PowerShell\PSUtil")) {
  Import-Module PSUtil
}
if (!(Test-Path "env:USERPROFILE\Documents\PowerShell\TabExpansionPlusPlus")) {
  Import-Module TabExpansionPlusPlus
}
if($IsWindows -eq 'False'){
  if (!(Test-Path "~/.local/share/powershell/modules/TabExpansionPlusPlus")) {
    <# Action to perform if the condition is true #>
  }
  if (!(Test-Path "~/.local/share/powershell/modules/Terminal-Icons")) {
    Import-Module Terminal-Icons
  }
  if (!(Test-Path "~/.local/share/powershell/modules/PSDepend")) {
    Import-Module PSDepend
  }
  if (!(Test-Path "~/.local/share/powershell/modules/Pscx")) {
    Import-Module Pscx
  }
  if (!(Test-Path "~/.local/share/powershell/modules/PSUtil")) {
    Import-Module PSUtil
  }
  Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
  $env:COMPLETION_SHELL_PREFERENCE = '/usr/bin/zsh'
}