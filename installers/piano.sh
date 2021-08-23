#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/common.sh



#PianoBooster
wget https://github.com/pianobooster/PianoBooster/releases/download/v1.0.0/PianoBooster-1.0.0-x86_64.AppImage
chmod +x PianoBooster*.AppImage
sudo mv -v -f PianoBooster*.AppImage ${pianoDir}

#Common
wget https://github.com/pianobooster/fluid-soundfont/releases/download/v3.1/FluidR3_GM.sf2
sudo mv -v -f FluidR3_GM.sf2 ${fontDir}

#Composites
$DIR/lmms.sh
$DIR/neothesia.sh
