#!/bin/bash
SCRIPT=${HOME}/rwrc19/scripts/

str=(
	"/front_laser"
	"/joy_node"
	"/local_planner/motion_decision"
	"/rear_laser"
	"/t_frog"
	"/usb_cam"
	"/xsens_driver"
	"/NormalEstimationForVelodyne"
	"/calc_shape_saveclouds"
	"/complement_pub_tf"
	"/detect_peak_save_pc"
	"/euclidean_cluster_distribution_filter"
	"/global_planner/dijkstra"
	"/global_planner/global_path_viz"
	"/heightmap_nodelet"
	"/intersection_matching"
	"/local_goal_creator"
	"/local_planner/state_lattice_planner"
	"/mpdrl"
	"/localmap2scan"
	"/localiztion/node_edge_localizer"
	"/making_localmap/downsample_and_transform"
	"/making_localmap/hokuyo_localmap"
	"/making_localmap/occupancygrid_integrate"
	"/making_localmap/realsense_localmap"
	"/making_localmap/scan2pcl"
	"/making_localmap/velodyne_localmap"
	"/navigation_managers/checkpoint_manager"
	"/navigation_managers/node_edge_map_manager"
	"/navigation_managers/task_manager"
	"/node_edge_navigator"
	"/normal_curvature_pc_bottom"
	"/peak_deg2rad"
	"/realsense_obstacle"
	"/robot_state_publisher"
	"/save_velodyne_normal_pc_odom"
	"/urdf_spawner"
	"/velodyne_nodelet_manager"
	"/velodyne_nodelet_manager_cloud"
	"/velodyne_nodelet_manager_driver"
	"/velodyne_nodelet_manager_laserscan"
)
echo ${str[@]}
rosnode list > "$SCRIPT".hoge.txt

trap break SIGINT

while :
do
	#clear
	rm "$SCRIPT".disp.sh
	for(( i=0;i<${#str[@]};i++))
	do

		grep -q "${str[i]}" "$SCRIPT".hoge.txt
		ret=$?
		if test ${ret} -eq 0
		then
			#echo -e "\e[32m ${str[i]} \e[m"
			echo "echo -e \"\e[36m ${str[i]} \e[m\"" >> "$SCRIPT".disp.sh
		else
			#echo -e "\e[31m ${str[i]} \e[m"
			echo "echo -e \"\e[31m ${str[i]} \e[m\"" >> "$SCRIPT".disp.sh
		fi	
	done
	
	clear

	source "$SCRIPT".disp.sh
	
	rosnode list > "$SCRIPT".hoge.txt
	sleep 0.1s
done
