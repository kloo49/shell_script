# !/bin/bash

# create folder in screenshots_tropical_tidbits
cd "$HOME/agsd Dropbox/agsd's shared workspace/data_temp/tc25_usaf_aro/screenshot_tropical_tidbits"

echo -n "Enter flight date (YYYY-MM-DD): "
read -r date

echo -n "Enter tail number: "
read -r tail

# TODO: add conditional storm name input

tailname=$(echo "$tail" | tr '[:upper:]' '[:lower:]' )
mkdir "$date"_"$tailname"

# fix case sensitive

tailfind=$(echo "$tail" | tr '[:lower:]' '[:upper:]' )
mv /Users/kyloo/Downloads/recon_$tailfind* /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/screenshot_tropical_tidbits/"$date"_"$tailname"/

# Report result
if [[ $? -ne 0 ]]; then
    echo "No matching recon files found for tail $tailfind in Downloads."
else
    echo "Moved recon files to ${date}_${tailname}/"
fi

# cd /Users/kyloo/Downloads/
# if [ -e "*_tracks.png" ]; then
#     mv /Users/kyloo/Downloads/*tracks.png /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/screenshot_tropical_tidbits/
#     echo "Tracks screenshots are in screenshots_tropical_tidbits."
#     if [ -e "*_intensity.png" ]; then
#         mv /Users/kyloo/Downloads/*intensity.png /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/screenshot_tropical_tidbits/
#         echo "Intensity screenshots are in screenshots_tropical_tidbits."
#     else
#         echo "Intensity screenshots do not exist."
#     fi
# else
#     echo "Tracks screenshots do not exist."
# fi