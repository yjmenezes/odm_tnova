#!/bin/bash
# GPL2 yjmenezes  cartognu.org   2017-05-10
# simple photo footprint output as WKT for QGIS
# from Camera center, draw a photo Zeiss 9500x9500 using GSD for QGIS
# focal=152.274mm pixel=0.023991mm 9500 9500 2300m #GSD=0.371
if [ $# -lt 5 ]; then
    echo "projectionCenter layout: e n h image.jpg" 
    echo $(basename $0) "focal_mm pixel_mm imgW imgH flight_height_m < prjc.txt"
    exit 1
fi
FOCAL=$1
PIXEL=$2
W=$3
H=$4
FHEIGHT=$5
#PRJC=prjc31984.txt 
GSD=$(echo $FOCAL $PIXEL $FHEIGHT | awk '{ printf "%.3f", $2 / $1 * $3 }')
echo "GSD= $GSD" 1>&2
awk -v g=$GSD -v w=$W -v h=$H 'BEGIN { print "wkt_geom\tphoto" } 
{ x=$1;y=$2; dx=(w/2.0*g); dy=(h/2.0*g); 
printf "POLYGON((%.3f %.3f, %.3f %.3f,%.3f %.3f,%.3f %.3f,%.3f %.3f))\t%s\n",
x-dx,y+dy,  x+dx,y+dy, x+dx,y-dy,  x-dx,y-dy,  x-dx,y+dy, $4 }' 
exit 0
