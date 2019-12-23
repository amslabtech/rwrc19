# rwrc19

[![GitHub issues](https://img.shields.io/github/issues/amslabtech/rwrc19.svg)](https://github.com/amslabtech/rwrc19/issues?q=is%3Aopen+is%3Aissue)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/amslabtech/rwrc19.svg)](https://github.com/amslabtech/rwrc19/issues?q=is%3Aissue+is%3Aclosed)

## Requirements
- Ubuntu 16.04 or 18.04
- ROS Kinetic or Melodic

## Dependencies

```
$ cd scripts
$ ./update_repositories.py
```

|pakage | build status |
|:--- |:---|
|[amsl_navigation_managers](https://github.com/amslabtech/amsl_navigation_managers) |[![Build Status](https://travis-ci.org/amslabtech/amsl_navigation_managers.svg?branch=master)](https://travis-ci.org/amslabtech/amsl_navigation_managers) |
|[node_edge_navigator](https://github.com/amslabtech/node_edge_navigator) |[![build status](https://travis-ci.org/amslabtech/node_edge_navigator.svg?branch=master)](https://travis-ci.org/amslabtech/node_edge_navigator) |
|[node_edge_localizer](https://github.com/amslabtech/node_edge_localizer) |[![Build Status](https://travis-ci.org/amslabtech/node_edge_localizer.svg?branch=master)](https://travis-ci.org/amslabtech/node_edge_localizer) |
|[dijkstra_global_planner](https://github.com/amslabtech/dijkstra_global_planner) |[![Build Status](https://travis-ci.org/amslabtech/dijkstra_global_planner.svg?branch=master)](https://travis-ci.org/amslabtech/node_edge_localizer) |
|[state_lattice_planner](https://github.com/amslabtech/state_lattice_planner) |[![Build Status](https://travis-ci.org/amslabtech/state_lattice_planner.svg?branch=master)](https://travis-ci.org/amslabtech/state_lattice_planner) |
|[localmap_ceater](https://github.com/amslabtech/localmap_ceater) |[![Build Status](https://travis-ci.org/amslabtech/localmap_ceater.svg?branch=master)](https://travis-ci.org/amslabtech/localmap_creater) |
|[road_recognizer](https://github.com/amslabtech/road_recognizer) |[![Build Status](https://travis-ci.org/amslabtech/road_recognizer.svg?branch=master)](https://travis-ci.org/amslabtech/road_recognizer) |
|[motion_decision](https://github.com/amslabtech/motion_decision) |[![Build Status](https://travis-ci.org/amslabtech/motion_decision.svg?branch=master)](https://travis-ci.org/amslabtech/motion_decision)|
|[complement](https://github.com/amslabtech/complement) |[![Build Status](https://travis-ci.org/amslabtech/complement.svg?branch=master)](https://travis-ci.org/amslabtech/complement)|
|[dynamic_cloud_detector](https://github.com/amslabtech/dynamic_cloud_detector) |[![Build Status](https://travis-ci.org/amslabtech/dynamic_cloud_detector.svg?branch=master)](https://travis-ci.org/amslabtech/dynamic_cloud_detector)|
|[velodyne_height_map](https://github.com/amslabtech/velodyne_height_map) |[![Build Status](https://travis-ci.org/amslabtech/velodyne_height_map.svg?branch=master)](https://travis-ci.org/amslabtech/velodyne_height_map)|
|[odom_gnss_ekf](https://github.com/amslabtech/odom_gnss_ekf) |[![Build Status](https://travis-ci.org/amslabtech/odom_gnss_ekf.svg?branch=master)](https://travis-ci.org/amslabtech/odom_gnss_ekf)|
|[stop_line_detector](https://github.com/amslabtech/stop_line_detector) |[![Build Status](https://travis-ci.org/amslabtech/stop_line_detector.svg?branch=master)](https://travis-ci.org/amslabtech/stop_line_detector)|
|[road_closed_sign_detector](https://github.com/amslabtech/road_closed_sign_detector) |[![Build Status](https://travis-ci.org/amslabtech/road_closed_sign_detector.svg?branch=master)](https://travis-ci.org/amslabtech/road_closed_sign_detector)|
|[perfect_velodyne](https://github.com/amslabtech/perfect_velodyne) |[![Build Status](https://travis-ci.org/amslabtech/perfect_velodyne.svg?branch=master)](https://travis-ci.org/amslabtech/perfect_velodyne)|
|[gps_docker](https://github.com/amslabtech/gps_docker) |[![Build Status](https://travis-ci.org/amslabtech/gps_docker.svg?branch=master)](https://travis-ci.org/amslabtech/gps_docker)|
|[realsense_docker](https://github.com/amslabtech/realsense_docker) |[![Build Status](https://travis-ci.org/amslabtech/realsense_docker.svg?branch=master)](https://travis-ci.org/amslabtech/realsense_docker)|
|[mpdrl_ros](https://github.com/amslabtech/mpdrl_ros) |[![Build Status](https://travis-ci.org/amslabtech/mpdrl_ros.svg?branch=master)](https://travis-ci.org/amslabtech/mpdrl_ros)|

### please install ros sensor package
```
$ sudo apt-get install ros-<distro>-velodyne
$ sudo apt-get install ros-<distro>-xsens-driver
$ sudo apt-get install ros-<distro>-urg-node
$ sudo apt-get install ros-<distro>-velodyne-description
```

## System
![Base System](https://github.com/amslabtech/rwrc19/blob/master/base_system.png)
- [Local Plan](/docs/local_plan.md)
- [Global Plan](/docs/global_plan.md)
- [Localization](/docs/localization.md)
- [Recognition](/docs/recognition.md)
