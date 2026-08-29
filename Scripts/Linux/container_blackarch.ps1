if (get-command podman) {
    Write-Output " [+] Podman installed, continuing"
} else {
    Write-Output "This script deploys podman containers. please install that and try again"
    break
}

function setup_blackarch {
    podman image pull blackarchlinux/blackarch:latest
    # container dir to share
    mkdir -p ~/containers/home/blackarch
    podman create --name blackarch --volume ~/containers/home/blackarch:/home/blackarch --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_blackarch