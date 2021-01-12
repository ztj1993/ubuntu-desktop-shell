#!/bin/bash

set -e

uri="https://get.daocloud.io/docker/compose/releases/download/1.27.4"
sudo curl -L "${uri}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
