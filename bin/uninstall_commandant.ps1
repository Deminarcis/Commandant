#######################################################
#  Check context is an administrator, if not elevate  #
#######################################################
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # add -noexit before -encodedcommand to keep the admin console open after the script is run
    start-process powershell "-encodedcommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script:MyInvocation.MyCommand.ScriptBlock)))" -Verb RunAs
    exit
}

##################
#  BEGIN SCIPT:  #
##################
Write-Output '[!!] Uninstalling everything Commandant has done to your PC'
wsl.exe --uninstall
### Kali
winget uninstall  9PKR34TNCV07 -s msstore
### Sysinternals
winget uninstall  9P7KNL5RWT25 -s msstore
### Python
winget uninstall  9NCVDN91XZQP -s msstore
winget uninstall 'Microsoft.Powershell' 'Git.git' 'Microsoft.VisualStudioCode' 'Microsoft.Powertoys' 'Microsoft.DevHome' 'Mozilla.Firefox' 'Mozilla.Thunderbird' 'Microsoft.WindowsTerminal' 'GNU.Nano' 'sharkdp.bat' 'helix.helix' 'eza-community.eza' 'Giorgiotani.Peazip'
powershell -ExecutionPolicy Bypass -Command "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://superfile.netlify.app/uninstall.ps1'))"
Remove-Item '$env:USERPROFILE\bzImage'
Remove-Item '$env:USERPROFILE\.wslconfig'
