#!/bin/bash

set -e

# check argument
if [[ -z $1 || ! $1 =~ [[:digit:]]x[[:digit:]] ]]; then
  echo "ERROR: This script requires 1 argument, \"input dimension\" of the YOLO model."
  echo "The input dimension should be {width}x{height} such as 608x608 or 416x256.".
  exit 1
fi

echo "** Install requirements"
# "gdown" is for downloading files from GoogleDrive
pip3 install --user gdown > /dev/null

if [[ ! -f darknet/yolov4.conv.137 ]]; then
  pushd darknet > /dev/null
  #echo "** Download pre-trained yolov4 weights"
  #python3 -m gdown.cli https://drive.google.com/uc?id=1BMLTVMYQL3hpbW6Mf7WCowS7sTOEB9rJ
  #echo "** Download pre-trained yolov4-tiny weights"
  #python3 -m gdown.cli https://drive.google.com/uc?id=18z6ssnlWAgUbkgtAEO8DfDEiMlgLNIa3
  echo "** Download pre-trained yolov4-csp weights
  python3 -m gdown.cli https://drive.google.com/uc?id=1kHmyzG33Wp3_RSJ2gD_wu-_fa1kQJ1Gt
  popd > /dev/null
fi
echo "** Done."
