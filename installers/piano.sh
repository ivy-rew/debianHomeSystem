#!/bin/bash
pianoDir=/opt/piano
sudo mkdir ${pianoDir}
cd ${pianoDir}

#LMMS
sudo wget https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage
sudo cp lmms.sh.template ${pianoDir}

#PianoBooster
sudo wget https://github.com/pianobooster/PianoBooster/releases/download/v1.0.0/PianoBooster-1.0.0-x86_64.AppImage

#Common
sudo wget https://github.com/pianobooster/fluid-soundfont/releases/download/v3.1/FluidR3_GM.sf2
