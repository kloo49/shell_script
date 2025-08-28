# !/bin/bash

echo -n "Enter flight date (YYYY-MM-DD): "
read -r date
doy=$(date -j -f "%Y-%m-%d" "$date" +%j)
echo $doy

echo -n "Enter storm name: "
read -r storm

echo -n "Enter ARO flight id: "
read -r flightid

echo -n "Enter tail number: "
read -r tail

# create file in ags data
cd /Users/kyloo/ags/data/hiaper/2025.181_tc2025
mkdir 2025."$doy"_"$flightid"_"$tail"
cd 2025."$doy"_"$flightid"_"$tail"
mkdir gpsdata_asterxsb3
cd gpsdata_asterxsb3
mkdir sbf
cd sbf
cp /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete/"$date"_"$storm"_"$tail"/a*t*.25_ /Users/kyloo/ags/data/hiaper/2025.181_tc2025/2025."$doy"_"$flightid"_"$tail"/gpsdata_asterxsb3/sbf/

echo "ARO file copied to sbf."