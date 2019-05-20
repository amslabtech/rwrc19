#!/bin/bash

distro=$ROS_DISTRO
ros_ws=$ROS_WORKSPACE

source /opt/ros/${distro}/setup.bash
source ${ros_ws}/devel/setup.bash

source $home/.bashrc


gnome-terminal -e "/opt/ros/${distro}/bin/roscore" --geometry=50x12+0+0 &
sleep 3s
gnome-terminal -e "/opt/ros/${distro}/bin/rosparam set use_sim_time true" --geometry=50x12+0+0 &

## node edge map
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch amsl_navigation_managers amsl_navigation_managers.launch map_path:=${ros_ws}/src/rwrc19/amsl_navigation_managers/amsl_navigation_managers/sample/map/sample_map3.yaml checkpoint_path:=${ros_ws}/src/rwrc19/amsl_navigation_managers/amsl_navigation_managers/sample/checkpoint/sample_checkpoint3.yaml --screen" --geometry=50x12+0+250 &
sleep 1s

## sensor
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch velodyne_pointcloud 32e_points.launch" --geometry=50x12+500+0 &
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun complement complement" --geometry=50x12+500+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch making_local_map tf.launch" --geometry=50x12+500+500 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch velodyne_height_map amsl_velodyne_heightmap.launch" --geometry=50x12+500+750 &
sleep 3s

## global planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch dijkstra_global_planner global_planner.launch --screen" --geometry=50x12+1000+0 &
sleep 3s

## localizer
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_localizer node_edge_localizer.launch --screen init_yaw:=-1.57 enable_tf:=true enable_odom_tf:=true" --geometry=50x12+1000+250 &
sleep 3s

## localmap maker
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch making_local_map making_localmap.launch" --geometry=50x12+1000+500 &
sleep 3s

## navigator
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_navigator node_edge_navigator.launch" --geometry=50x12+1000+750 &
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun node_edge_navigator local_goal_creator" --geometry=50x12+1500+0 &

## local planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch state_lattice_planner local_planner.launch" --geometry=50x12+1500+250 &

####rviz####
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/rwrc19/amsl_navigation_managers/amsl_navigation_managers/config/node_edge_map.rviz" --geometry=50x12+1500+500
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/rwrc19/making_localmap/config/localmap.rviz" --geometry=50x12+1500+500
