FROM python:3.5

WORKDIR /tmp
RUN apt-get update && apt-get install -y zip vim libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils qt5-default checkinstall libxine2-dev

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Downloading OpenCV
RUN wget -O OpenCV-3.2.0.zip http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/3.2.0/opencv-3.2.0.zip/download

# Installing OpenCV
RUN unzip OpenCV-3.2.0.zip
RUN mkdir /tmp/opencv-3.2.0/build
WORKDIR /tmp/opencv-3.2.0/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_1394=OFF .. # -D WITH_IPP=OFF
RUN make -j2
RUN checkinstall
RUN sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
RUN ldconfig
# echo "OpenCV" $version "ready to be used"

RUN useradd -ms /bin/bash cv_user
USER cv_user
WORKDIR /home/cv_user
ADD .bashrc .bashrc

