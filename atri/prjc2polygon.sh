#!/bin/bash
# from Camera center, draw a photo Zeiss 8600x8600 using GSD for QGIS
PRJC=prjc31984.txt 
GSD=0.371
W=8600
H=8600
awk -v g=$GSD -v w=$W -v h=$H 'BEGIN { print "wkt_geom\tphoto" } 
{ x=$1;y=$2; dx=(w/2.0*g); dy=(h/2.0*g); 
printf "POLYGON((%.3f %.3f, %.3f %.3f,%.3f %.3f,%.3f %.3f,%.3f %.3f))\t%s\n",
x-dx,y+dy,  x+dx,y+dy, x+dx,y-dy,  x-dx,y-dy,  x-dx,y+dy, $4 }' $PRJC
exit 0
