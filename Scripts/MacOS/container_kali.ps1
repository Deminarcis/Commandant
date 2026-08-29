function setup_container {
    container system start
}

function setup_kali {
    setup_container
    container image pull kalilinux/kali-rolling:latest
    # container dir to share
    mkdir -p ~/containers/home/kali
    container create --name kali --volume ~/containers/home/kali:/home/kali --volume /tmp/.X11-unix:/tmp/.X11-unix
}
setup_kali