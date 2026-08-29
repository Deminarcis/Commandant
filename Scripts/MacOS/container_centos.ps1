function setup_container {
    container system start
}

function setup_centos {
    setup_container
    container image pull quay.io/centos/centos:stream10
    # container dir to share
    mkdir -p ~/containers/home/centos
    container create --name centos --volume ~/containers/home/centos:/home/centos --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_centos