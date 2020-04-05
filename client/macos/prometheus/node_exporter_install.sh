#!/bin/bash

# Install
curl -SL https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.0/node_exporter-1.0.0-rc.0.darwin-amd64.tar.gz > node_exporter.tar.gz && \
sudo tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

# Copy service
sudo cp nodeexporter.plist /Library/LaunchAgents/nodeexporter.plist

# Start service
sudo launchctl load /Library/LaunchAgents/nodeexporter.plist
