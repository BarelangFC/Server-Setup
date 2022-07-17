sudo apt update && sudo apt upgrade -y
wget https://github.com/AlexeyAB/darknet/archive/refs/tags/yolov4.zip
unzip yolov4.zip
cd darknet-yolov4 && mkdir build_release
cd build_release && cmake ..

