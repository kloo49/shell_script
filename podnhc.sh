# !/bin/bash

# navigate to NHC POD archive folder
cd "$HOME/agsd Dropbox/agsd's shared workspace/data_temp/tc25_usaf_aro/nhc_pod"

year=$(date "+%Y")
date=$(date "+%Y%m%d")
fdate=$(date "+%Y-%m-%d")

# # create a .txt with POD
# today=$(curl https://www.nhc.noaa.gov/archive/recon/2025/REPRPD/ | grep "$date")
# echo $today
# curl https://www.nhc.noaa.gov/archive/recon/"$year"/REPRPD/REPRPD."$date"????.txt > "$fdate"_pod.txt



# use nhc plan of day website
curl https://www.nhc.noaa.gov/text/MIAREPRPD.shtml > "$fdate"_pod.txt
start=$(grep -n "REPRPD" "$fdate"_pod.txt | cut -d: -f1)
line_start=$((start - 1))
line_end=$(grep -n "NNNN" "$fdate"_pod.txt | cut -d: -f1)

# keeps only the lines we need
sed -i '' ''$line_start','$line_end'!d' "$fdate"_pod.txt