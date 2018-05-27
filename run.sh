XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
TAG=opencv:latest-env

touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

nvidia-docker run -it \
       --volume=$XSOCK:$XSOCK:rw \
       --volume=$XAUTH:$XAUTH:rw \
       --volume=$HOME:/home/opencv-user:rw \
       --env="XAUTHORITY=${XAUTH}" \
       --env="DISPLAY" \
       --env="QT_X11_NO_MITSHM=1" \
       --user=1000 \
       $TAG \
       bash
