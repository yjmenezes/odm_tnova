# shell scripts to write EXIF into scanned analog images.
cd ~/odm_tnova/images; ../shell/proj4_utm2ddeg.sh < ../atri/prjc31984.txt  | ../shell/lmk_exif_from_lonlat.sh
# please fix sensor_data.json and sensor_data_detailed.json

