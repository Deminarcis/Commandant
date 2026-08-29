if (get-command podman) {
    Write-Output " [+] Podman installed, continuing"
}
else {
    Write-Output "This script deploys podman containers. please install that and try again"
    break
}
function setup_rhel {
    podman image pull redhat:ubi10
    # container dir to share
    mkdir -p ~/containers/home/rhel
    podman create --name rhel --volume ~/containers/home/rhel:/home/rhel --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_rhel