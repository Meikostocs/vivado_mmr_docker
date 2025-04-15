#!/bin/bash



if [ ! -d ./vivado ]; then
  echo "[+] Created vivado directory"
  mkdir vivado
fi

if [ ! -d ./installer ]; then
  mkdir installer
  cp install_config.txt installer/
  echo "[+] Created installer directory; Put Vivado installer here"
fi


cat <<EOF >docker-compose.yaml

services:
  pc:
    container_name: vivado
    build: 
      context: .
      args:
        SETUP_FILE: installer/vivado2023_2.bin
    environment:
      - DISPLAY=${DISPLAY}
      - XAUTHORITY=/tmp/.docker.xauth
    volumes:
      - $(pwd)/vivado:/opt:rw
      - /tmp/.X11-unix:/tmp/.X11-unix:rw
      - /dev:/dev               
      - /run/udev:/run/udev          
      - ${XAUTHORITY:-/tmp/.docker.xauth}:/tmp/.docker.xauth
    privileged: true                 
    network_mode: "host"           
    ipc: host
    stdin_open: true
    tty: true

EOF

echo "[+] Generated docker-compose"
