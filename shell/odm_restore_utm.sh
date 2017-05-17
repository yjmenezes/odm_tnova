#!/bin/bash
# yjmenezes  cartognu.org ver 1.0 2017-05-16
# format processed image GPS exif tags with  odm_extract_utm to QGIS
#WGS84 UTM 24S
#389576 9055149
#461.3015332 2520.1112 0
#-2647.680307 -2292.16901 0
awk 'BEGIN { getline; getline; x=$1; y= $2; print "x\ty\tdx\tdy" } 
{ printf "%.3f\t%.3f\t%.3f\t%.3f\n", x+$1, y+$2,$1,$2; }' 
exit 0
