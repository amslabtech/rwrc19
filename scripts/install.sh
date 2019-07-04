#!/bin/bash

source ${HOME}/.bashrc

ros_ws=$ROS_WORKSPACE
echo ${ros_ws}

cd ${ros_ws}/src/

git clone https://github.com/amslabtech/amsl_navigation_managers
git clone https://github.com/amslabtech/making_localmap
git clone https://github.com/amslabtech/state_lattice_planner
git clone https://github.com/amslabtech/dijkstra_global_planner
git clone https://github.com/amslabtech/node_edge_navigator
git clone https://github.com/amslabtech/node_edge_localizer
git clone https://github.com/amslabtech/intersection_recognition
git clone https://github.com/amslabtech/motion_decision
git clone https://github.com/amslabtech/stop_line_detector
git clone https://github.com/amslabtech/CATS
git clone https://github.com/amslabtech/road_recognizer
git clone https://github.com/amslabtech/velodyne_height_map
git clone https://github.com/amslabtech/perfect_velodyne
git clone https://github.com/Jumpei-Arima/motion_planner_with_drl

cd ${ros_ws}
catkin_make

cd ${HOME}
git clone https://github.com/amslabtech/realsense_docker
