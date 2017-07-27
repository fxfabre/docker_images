# access control disabled, clients can connect from any host : allow graphic access 
xhost +

# Run container
sudo docker run --rm -e DISPLAY=$DISPLAY -u cv_user -v /tmp/.X11-unix:/tmp/.X11-unix:ro -it opencv_python:3.5 /bin/bash



