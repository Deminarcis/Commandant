### Modules
if (-not (Get-Module -ListAvailable -Name Terminal-Icons))
{
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
}
if (-not (Get-Module -ListAvailable -Name PSReadLine))
{
    Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
}

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -Colors @{
    Command = '#87CEEB'  # SkyBlue (pastel)
    Parameter = '#98FB98'  # PaleGreen (pastel)
    Operator = '#FFB6C1'  # LightPink (pastel)
    Variable = '#DDA0DD'  # Plum (pastel)
    String = '#FFDAB9'  # PeachPuff (pastel)
    Number = '#B0E0E6'  # PowderBlue (pastel)
    Type = '#F0E68C'  # Khaki (pastel)
    Comment = '#D3D3D3'  # LightGray (pastel)
    Keyword = '#8367c7'  # Violet (pastel)
    Error = '#FF6347'  # Tomato (keeping it close to red for visibility)
}

function prompt
{
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
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
    If ($NEWLINE_BEFORE_PROMPT -eq 'yes')
    { Write-Host
    }
    If ($PROMPT_ALTERNATIVE -eq 'twoline')
    {
        $(if ($principal.IsInRole($adminRole)) { "[ADMIN]: " }
            else { '' })
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
    } Else
    {
        $(if ($principal.IsInRole($adminRole)) { "[ADMIN]: " }
        else { '' })
        Write-Host "PS " -NoNewLine -ForegroundColor Magenta
        Write-Host "$([environment]::username)@$([system.environment]::MachineName) " -NoNewLine -ForegroundColor Magenta
        Write-Host "$(Get-Location)>${reset}" -NoNewLine -ForegroundColor Magenta
    }
    # Terminal title
    Write-Host "${esc}]0;PS> $([environment]::username)@$([system.environment]::MachineName): $(Get-Location)${bell}" -NoNewLine
    return " "
}

# Opt-out of telemetry before doing anything, only if PowerShell is run as admin
if ($isWindows -eq $true)
{
    if ([bool]([System.Security.Principal.WindowsIdentity]::GetCurrent()).IsSystem)
    {
        [System.Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', 'true', [System.EnvironmentVariableTarget]::Machine)
    }
}

function touch($file)
{ "" | Out-File $file -Encoding ASCII
}

# Network Utilities
function pubip
{ (Invoke-WebRequest http://ifconfig.me/ip).Content
}

# Open WinUtil full-release
function winutil
{
    Invoke-Expression (Invoke-RestMethod https://christitus.com/win)
}

# System Utilities
function admin
{
    if ($args.Count -gt 0)
    {
        $argList = $args -join ' '
        Start-Process wt -Verb runAs -ArgumentList "pwsh.exe -NoExit -Command $argList"
    } else
    {
        Start-Process wt -Verb runAs
    }
}

# Set UNIX-like aliases for the admin command, so sudo <command> will run the command with elevated rights.
Set-Alias -Name su -Value admin

Import-Module -Name Terminal-Icons
### Aliases

if ( $isWindows -eq $false)
{
    Set-Alias -Name ls -Value Get-ChildItem
}

function grep($regex, $dir)
{
    if ( $dir )
    {
        Get-ChildItem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}

function df
{
    get-volume
}

function sed($file, $find, $replace)
{
    (Get-Content $file).replace("$find", $replace) | Set-Content $file
}

function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function export($name, $value)
{
    set-item -force -path "env:$name" -value $value;
}

function pkill($name)
{
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

function pgrep($name)
{
    Get-Process $name
}

function head
{
    param($Path, $n = 10)
    Get-Content $Path -Head $n
}

function tail
{
    param($Path, $n = 10, [switch]$f = $false)
    Get-Content $Path -Tail $n -Wait:$f
}

# Quick Access to System Information
function sysinfo
{ Get-ComputerInfo
}

# Networking Utilities
function flushdns
{
    Clear-DnsClientCache
    Write-Host "DNS has been flushed"
}

function Clear-Cache
{
    # If function "Clear-Cache_Override" is defined in profile.ps1 file
    # then call it instead.
    # -----------------------------------------------------------------
    # If you do override this function, you should should probably duplicate
    # the following calls in your override function, just don't call this
    # function from your override function, otherwise you'll be in an infinate loop.
    if (Get-Command -Name "Clear-Cache_Override" -ErrorAction SilentlyContinue)
    {
        Clear-Cache_Override
    } else
    {
        # add clear cache logic here
        Write-Host "Clearing cache..." -ForegroundColor Cyan

        # Clear Windows Prefetch
        Write-Host "Clearing Windows Prefetch..." -ForegroundColor Yellow
        Remove-Item -Path "$env:SystemRoot\Prefetch\*" -Force -ErrorAction SilentlyContinue

        # Clear Windows Temp
        Write-Host "Clearing Windows Temp..." -ForegroundColor Yellow
        Remove-Item -Path "$env:SystemRoot\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

        # Clear User Temp
        Write-Host "Clearing User Temp..." -ForegroundColor Yellow
        Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

        # Clear Internet Explorer Cache
        Write-Host "Clearing Internet Explorer Cache..." -ForegroundColor Yellow
        Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue

        Write-Host "Cache clearing completed." -ForegroundColor Green
    }
}
