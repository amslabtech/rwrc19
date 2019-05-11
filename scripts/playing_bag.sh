#!/bin/bash

distro=$ROS_DISTRO
source /opt/ros/${distro}/setup.bash
source /home/amsl/ros_catkin_ws/devel/setup.bash

source /home/amsl/.bashrc


gnome-terminal -e "/opt/ros/${distro}/bin/roscore" --geometry=50x12+0+0 &
sleep 3s
gnome-terminal -e "/opt/ros/${distro}/bin/rosparam set use_sim_time true" --geometry=50x12+0+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch amsl_navigation_managers amsl_navigation_managers.launch --screen" --geometry=50x12+0+500 &
sleep 1s
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch dijkstra_global_planner global_planner.launch --screen" --geometry=50x12+0+750 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch velodyne_pointcloud 32e_points.launch" --geometry=50x12+500+0 &
sleep 3s
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun complement complement /odom:=/tinypower/odom" --geometry=50x12+500+250 &
sleep 3s
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun tf static_transform_publisher 0 0 0 0 0 0 /base_link /velodyne 100" --geometry=50x12+1000+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_localizer node_edge_localizer.launch --screen init_yaw:=-1.57 enable_tf:=true enable_odom_tf:=true" --geometry=50x12+1000+500 &

####rviz####
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d /home/amsl/ros_catkin_ws/src/rwrc19/node_edge_localizer/config/node_edge_map.rviz" --geometry=50x12+1000+750
