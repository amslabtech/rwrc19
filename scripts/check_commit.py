#!/usr/bin/env python

from __future__ import print_function

import yaml
import subprocess
import os
import csv

def check_name(name):
    if name == 'Kazuki Takahashi' or name == 'taka-kazu':
        name = 'kazuki takahashi'
    elif name == 'arima':
        name = 'Jumpei Arima'
    elif name == 'HayataToshihiro':
        name = 'Hayata Toshihiro'
    elif name == 'sugiura':
        name = 'naoya-sugiura'
    return name

if __name__=='__main__':
    file_name = os.path.dirname(os.path.abspath("__file__")) + '/rwrc19.repos'
    repos = dict()
    with open(file_name, 'r') as f:
        repos = yaml.load(f)

    ws_name = os.environ['ROS_PACKAGE_PATH']
    ws_names = ws_name.split(':')
    dir_names = [ws_name for ws_name in ws_names if 'src' in ws_names ]

    # if len(dir_names) > 1:
    #    print('warning: Multple ROS workspaces are detected. ' + dir_names[0] + ' will be used')
    # elif len(dir_names) == 0:
    #     print('Error: dirname ending with "src" cannot be found in ROS_PACKAGE_PATH .')
    #     exit(-1)
    docker_dir = os.path.join(os.environ["HOME"], "docker")
    if not os.path.exists(docker_dir):
        os.mkdir(docker_dir)
    dir_name = {'ros-pkg' : dir_names[0],
                'docker'  : docker_dir}

    result={}
    names = []
    for repository_name in repos['repositories']:
        repository = repos['repositories'][repository_name]
        repo_dir_name = dir_name[repository['label']] + '/' + os.path.basename('./' + repository_name)
        try:
            os.chdir(repo_dir_name)
            output = subprocess.check_output(['git', 'shortlog', '-sn', '--no-merges', "--after='data +%Y/01/01'", "--before='date +%Y/%m/%d'"])
            output = output.decode('utf-8').splitlines()
            for r in output:
                data = r.split('\t')
                count = int(data[0])
                name = str(data[1])
                if not name in names:
                    names.append(name)
                name = check_name(name)
                if not name in result.keys():
                    result[name] = [count,0,0]
                else:
                    result[name][0] += count

            os.chdir(dir_name[repository['label']])
        except subprocess.CalledProcessError as e:
            print(e)
            exit(-1)

    for repository_name in repos['repositories']:
        repository = repos['repositories'][repository_name]
        repo_dir_name = dir_name[repository['label']] + '/' + os.path.basename('./' + repository_name)
        try:
            os.chdir(repo_dir_name)
            pipe = 'NF==3 {plus+=$1; minus+=$2} END {printf("%d, %d", plus, minus)}'
            for name in names:
                cmd = "git log --numstat --pretty='%H' --author='" + name + "' --since=2015-10-01 --until=2020-03-31 --no-merges | awk '" + pipe + "'"
                output = subprocess.check_output(cmd, shell=True)
                data = output.decode('utf-8').split(',')
                name = check_name(name)
                result[name][1] += int(data[0])
                result[name][2] += int(data[1])
            os.chdir(dir_name[repository['label']])
        except subprocess.CalledProcessError as e:
            print(e)
            exit(-1)
    print(result)
    save_row = {}
    os.chdir("../")
    output_file = os.path.join(os.path.dirname(__file__), "rwrc_commit.csv")
    print(output_file)
    with open(output_file, "w") as f:
        writer = csv.DictWriter(f, fieldnames=result.keys(), delimiter=",",quotechar='"')
        writer.writeheader()
        for i in range(len(result[list(result.keys())[0]])):
            for k, vs in result.items():
                save_row[k] = vs[i]
            writer.writerow(save_row)
