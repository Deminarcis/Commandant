function setup_container {
    container system start
}

function setup_blackarch {
    setup_container
    container image pull blackarch/blackarch:latest
    # container dir to share
    mkdir -p ~/containers/home/blackarch
    container create --name blackarch --volume ~/containers/home/blackarch:/home/blackarch --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_blackarch