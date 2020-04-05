#!/bin/bash

# Install
curl -SL https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.0/node_exporter-1.0.0-rc.0.linux-armv7.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

# Copy service
sudo cat nodeexporter.service > /etc/systemd/system/nodeexporter.service

# Start service
sudo systemctl daemon-reload \
 && sudo systemctl enable nodeexporter \
 && sudo systemctl start nodeexporter
