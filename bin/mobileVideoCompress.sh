#!/bin/bash

# simple video compressor, with the aim to reduce large vids for long term storage on a NAS.

compressVid(){
  inVid="$1"
  vidDir=$(dirname "$inVid")
  vidDir="${outDir}/${vidDir}"
  echo "compressing $inVid into $vidDir"
  if ! [ -d "$vidDir" ]; then
    mkdir -p -v "$vidDir"
  fi
  vid=$(basename "$inVid")
  outVid="$vidDir/$vid.mp4"
  inDate=$(readDate "$inVid")
  
  if ! [ -f "$outVid" ]; then
    echo "preserving creation-time $inDate"
    ffmpeg -i "$inVid" $vidOpts -vcodec libx265 -crf 20 "$outVid"
    touch -d "$inDate" "$outVid" #preserve file modification time
  fi
}

readDate(){
  vidFile="$1"
  inDate=$(readMeta "$inVid" "creation_time")
  if [ -z "$inDate" ]; then #fallback if no meta-data: file mod-time
    inDate=$(stat --printf='%y' "$inVid")
  fi
  echo "$inDate"
}

readMeta(){
  vidFile="$1"
  tag="$2"
  created=$(ffprobe -v quiet -select_streams v:0 -show_entries stream_tags=$tag -of default=noprint_wrappers=1:nokey=1 "$vidFile")
  date -d "${created}" --rfc-3339=seconds
}

compressVids(){
  vidDir="$1"
  search="$2"
  cd "$vidDir"
  for mp4 in $search; do 
    compressVid "$mp4"
  done
}

# defaults
DIR="$1"
if [ -z "$1" ]; then
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi
outDir="/tmp/compressed"

# ffmpeg params
metaKeep="-movflags use_metadata_tags -map_metadata 0" #https://video.stackexchange.com/questions/23741/how-to-prevent-ffmpeg-from-dropping-metadata
deint="-vf yadif" #de-interlace https://ffmpeg.org/ffmpeg-filters.html#yadif-1
vidOpts="$metaKeep"

menu() {
  OPTIONS=( '!exit' '!search' '*.MOV' )
  echo "SELECT compressor for ${DIR}"
  select OPTION in ${OPTIONS[@]}; do
    if [ "$OPTION" == "!exit" ]; then
      break
    elif [ "$OPTION" == "*.MOV" ]; then
      vidOpts="${vidOpts} ${deint}" #de-interlace Nikon D5200 vids
      compressVids "$DIR" "**/*.MOV"
    elif [ "$OPTION" == "!search" ]; then
      read -p "Search for what?  (e.g. '*.mpg' )"
      compressVids "$DIR" "$REPLY"
      break
    fi
  done
}

menu



