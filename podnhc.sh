# !/bin/bash

'''
Downloads NHC POD as a .txt file from NHC POD website.

INPUT: None

OUTPUT: DATE_pod.txt
'''

# navigate to NHC POD archive folder
cd "$HOME/agsd Dropbox/agsd's shared workspace/data_temp/tc25_usaf_aro/nhc_pod"

year=$(date "+%Y")
date=$(date "+%Y%m%d")
fdate=$(date "+%Y-%m-%d")

# use nhc plan of day website
curl https://www.nhc.noaa.gov/text/MIAREPRPD.shtml > "$fdate"_pod.txt
start=$(grep -n "REPRPD" "$fdate"_pod.txt | cut -d: -f1)
line_start=$((start - 1))
line_end=$(grep -n "NNNN" "$fdate"_pod.txt | cut -d: -f1)

# keeps only the lines we need
sed -i '' ''$line_start','$line_end'!d' "$fdate"_pod.txt