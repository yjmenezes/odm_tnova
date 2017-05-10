# odm_tnova
22 Zeiss LMK 9500x9500 scanned images without exif + gcplist.txt + measurementes from DPW (contours,aerotriangulation)

. to upload to git:

. split -b 25M images_9500.tar.bz2

. to restore images with fiducial marks 9500x9500, PP on image center.

cat xa{a..v}  > /tmp/images_9500.tar.bz2

tar xpjvf /tmp/images_9500.tar.bz2 -C /tmp/

to run ODM: 9500 * 0.023991 = 227.915 mm

--force-focal 152.274 --force-ccd 227.915 --min-num-features 800  --orthophoto-resolution  1  -v 

julio 
2017-05-09

//---------------------------------------------------------------------------------


22 Zeiss LMK 8600x8600 scanned images + exif + gcplist.txt + measurementes from DPW (contours,aerotriangulation)

Camera ZEISS LMK, focal 152.274mm  PixelSize 0.023991 mm , GSD=37.1 cm

scanned image cropped to 9500x9500 keeping PP on image center of fiducial marks.

REMOVED Cropped to 8600x8600 to fit 25MB git limitation.

EXIF geotag from aerotriangulation prjc31984.txt

for 8600x8600:    --force-focal 152.274  --force-ccd 206.322 --min-num-features 800  --orthophoto-resolution  1  -v 


julio

2017-05-05
