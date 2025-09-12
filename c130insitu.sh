# !/bin/bash

# create paths
dropbox_path="$HOME/agsd Dropbox/agsd's shared workspace/data_temp"
ags_path="$HOME/ags/products/hiaper"
ags2024="$ags_path/2024.162_tc2024/c130-insitu_usaf"
ags2025="$ags_path/2025.181_tc2025/c130-insitu_usaf"

echo -n "Enter TC campaign year (YYYY): "
read -r year

if [[ $year == "2024" ]];then
    echo "Campaign ID: 2024.162_tc2024"
    cd "$dropbox_path/tc24_usaf_aro/1_complete"
    one_second_data=$(find . -name "*01.txt")
    echo $one_second_data
    cp $one_second_data $ags2024
elif [[ $year == "2025" ]];then
    echo "Campaign ID: 2025.181_tc2025"
fi