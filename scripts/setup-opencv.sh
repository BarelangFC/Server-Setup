sudo apt update && sudo apt upgrade -y
sudo apt install -y \
	build-essential cmake git pkg-config \
	libgtk-3-dev libavcodec-dev libavformat-dev \
	libswscale-dev libv4l-dev libxvidcore-dev \
	libx264-dev libjpeg-dev libpng-dev \
	libtiff-dev gfortran openexr libatlas-base-dev \
	python3-dev python3-numpy libtbb2 libtbb-dev \
	libdc1394-22-dev libopenexr-dev \
	libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev \
	libavcodec-dev libavformat-dev libswscale-dev \
	libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev \
	libgtk-3-dev libpng-dev libjpeg-dev libopenexr-dev \
	libtiff-dev libwebp-dev libavresample zlib1g
mkdir opencv && cd opencv
wget https://github.com/opencv/opencv/archive/4.6.0.zip
unzip 4.6.0.zip
wget https://github.com/opencv/opencv_contrib/archive/refs/tags/4.6.0.zip
cd opencv-4.6.0
mkdir build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D WITH_CUDA=ON \
	-D WITH_CUDNN=ON \
	-D WITH_CUBLAS=ON \
	-D WITH_TBB=ON \
	-D OPENCV_DNN_CUDA=ON \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D CUDA_ARCH_BIN=6.1 \
	-D OPENCV_EXTRA_MODULES_PATH=/home/barelangfc/opencv/opencv_contrib-4.6.0/modules \
	-D BUILD_EXAMPLES=OFF \
	-D HAVE_opencv_python3=ON ..
make -j8
sudo make install && sudo ldconfig
sudo ln -s /usr/local/lib/python3.8/site-packages/cv2 /usr/local/lib/python3.8/dist-packages/cv2

