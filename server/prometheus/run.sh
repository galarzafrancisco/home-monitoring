#!/bin/bash

prometheus_home=/home/franciscogalarza/toolbox/prometheus

sudo mkdir -p $prometheus_home
mkdir $prometheus_home/prometheus
cp prometheus.yml $prometheus_home

sudo docker run \
    -d \
    --name prometheus \
    --restart always \
    -p 9090:9090 \
    -v $prometheus_home:/etc/prometheus \
    -v $prometheus_home/prometheus:/prometheus \
    prom/prometheus
