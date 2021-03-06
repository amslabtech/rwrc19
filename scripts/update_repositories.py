#!/usr/bin/env python

from __future__ import print_function

import yaml
import subprocess
import os

if __name__=='__main__':
    file_name = os.path.dirname(os.path.abspath("__file__")) + '/rwrc19.repos'
    repos = dict()
    with open(file_name, 'r') as f:
        repos = yaml.load(f)

    ws_name = os.environ['ROS_PACKAGE_PATH']
    ws_names = ws_name.split(':')
    dir_names = [ws_name for ws_name in ws_names if 'src' in ws_names ]

    # if len(dir_names) > 1:
    #     print('warning: Multple ROS workspaces are detected. ' + dir_names[0] + ' will be used')
    # elif len(dir_names) == 0:
    #     print('Error: dirname ending with "src" cannot be found in ROS_PACKAGE_PATH .')
    #     exit(-1)
    dir_names = [os.path.join(os.environ["HOME"], "ros_catkin_ws/src")]

    docker_dir = os.path.join(os.environ["HOME"],"docker")
    if not os.path.exists(docker_dir):
        os.mkdir(docker_dir)
    dir_name = {'ros-pkg' : dir_names[0],
                'docker'  : docker_dir}

    for repository_name in repos['repositories']:
        repository = repos['repositories'][repository_name]
        print(repository)
        if repository['type'] == 'git':
            repo_dir_name = dir_name[repository['label']] + '/' + os.path.basename('./' + repository_name)
            if not os.path.exists(repo_dir_name):
                print('git', 'clone', '-b', repository['version'], repository['url'], '--depth', '1', repo_dir_name)
                try:
                    result = subprocess.check_output(['git', 'clone', '-b', repository['version'], repository['url'], '--depth', '1', repo_dir_name])
                except subprocess.CalledProcessError as e:
                    print(e)
                    exit(-1)
            else:
                print('cd', repo_dir_name, '&&', 'git', 'pull', 'origin', repository['version'])
                try:
                    os.chdir(repo_dir_name)
                    result = subprocess.check_output(['git', 'pull', 'origin', repository['version']])
                    os.chdir(dir_name[repository['label']])
                except subprocess.CalledProcessError as e:
                    print(e)
                    exit(-1)
            print('')
    print('repositories have been successfully updated')
