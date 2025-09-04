# !/bin/bash

'''
This code scans through user desktop and downloads folder for nhc screenshots, then moves the files to agsd dropbox.
The current date is taken and creates a folder in /data_temp/tc25_usaf_aro/screenshot_nhc/. Then, the files are saved here.
This script must be run on the same day that the screenshots were saved.

INPUT: None

OUTPUT:
- New directory created in screenshot_nhc with the current date as the file name.
- Moves any YYYY-MM-DD_atlantic.png, YYYY-MM-DD_epac.png, and YYYY-MM-DD_cpac.png if available.
- Moves any YYYY-MM-DD_STORMNAME_cone.png if available.
'''

# local path to agsd's shared workspace
dropbox_path="$HOME/agsd Dropbox/agsd's shared workspace"
# local path to your downloads folder
download_path="$HOME/Downloads/"
# local path to your desktop
desktop_path="$HOME/Desktop/"

date=$(date "+%Y-%m-%d")

# create folder in screenshots_nhc
screenshot_path=$dropbox_path'/data_temp/tc25_usaf_aro/screenshot_nhc'
cd "$screenshot_path"
mkdir "$date"

oceans=("atlantic" "epac" "cpac")
for i in "${oceans[@]}"; do
    cd "$download_path"
    if [ -e "$date"_"$i".png ]; then
        mv "$download_path""$date"_"$i".png "$screenshot_path"/"$date"
        echo "Disturbance in the $i."
    else
        cd "$desktop_path"
        if [ -e "$date"_"$i".png ]; then
            mv "$desktop_path""$date"_"$i".png "$screenshot_path"/"$date"
            echo "Disturbance in the $i."
        else
            echo "No disturbance in the $i."
        fi
    fi
done

# move *_cone.png to dropbox screenshot_nhc directory
cd "$download_path"
cone=($(find "$download_path" -name "*_cone.png*"))

for file in "${cone[@]}"; do
    echo "$file"
    mv "$file" "$screenshot_path"/"$date"
    echo "Cone projection moved to Dropbox."
    # echo "There are no cone projections."
done