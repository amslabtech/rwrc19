#!/bin/bash
distro=$ROS_DISTRO
ros_ws=$ROS_WORKSPACE

source /opt/ros/${distro}/setup.bash
source ${ros_ws}/devel/setup.bash

source ${HOME}/.bashrc

gnome-terminal -e "/opt/ros/${distro}/bin/roscore" --geometry=50x12+0+0 &
sleep 3s
gnome-terminal -e "/opt/ros/${distro}/bin/rosparam set use_sim_time true" --geometry=50x12+0+0 &

## node edge map
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch amsl_navigation_managers amsl_navigation_managers.launch map_path:=${ros_ws}/src/amsl_navigation_managers/amsl_navigation_managers/sample/map/sample_map3.yaml checkpoint_path:=${ros_ws}/src/amsl_navigation_managers/amsl_navigation_managers/sample/checkpoint/sample_checkpoint3.yaml --screen" --geometry=50x12+0+250 &

## sensor
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch velodyne_pointcloud 32e_points.launch" --geometry=50x12+500+0 &
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun complement complement" --geometry=50x12+500+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch cats robot_state.launch" --geometry=50x12+500+500 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch perfect_velodyne normal_estimation.launch" --geometry=50x12+500+750 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch velodyne_height_map amsl_velodyne_heightmap.launch" --geometry=50x12+500+750 &

## global planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch dijkstra_global_planner global_planner.launch --screen" --geometry=50x12+1000+0 &

## localization
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_localizer node_edge_localizer.launch --screen init_yaw:=-1.57 enable_tf:=true enable_odom_tf:=true" --geometry=50x12+1000+250 &

## localmap 
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch making_local_map making_localmap.launch" --geometry=50x12+1000+500 &

## intersection recognition
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch intersection_recognition intersection_recognition.launch" --geometry=50x12+1000+500 &
gnome-terminal -e "${ros_ws}/src/intersection_recognition/scripts/restart.sh rosrun intersection_recognition calc_shape_saveclouds" --geometry=50x12+1000+500 &

## navigator
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_navigator node_edge_navigator.launch --screen" --geometry=50x12+1000+750 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_navigator local_goal_creator.launch --screen" --geometry=50x12+1500+0 &

# ## local planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch state_lattice_planner local_planner.launch --screen" --geometry=50x12+1500+250 &

####rviz####
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/amsl_navigation_managers/amsl_navigation_managers/config/node_edge_map.rviz" --geometry=50x12+1500+500
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/making_localmap/config/localmap.rviz" --geometry=50x12+1500+500
