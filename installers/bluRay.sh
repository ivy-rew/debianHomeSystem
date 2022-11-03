#!/bin/bash

#blu-ray support for VLC

install(){
  keyDir="$HOME/.config/aacs"
  mkdir -p -v ${keyDir}
  curl -o ${keyDir}/keydb-eng.zip http://fvonline-db.bplaced.net/export/keydb_eng.zip
  unzip keydb-eng.zip
  # rename to KEYDB.cfg ?!

  sudo apt install libaacs0
}

backup() {
  title=$1 #eg 1
  target=$2
  source="dev/sr0"
  if ! [ -z "$3" ]; then
    source="$3"
  fi
  opts=""
  opts="${opts} --no-bluray-menu"
  opts="${opts} --no-ts-trust-pcr" # https://gist.github.com/windyinsc/71b10a7f6b0f9b603af913ad01474539
  opts="${opts} --ts-seek-percent"
  #opts="${opts} --no-ts-cc-check"
  cvlc ${opts} "bluray://${source}#${title}" --sout "#std{access=file,mux=ts,dst=${target}}" vlc://quit
}

# backup 1 /tmp/backups/mydisk.mpg
