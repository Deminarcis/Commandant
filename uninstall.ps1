###
# Check context is an administrator, if not elevate
###
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # add -noexit before -encodedcommand to keep the admin console open after the script is run
    start-process powershell "-encodedcommand $([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script:MyInvocation.MyCommand.ScriptBlock)))" -Verb RunAs
    exit
}

################
# BEGIN SCIPT: #
################
Write-Output '[!!] Uninstalling everything Commandant has done to your PC'
wsl.exe --uninstall
winget uninstall  9PKR34TNCV07 -s msstore
winget unisntall  9PDXGNCFSCZV -s msstore
winget uninstall  9P7KNL5RWT26 -s msstore
winget uninstall  9NCVDN91XZQP -s msstore
winget uninstall 'Microsoft.Powershell' 'Git.git' '7zip.7zip' 'Microsoft.VisualStudioCode' 'Microsoft.Powertoys' 'Microsoft.DevHome' 'Mozilla.Firefox' 'Mozilla.Thunderbird' 'Microsoft.WindowsTerminal' 'Oracle.Virtualbox' 'Jetbrains.Toolbox' 'GNU.Nano' 'sharkdp.bat'
Remove-Item '$env:USERPROFILE\bzImage'
Remove-Item -Recurse '$env:HOME\Documents\PowerShell\'