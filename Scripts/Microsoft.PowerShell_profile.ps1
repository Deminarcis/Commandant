 if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
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
        Write-Host "$([environment]::username)" -NoNewLine -ForegroundColor Red
        Write-Host "]--[" -NoNewLine -ForegroundColor Magenta
        Write-Host "@$([system.environment]::MachineName)${reset}" -NoNewLine -ForegroundColor white
        Write-Host " - $Time " -NoNewLine -ForegroundColor white
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
Set-Alias ls 'eza -alg --icons'
