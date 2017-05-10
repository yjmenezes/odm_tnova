#!/bin/bash 
# GPL2 by yjmenezes at gmail.com; ver 1.0 - 2016-04-25
# odm_tnova     proj4, utm wgs to lon/lat wgs84 zone=24 South
# input layout:  e n h image.jpg, please use atri/prjc31984.txt as input
# 385147.668  9057638.894  2785.308  01_001.jpg
proj -I -f "%.7f" +proj=utm +zone=24 +south +ellps=WGS84  +units=m +no_defs | \
sed s/\\t/\;/g | sed s/\ /\;/g 
exit 0
# reverse, from lon/lat to UTM
proj -f "%.3f" +proj=utm +zone=24 +south +ellps=WGS84 < longlataltid.txt
echo "please run lmk_exif_from_lonlat.sh" 1>&2
exit 0
