#!/bin/bash

hander()
{
	sleep 1
}

distro=$ROS_DISTRO
TIME=$(date +%Y-%m-%d-%H-%M-%S)

LOCALI="/imu/data /odom"
VELODYNE="/velodyne_packets"
CAMERA="/usb_cam/image_raw/compressed"
REALSENSE="/camera/color/image_raw/compressed /camera/depth/image_rect_raw/compressed /camera/depth/camera_info /camera/color/camera_info"
LIDAR="/fron_laser/scan /rear_laser/scan"
GPS="/nmea_sentense"


echo $LOCALI &
echo $VELODYNE &
echo $CAMERAd &
echo $REALSENSE &
echo $LIDAR &
echo $GPS &

/opt/ros/${distro}/bin/rosbag record $LOCALI $VELODYNE $CAMERA $REALSENSE $LIDAR $GPS -O ${HOME}/bagfiles/$TIME.bag
wait
