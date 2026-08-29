function setup_container {
    container system start
}

function setup_ubuntu {
    setup_container
    container image pull ubuntu:latest
    # container dir to share
    mkdir -p ~/containers/home/ubuntu
    container create --name ubuntu --volume ~/containers/home/ubuntu:/home/ubuntu --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_ubuntu