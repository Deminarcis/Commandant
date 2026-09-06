function setup_centos {
    podman image pull quay.io/centos/centos:stream10
    # container dir to share
    mkdir -p ~/containers/home/centos
    podman create --name centos --volume ~/containers/home/centos:/home/centos --volume /tmp/.X11-unix:/tmp/.X11-unix
}

if (get-command podman) {
    Write-Output " [+] Podman installed, continuing"
    setup_centos
    Write-Output "[+] Done!"
}
else {
    Write-Output "This script deploys podman containers. please install that and try again"
    break
}
