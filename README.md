# rwrc19

[![GitHub issues](https://img.shields.io/github/issues/amslabtech/rwrc19.svg)](https://github.com/amslabtech/rwrc19/issues?q=is%3Aopen+is%3Aissue)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/amslabtech/rwrc19.svg)](https://github.com/amslabtech/rwrc19/issues?q=is%3Aissue+is%3Aclosed)

## Requirements
- Ubuntu 16.04 or 18.04
- ROS Kinetic or Melodic

## Dependencies
### please git clone from [amsl repository](https:://github.com/amslabtech)

|pakage | build status |
|:--- |:---|
|[amsl_navigation_managers](https://github.com/amslabtech/amsl_navigation_managers) |[![Build Status](https://travis-ci.org/amslabtech/amsl_navigation_managers.svg?branch=master)](https://travis-ci.org/amslabtech/amsl_navigation_managers) |
|[node_edge_navigator](https://github.com/amslabtech/node_edge_navigator) |[![build status](https://travis-ci.org/amslabtech/node_edge_navigator.svg?branch=master)](https://travis-ci.org/amslabtech/node_edge_navigator) |
|[node_edge_localizer](https://github.com/amslabtech/node_edge_localizer) |[![Build Status](https://travis-ci.org/amslabtech/node_edge_localizer.svg?branch=master)](https://travis-ci.org/amslabtech/node_edge_localizer) |
|[dijkstra_global_planner](https://github.com/amslabtech/dijkstra_global_path) |[![Build Status](https://travis-ci.org/amslabtech/dijkstra_global_planner.svg?branch=master)](https://travis-ci.org/amslabtech/node_edge_localizer) |
|[state_lattice_planner](https://github.com/amslabtech/state_lattice_planner) |[![Build Status](https://travis-ci.org/amslabtech/state_lattice_planner.svg?branch=master)](https://travis-ci.org/amslabtech/state_lattice_planner) |
|[making_localmap](https://github.com/amslabtech/making_localmap) |[![Build Status](https://travis-ci.org/amslabtech/making_localmap.svg?branch=master)](https://travis-ci.org/amslabtech/maiking_localmap) |
|[intersection_recognition](https://github.com/amslabtech/intersection_recognition) |[![Build Status](https://travis-ci.org/amslabtech/intersection_recognition.svg?branch=master)](https://travis-ci.org/amslabtech/intersection_recognition) |
|[motion_decision](https://github.com/amslabtech/motion_decision) |[![Build Status](https://travis-ci.org/amslabtech/motion_decision.svg?branch=master)](https://travis-ci.org/amslabtech/motion_decision)|

- [realsense_docker](https://github.com/amslabtech/realsense_docker)
- [velodyne_height_map](https://github.com/amslabtech/velodyne_height_map)
- [perfect_velodyne](https://github.com/amslabtech/perfect_velodyne)

### please install ros sensor package
```
$ sudo apt-get install ros-<distro>-velodyne
$ sudo apt-get install ros-<distro>-xsens-driver
$ sudo apt-get install ros-<distro>-urg-node
$ sudo apt-get install ros-<distro>-velodyne-description
```

## How to use
### with bag data
topics of bag data
- /velodyne_packets 
- /imu/data
- /odom

```
$ cd scripts
$ ./playing_bag.sh
$ rosbag play --clock <test>.bag
```

## System
![Base System](https://github.com/amslabtech/rwrc19/blob/master/base_system.png)
- [Local Plan](/docs/local_plan.md)
- [Global Plan](/docs/global_plan.md)
- [Localization](/docs/localization.md)
- [Recognition](/docs/recognition.md)
