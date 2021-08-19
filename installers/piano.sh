#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/common.sh

#LMMS
wget https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage
sudo cp lmms.sh.template ${pianoDir}
sudo mv -v lmms*.AppImage ${pianoDir}

#PianoBooster
wget https://github.com/pianobooster/PianoBooster/releases/download/v1.0.0/PianoBooster-1.0.0-x86_64.AppImage
sudo mv -v PianoBooster*.AppImage ${pianoDir}

#Common
wget https://github.com/pianobooster/fluid-soundfont/releases/download/v3.1/FluidR3_GM.sf2
sudo mv -v FluidR3_GM.sf2 ${fontDir}

#Composites
$DIR/neothesia.sh