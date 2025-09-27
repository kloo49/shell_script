# !/bin/bash

# This script assumes you have dropbox and ags mounted to your local machine.
dropbox_path="$HOME/agsd Dropbox/agsd's shared workspace"

echo -n "Enter flight date (YYYY-MM-DD): "
read -r date
doy=$(date -j -f "%Y-%m-%d" "$date" +%j)
year="${date:0:4}"
y="${date:2:2}"
# echo $year

echo -n "Enter ARO flight ID: "
read -r flightid

echo -n "Enter receiver ID: "
read -r receiver

createsbf () {
    cd $HOME/ags/data/hiaper/$campaign
    mkdir $year."$doy"_"$flightid"_"$receiver"
    cd $year."$doy"_"$flightid"_"$receiver"
    mkdir gpsdata_asterxsb3
    cd gpsdata_asterxsb3
    mkdir sbf
}
if [[ "$year" == "2025" ]]; then
    campaign="2025.181_tc2025"
    datatemp="tc25_usaf_aro"
    createsbf
    echo -n "Enter storm name: "
    read -r storm
    echo -n "Enter tail ID: "
    read -r tail
    cp "$dropbox_path"/data_temp/"$datatemp"/1_complete/"$date"_"$storm"_"$tail"/"$receiver"*."$y"_ $HOME/ags/data/hiaper/"$campaign"/"$year"."$doy"_"$flightid"_"$receiver"/gpsdata_asterxsb3/sbf/
elif [[ "$year" == "2024" ]]; then
    campaign="2024.162_tc2024"
    datatemp="tc24_usaf_aro"
    createsbf
    cp "$dropbox_path"/data_temp/"$datatemp"/1_complete/"$year"."$doy"_*_"$receiver"/"$receiver"*."$y"_ $HOME/ags/data/hiaper/"$campaign"/"$year"."$doy"_"$flightid"_"$receiver"/gpsdata_asterxsb3/sbf/
fi

echo "ARO file copied to sbf."