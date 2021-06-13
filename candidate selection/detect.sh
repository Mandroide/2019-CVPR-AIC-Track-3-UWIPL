#!/bin/bash
#
# Use darknet with yolov3 to perform detections on directory of videos.

readonly videos="$1/*.avi $1/*.mp4"
for i in ${videos}; do
  if [ -f "${i}" ]; then
    IFS="/"
    read -ra parts <<< "$i" # Split path
    i=${parts[-1]} # Read just the filename
    mkdir "data/track4_test_bg_detection/${i:0:-3}" # Make this directory with just the filename stem
    ./darknet detector demo cfg/visdrone.data cfg/yolov3-voc.cfg yolov3-voc-25310.backup "${i}" -thresh 0.80 \
    -out "data/track4_test_bg_detection/${i:0:-3}/${i}"
  else
    echo "Not video found in directory." >&2
    exit 1
  fi
done
