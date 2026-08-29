function setup_container {
    container system start
}

function setup_leap {
    setup_container
    container image pull opensuse/leap:latest
    # container dir to share
    mkdir -p ~/containers/home/opensuse
    container create --name Kali --volume ~/containers/home/opensuse:/home/opensuse --volume /tmp/.X11-unix:/tmp/.X11-unix
}
