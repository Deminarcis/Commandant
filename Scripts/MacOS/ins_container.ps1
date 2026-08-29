if (get-command brew) {
    Write-Output " [+] Brew installed, continuing"
}
else {
    Write-Output "This script relies on brew. please install that and try again"
    break
}

function ins_container {
    brew install --cask container
}
ins_container