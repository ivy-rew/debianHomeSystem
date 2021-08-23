#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/common.sh

#LMMS
mkdir lmms
cd lmms
  wget https://lmms.io/img/logo_lg.png
  wget https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage
  chmod +x lmms*.AppImage
cd ..
cp -v lmms.sh.template lmms/lmms.sh
sudo mv -v -f lmms ${pianoDir}/lmms

rm -rf lmms