#!/bin/bash

set -e

# 替换源为阿里云
search="http://[a-z0-9\.]*/ubuntu/"
replace="http://mirrors.163.com/ubuntu/"
sudo sed -i "s/${search}/${replace}/g" /etc/apt/sources.list

# 更新系统
sudo apt-get -y update
sudo apt-get -y upgrade
