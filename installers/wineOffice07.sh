#!/bin/bash

# https://linux.how2shout.com/how-to-install-microsoft-office-2007-on-ubuntu-20-04-lts/

sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key\
 https://dl.winehq.org/wine-builds/winehq.key

ubu="noble"
sudo wget -NP /etc/apt/sources.list.d/\
 https://dl.winehq.org/wine-builds/ubuntu/dists/${ubu}/winehq-noble.sources

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install --install-recommends winehq-stable

echo "==manual step==:: ready to run ms-office installer"

