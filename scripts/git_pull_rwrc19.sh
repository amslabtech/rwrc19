#!/bin/bash

source ${HOME}/.bashrc

ros_ws=$ROS_WORKSPACE
cd ${ros_ws}/src/

cd amsl_navigation_managers
git pull origin master

cd ../making_localmap
git pull origin master

cd ../state_lattice_planner
git pull origin master

cd ../dijkstra_global_planner
git pull origin master

cd ../node_edge_navigator
git pull origin master

cd ../node_edge_localizer
git pull origin master

cd ../intersection_recognition
git pull origin master

cd ../motion_decision
git pull origin master

cd ../stop_line_detector
git pull origin master

cd ../CATS
git pull origin master

cd ../road_recognizer
git pull origin master

cd ../motion_planner_with_drl
git pull origin master

cd ${ros_ws}
catkin_make
