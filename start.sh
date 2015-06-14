if [ -f /etc/redhat-release ]; then
        sudo setenforce 0
fi
docker build -t intelligj .
docker run --net=host -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/workspaces:/workspace -v ~/.idea:/idea intelligj
