# !/bin/bash

###### USER SPECIFIC INPUT ######
# local path to agsd's shared workspace
dropbox_path="/Users/kyloo/agsd Dropbox/agsd's shared workspace"
# local path to your downloads folder
download_path="/Users/kyloo/Downloads/"
# local path to your desktop
desktop_path="/Users/kyloo/Desktop/"

###### DO NOT MODIFY ######

date=$(date "+%Y-%m-%d")

# create folder in screenshots_nhc
screenshot_path=$dropbox_path'/data_temp/tc25_usaf_aro/screenshot_nhc'
cd "$screenshot_path"
mkdir "$date"

oceans=("atlantic" "epac" "cpac")
for i in "${oceans[@]}"; do
    cd "$download_path"
    if [ -e "$date"_"$i".png ]; then
        mv "$download_path"/"$date"_"$i".png "$screenshot_path"/"$date"
        echo "Disturbances in the $i."
    else
        cd "$desktop_path"
        if [ -e "$date"_"$i".png ]; then
            mv "$desktop_path"/"$date"_"$i".png "$screenshot_path"/"$date"
            echo "Disturbances in the $i."
        else
            echo "No disturbance in the $i."
        fi
    fi
done