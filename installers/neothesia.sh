#!/bin/bash

. common.sh

#Neothesia
neoDir=${pianoDir}/neothesia
neoZip=/tmp/neothesia.zip
wget -v -O ${neoZip} https://github.com/PolyMeilex/Neothesia/releases/download/v0.0.9/ubuntu-artifact.zip
unzip ${neoZip} -d /tmp
sudo unzip /tmp/app.zip -d ${neoDir}
rm ${neoZip}
rm /tmp/app.zip

#Vulcan drivers
sudo apt install -y mesa-vulkan-drivers vulkan-utils

#Font
font=${fontDir}/neothesia-default.sf2
sudo wget -O ${font} https://github.com/PolyMeilex/Neothesia/raw/master/default.sf2
sudo ln -s ${font}/ ${neoDir}/default.sf2
