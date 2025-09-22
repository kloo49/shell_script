# !/bin/bash

: << 'CONVENTION'
This code saves Tropical Tidbit screenshots. This includes recon and storm information.
For storms, files must be saved as DATE_STORM_track.png or DATE_STORM_intensity.png
For flights, do not change the file name when you save it from the website.

INPUT:
- User input: y/n
If y,
    - User input: date the flight
    - User input: aircraft type

OUTPUT: 
- Recon screenshots moved to /screenshot_tropical_tidbits/DATE_TAIL
- Storm screenshots moved to /screenshot_tropical_tidbits

NOTES: NOAA flight recon has not been tested yet.
CONVENTION

# # path
dropbox_path="$HOME/agsd Dropbox/agsd's shared workspace"
tt_path="$dropbox_path""/data_temp/tc25_usaf_aro/screenshot_tropical_tidbits"
download_path="$HOME/Desktop/aircraft-imgs"

# # functions
stormforecasts () {
    if [ -z "$1" ];then
        echo "No $2 screenshots found."
    else
        for f in "$1"; do
            mv "$f" "$tt_path"
            echo "$2 screenshot saved."
        done
    fi
}

# # initializing code
echo -n "Archiving flight? (y/n): "
read -r yn

if [ $yn == "y" ]; then
    # # create folder in screenshots_tropical_tidbits
    echo -n "Enter flight date (YYYY-MM-DD): "
    read -r date

    echo -n "Enter aircraft (AF30x/NOAAx): "
    read -r tail

    # Change to lowercase to create directory
    cd "$tt_path"
    tailname=$(echo "$tail" | tr '[:upper:]' '[:lower:]' )
    mkdir "$date"_"$tailname"

    # # Find the file
    # Change to uppercase to find file in Downloads folder
    tailfind=$(echo "$tail" | tr '[:lower:]' '[:upper:]' )
    mv "$download_path"/recon_$tailfind* "$tt_path"/"$date"_"$tailname"/
    echo "Tropical Tidbits flight screenshots moved."
else
    track=($(find "$download_path" -name "*_track.png*"))
    intensity=($(find "$download_path" -name "*_intensity.png*"))   
    stormforecasts "${track[@]}" "Track"
    stormforecasts "${intensity[@]}" "Intensity"
fi