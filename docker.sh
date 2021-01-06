#!/bin/bash

# 清理遗留
sudo apt-get remove -y docker > /dev/null 2>&1
sudo apt-get remove -y docker-engine > /dev/null 2>&1
sudo apt-get remove -y docker.io > /dev/null 2>&1
sudo apt-get remove -y containerd > /dev/null 2>&1
sudo apt-get remove -y runc > /dev/null 2>&1

set -e

# 前置安装
sudo apt-get install -y curl
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo apt-get install -y gnupg-agent
sudo apt-get install -y software-properties-common

# 使用阿里云源
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
repo=http://mirrors.aliyun.com/docker-ce/linux/ubuntu
sudo add-apt-repository "deb [arch=amd64] ${repo} $(lsb_release -cs) stable"
sudo apt-get -y update

# 安装软件
sudo apt-get install -y docker-ce
sudo apt-get install -y docker-ce-cli
sudo apt-get install -y containerd.io

# 添加用户
sudo usermod -aG docker ${USER}

# 配置文件
mkdir -p /etc/docker
echo '{
	"hosts": [
		"tcp://0.0.0.0:2375",
		"unix:///var/run/docker.sock"
	],
	"registry-mirror": [
		"https://dufe2rks.mirror.aliyuncs.com",
		"https://reg-mirror.qiniu.com"
	]
}' | sudo tee /etc/docker/daemon.json

echo "docker installed"
