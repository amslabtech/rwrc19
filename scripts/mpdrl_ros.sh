#!/bin/bash

source ${HOME}/.bashrc

distro=$ROS_DISTRO
ros_ws=$ROS_WORKSPACE

source /opt/ros/${distro}/setup.bash
source ${ros_ws}/devel/setup.bash

/opt/ros/${distro}/bin/rosnode kill /local_planner/state_lattice_planner && \\
${HOME}/docker/mpdrl_ros/run_docker.sh roslaunch mpdrl_ros local_planner_with_localmap.launch
