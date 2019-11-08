#!/bin/bash

ssh -t -t wolf <<EOF

sleep 1s

/home/amsl/docker/realsense_docker/run_with_nvidia_docker.sh
