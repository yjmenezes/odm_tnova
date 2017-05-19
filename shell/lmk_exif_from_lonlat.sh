#!/bin/bash
# GPL2 by yjmenezes at gmail.com; ver 1.0 - 2016-04-25
# Insert ExifTags into scanned analog aerial photos 
# sudo apt-get install libimage-exiftool-perl
# LMK:-ImageWidth=9728  = 224.7mm -ImageHeight=9984 = 230.6mm; focal = 152.274mm
# pixel=23.9991microns Werlhi RM1 scanner
# adjusted atri_g84= absolute CPs from BINGO=dapor.dat reformated to atri_g84.txt
# LonWGS(g.gg);LatWGS(g.gg);AltitudeWGS(m);Photo  
#-46.6013349;-8.2727493;2897.128;04_001.tif
#-46.5893136;-8.2726896;2897.071;04_002.tif
# please edit EXIF exiftoll parameters below
LONREF=W
LATREF=S
FOCAL="152.274"
# focal35mm= 24.0522 = 152.274 * 36mm / 227.915mm
FOC35MM=24.0522
#IMGW=9728 
#IMGH=9984
# croped image keeping PP on center
#IMGW=9500 
#IMGH=9500
function helpme {
    echo "run inside images/" 1>&2
    echo "#LonWGS(g.gg);LatWGS(g.gg);AltitudeWGS(m);Photo  " 1>&2
    echo "-40.043544700;-8.523805130;2785.308;01_001.jpg" 1>&2
    echo $(basename $0) "imgW imgH < cam_lonlat_wgs.txt" 1>&2
    exit 1
}

if [ $# -lt 2 ]; then
    helpme
fi
IMGW=$1
IMGH=$2
echo "writing EXIF tags" 1>&2
chmod ugo+r-x+w *jpg
# remove minus signal 
grep -v \# | awk -F";" '{ print $1,$2,$3,$4 }' | sed s/\-//g | \
while read lon lat alt img; do
    if [ -f $img ]; then
        echo $lat $LATREF $lon $LONREF $alt $img $FOCAL $IMGW $IMGH 1>&2
#        exiftool -GPSLatitude=$lat -GPSLatitudeRef=$LATREF -GPSLongitude=$lon -GPSLongitudeRef=$LONREF -GPSAltitude=$alt -Make=LMK -Model=LMK -FocalLength=$FOCAL -ImageWidth=$IMGW -ImageHeight=$IMGH $img
        exiftool -FocalLengthIn35mmFormat=24.0522  -GPSLatitude=$lat -GPSLatitudeRef=$LATREF -GPSLongitude=$lon -GPSLongitudeRef=$LONREF -GPSAltitude=$alt -Make=LMK -Model=LMK -FocalLength=$FOCAL -ImageWidth=$IMGW -ImageHeight=$IMGH $img
    fi
done
rm *original;
exit 0
#===============================================================================

