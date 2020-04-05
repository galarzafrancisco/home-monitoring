#!/bin/bash

# Install
curl -SL https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.0/node_exporter-1.0.0-rc.0.darwin-amd64.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1
rm node_exporter.tar.gz

# Copy service
sudo cp local.node_exporter.plist /Library/LaunchAgents/local.node_exporter.plist

# Start service
sudo launchctl load /Library/LaunchAgents/local.node_exporter.plist
