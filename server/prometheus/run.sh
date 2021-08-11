#!/bin/bash

prometheus_home=/home/prometheus/toolbox/prometheus

sudo mkdir -p $prometheus_home
cp prometheus.yml $prometheus_home

sudo docker run \
    -d \
    --name prometheus \
    --restart always \
    -p 9090:9090 \
    -v $prometheus_home:/etc/prometheus \
    prom/prometheus
