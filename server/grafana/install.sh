#!/bin/bash

# Install
sudo mkdir /opt/grafana
curl -SL https://dl.grafana.com/oss/release/grafana-6.7.2.linux-armv7.tar.gz > grafana.tar.gz
sudo tar -xvf grafana.tar.gz -C /opt/grafana --strip-components=1
rm grafana.tar.gz

# Copy service
sudo cp grafana.service /etc/systemd/system/grafana.service

# Start service
sudo systemctl daemon-reload \
 && sudo systemctl enable grafana \
 && sudo systemctl start grafana
