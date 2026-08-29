if (get-command podman) {
    Write-Output " [+] Podman installed, continuing"
}
else {
    Write-Output "This script deploys podman containers. please install that and try again"
    break
}
function setup_kali {
    podman image pull kalilinux/kali-rolling:latest
    # container dir to share
    mkdir -p ~/containers/home/kali
    podman create --name kali --volume ~/containers/home/kali:/home/kali --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_kali