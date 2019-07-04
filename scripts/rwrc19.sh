#!/bin/bash

source ${HOME}/.bashrc

distro=$ROS_DISTRO
ros_ws=$ROS_WORKSPACE

source /opt/ros/${distro}/setup.bash
source ${ros_ws}/devel/setup.bash

gnome-terminal -e "/opt/ros/${distro}/bin/roscore" --geometry=50x12+0+0 &
sleep 3s

## node edge map
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch amsl_navigation_managers amsl_navigation_managers.launch map_path:=${HOME}/rwrc19/map/tsukuba.yaml checkpoint_path:=${HOME}/rwrc19/checkpoint/tsukuba.yaml --screen" --geometry=50x12+0+250 &
sleep 1s

## sensor
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun complement complement" --geometry=50x12+500+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch velodyne_height_map amsl_velodyne_heightmap.launch" --geometry=50x12+500+750 &
sleep 1s

## global planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch dijkstra_global_planner global_planner.launch --screen" --geometry=50x12+1000+0 &
sleep 1s

## localizer
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_localizer node_edge_localizer.launch --screen init_node0_id:=0 init_node1_id:=1 init_yaw:=-3.14 enable_tf:=true" --geometry=50x12+1000+250 &
sleep 1s

## localmap maker
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch making_local_map making_localmap.launch --screen" --geometry=50x12+1000+500 &
sleep 1s

## navigator
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_navigator node_edge_navigator.launch --screen" --geometry=50x12+1000+750 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_navigator local_goal_creator.launch --screen" --geometry=50x12+1500+0 &

## local planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch motion_planner_with_drl local_planner.launch --screen" --geometry=50x12+1500+250 &
# gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch state_lattice_planner local_planner.launch --screen" --geometry=50x12+1500+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch motion_decision motion_decision.launch --screen" --geometry=50x12+1500+250 &

####rviz####
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/amsl_navigation_managers/amsl_navigation_managers/config/node_edge_map.rviz" --geometry=50x12+1500+500
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/making_localmap/config/localmap.rviz" --geometry=50x12+1500+500
