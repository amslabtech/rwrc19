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
REALSENSE="/camera/color/image_raw/compressed /camera/depth/image_rect_raw/compressedDepth /camera/depth/camera_info /camera/color/camera_info"
LIDAR="/front_laser/scan /rear_laser/scan /first /last"
GPS="/fix /odom/gps /nmea_sentence /time_reference"
CMD_VEL="/t_frog/cmd_vel"

echo $LOCALI &
echo $VELODYNE &
echo $CAMERA &
echo $REALSENSE &
echo $LIDAR &
echo $GPS &
echo $CMD_VEL &

/opt/ros/${distro}/bin/rosbag record $LOCALI $VELODYNE $CAMERA $REALSENSE $LIDAR $GPS $CMD_VEL -O ${HOME}/bagfiles/$TIME.bag
wait
