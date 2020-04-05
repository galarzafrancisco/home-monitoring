#!/bin/bash

node_exporter-1.0.0-rc.0.linux-armv7

# Install
curl -SL https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.0/$version.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1
sudo rm node_exporter.tar.gz

# Copy service
sudo cp node_exporter.service /etc/systemd/system/node_exporter.service

# Start service
sudo systemctl daemon-reload \
 && sudo systemctl enable node_exporter \
 && sudo systemctl start node_exporter
