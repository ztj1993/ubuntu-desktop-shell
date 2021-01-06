#!/bin/bash

set -e

# 替换源为阿里云
search="[a-z0-9\.]*.ubuntu.com"
replace="mirrors.aliyun.com"
sudo sed -i "s/${search}/${replace}/g" /etc/apt/sources.list

# 更新系统
sudo apt-get -y update
sudo apt-get -y upgrade
