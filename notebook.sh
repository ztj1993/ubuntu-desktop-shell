#!/bin/bash

# 关闭盖子不休眠
sudo sed -i 's/^#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
