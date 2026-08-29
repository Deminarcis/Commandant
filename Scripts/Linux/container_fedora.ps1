if (get-command podman) {
    Write-Output " [+] Podman installed, continuing"
}
else {
    Write-Output "This script deploys podman containers. please install that and try again"
    break
}
function setup_fedora {
    podman image pull fedora:latest
    # container dir to share
    mkdir -p ~/containers/home/fedora
    podman create --name fedora --volume ~/containers/home/fedora:/home/fedora --volume /tmp/.X11-unix:/tmp/.X11-unix
}