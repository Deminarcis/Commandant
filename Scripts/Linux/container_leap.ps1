if (get-command podman) {
    Write-Output " [+] Podman installed, continuing"
}
else {
    Write-Output "This script deploys podman containers. please install that and try again"
    break
}

function setup_leap {
    podman image pull opensuse/leap:latest
    # container dir to share
    mkdir -p ~/containers/home/opensuse
    podman create --name Kali --volume ~/containers/home/opensuse:/home/opensuse --volume /tmp/.X11-unix:/tmp/.X11-unix
}
