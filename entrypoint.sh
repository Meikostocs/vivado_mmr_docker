#!/bin/bash
if [ ! -d /opt/Xilinx ];then 
  /home/mmr/xsetup -b AuthTokenGen
  /home/mmr/xsetup --agree XilinxEULA,3rdPartyEULA --batch Install --config /home/mmr/install_config.txt
else
  /opt/Xilinx/Vivado/20*/bin/vivado
fi