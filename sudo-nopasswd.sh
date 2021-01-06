#!/bin/bash

set -e

# 用户免密码
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${USER}
