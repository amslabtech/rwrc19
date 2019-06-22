#!/bin/bash

distro=$ROS_DISTRO
ros_ws=$ROS_WORKSPACE

source /opt/ros/${distro}/setup.bash
source ${ros_ws}/devel/setup.bash

source ${HOME}/.bashrc

gnome-terminal -e "/opt/ros/${distro}/bin/roscore" --geometry=50x12+0+0 &
sleep 3s

## node edge map
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch amsl_navigation_managers amsl_navigation_managers.launch map_path:=${ros_ws}/src/amsl_navigation_managers/amsl_navigation_managers/sample/map/sample_map3.yaml checkpoint_path:=${ros_ws}/src/amsl_navigation_managers/amsl_navigation_managers/sample/checkpoint/sample_checkpoint3.yaml --screen" --geometry=50x12+0+250 &
sleep 1s

## sensor
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun complement complement" --geometry=50x12+500+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch making_local_map tf.launch" --geometry=50x12+500+500 &
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch velodyne_height_map amsl_velodyne_heightmap.launch" --geometry=50x12+500+750 &
sleep 1s

## global planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch dijkstra_global_planner global_planner.launch --screen" --geometry=50x12+1000+0 &
sleep 1s

## localizer
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_localizer node_edge_localizer.launch --screen init_node0_id:=4 init_node1_id:=5 init_yaw:=-1.57 enable_tf:=true" --geometry=50x12+1000+250 &
sleep 1s

## localmap maker
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch making_local_map making_localmap.launch" --geometry=50x12+1000+500 &
sleep 1s

## navigator
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch node_edge_navigator node_edge_navigator.launch" --geometry=50x12+1000+750 &
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun node_edge_navigator local_goal_creator" --geometry=50x12+1500+0 &

## local planner
gnome-terminal -e "/opt/ros/${distro}/bin/roslaunch state_lattice_planner local_planner.launch" --geometry=50x12+1500+250 &
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun motion_decision motion_decision" --geometry=50x12+1500+250 &

####rviz####
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/amsl_navigation_managers/amsl_navigation_managers/config/node_edge_map.rviz" --geometry=50x12+1500+500
gnome-terminal -e "/opt/ros/${distro}/bin/rosrun rviz rviz -d ${ros_ws}/src/making_localmap/config/localmap.rviz" --geometry=50x12+1500+500
