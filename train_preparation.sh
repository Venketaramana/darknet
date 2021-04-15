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
  #python3 -m gdown.cli https://drive.google.com/uc?id=1JKF-bdIklxOOVy-2Cr5qdvjgGpmGfcbp
  #echo "** Download pre-trained yolov4_tiny weights"
  #python3 -m gdown.cli https://drive.google.com/uc?id=1YZVo5wugrLs-ArtmbkvHUyXnwnADrkbH
  #echo "** Download pre-trained yolov4_csp weights"
  #python3 -m gdown.cli https://drive.google.com/uc?id=1NQwz47cW0NUgy7L3_xOKaNEfLoQuq3EL
  echo "** Download pre-trained yolov4-csp.conv.142
  python3 -m gdown.cli https://drive.google.com/uc?id=1tgBzP_Ao_kVbJ8E2P7ltn8Oyhnei2HD9
  popd > /dev/null
fi
echo "** Done."
