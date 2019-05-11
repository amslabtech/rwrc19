# rwrc19

[![GitHub issues](https://img.shields.io/github/issues/amslabtech/rwrc19.svg)](https://github.com/amslabtech/rwrc19/issues?q=is%3Aopen+is%3Aissue)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/amslabtech/rwrc19.svg)](https://github.com/amslabtech/rwrc19/issues?q=is%3Aissue+is%3Aclosed)

![Base System](https://github.com/amslabtech/rwrc19/blob/master/base_system.png)

## Requirements
- Ubuntu16.04
- ROS kinetic or ROS melodic

## Dependencies
### please git clone from https:://github.com/amslabtech
- amsl_navigation_managers
- node_edge_localizer
- node_edge_navigator
- intersection_recognition
- dijkstra_global_planner
- state_lattice_planner
- realsense_docker
- velodyne_height_map 

### please install ros sensor package
```
$ sudo apt-get install ros-<distro>-velodyne
$ sudo apt-get install ros-<distro>-xsens-driver
$ sudo apt-get install ros-<distro>-urg-node
```

## System
- [Local Plan](/docs/local_plan.md)
- [Global Plan](/docs/global_plan.md)
- [Localization](/docs/localization.md)
- [Recognition](/docs/recognition.md)

## How to use
### with bag data
topics of bag data
- /velodyne_packets 
- /imu/data
- /tinypower/odom

```
$ cd scripts
$ ./playing_bag.sh
$ rosbag play --clock <test>.bag
```
