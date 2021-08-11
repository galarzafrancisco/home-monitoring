#!/bin/bash

# Definitions
grafana_home=/home/$(whoami)/toolbox/grafana
version=grafana-6.7.2.linux-armv7

# Download binary
sudo mkdir -p $grafana_home
curl -SL https://dl.grafana.com/oss/release/$version.tar.gz > grafana.tar.gz
sudo tar -xvf grafana.tar.gz -C $grafana_home --strip-components=1
sudo chown -R $(whoami) $grafana_home
rm grafana.tar.gz

# Make start script
echo """#!/bin/bash
$grafana_home/bin/grafana-server -homepath $grafana_home""" > start.sh
chmod +x start.sh

# Copy the start script
cp start.sh $grafana_home

# Make the service definition file
echo """[Unit]
Description=Grafana

[Service]
TimeoutStartSec=0
ExecStart=$grafana_home/start.sh

[Install]
WantedBy=multi-user.target""" > grafana.service

# Copy service definition file
sudo cp grafana.service /etc/systemd/system/grafana.service

# Start service
sudo systemctl daemon-reload \
 && sudo systemctl enable grafana \
 && sudo systemctl start grafana
