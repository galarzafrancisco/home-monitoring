#!/bin/bash

docker run \
    -d \
    --name prometheus \
    --restart always \
    -p 9090:9090 \
    -v /home/franciscogalarza/projects/prometheus:/etc/prometheus \
    prom/prometheus
