function setup_container {
    container system start
}

function setup_fedora {
    setup_container
    container image pull fedora:latest
    # container dir to share
    mkdir -p ~/containers/home/fedora
    container create --name fedora --volume ~/containers/home/fedora:/home/fedora --volume /tmp/.X11-unix:/tmp/.X11-unix
}