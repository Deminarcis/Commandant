if (get-command podman) {
    Write-Output " [+] Podman installed, continuing"
}
else {
    Write-Output "This script deploys podman containers. please install that and try again"
    break
}
function setup_ubuntu {
    podman image pull ubuntu:latest
    # container dir to share
    mkdir -p ~/containers/home/ubuntu
    podman create --name ubuntu --volume ~/containers/home/ubuntu:/home/ubuntu --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_ubuntu