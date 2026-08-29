function setup_container {
    container system start
}

function setup_rhel {
    setup_container
    container image pull redhat:ubi10
    # container dir to share
    mkdir -p ~/containers/home/rhel
    container create --name rhel --volume ~/containers/home/rhel:/home/rhel --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_rhel