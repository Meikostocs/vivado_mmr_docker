#!/bin/bash

xhost +local:
docker compose up -d
docker attach vivado
