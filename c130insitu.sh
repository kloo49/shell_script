# !/bin/bash

# assumes c130insitu.py was ran first!!

# create paths
dropbox_path="$HOME/agsd Dropbox/agsd's shared workspace/data_temp"
ags_path="$HOME/ags/products/hiaper"
ags2024="$ags_path/2024.162_tc2024/c130-insitu_usaf"
ags2025="$ags_path/2025.181_tc2025/c130-insitu_usaf"

#---------------------------------------------------------------------------------------------------------

# code_kloo
cd "$HOME/ags/projects/hiaper/code_kloo"

filename=()
for line in $(cat newfilename.txt);do 
    filename+=("$line") # .txt file to list
done

# isolate mission name from the new naming convention

agsmissionname=()
for line in "${filename[@]}";do
    mission="${line:11}"
    agsmissionname+=("$mission") # a list of mission names to match with the Google Drive
done

#---------------------------------------------------------------------------------------------------------

echo -n "Enter TC campaign year (YYYY): "
read -r year

rename () {
    gfile=($(find . -maxdepth 1 -name "*.txt"))
    gmissionname=()

    for file in "${gfile[@]}"; do
        gmission="${file:2}"
        gmissionname+=($gmission)
    done
    
    i=0
    for file in "${gmissionname[@]}";do
        if [[ "${agsmissionname[*]}" == *"$file"* ]];then
            echo "$file is present in both arrays. New file name is: "${filename[i]}"."
            i=$(($i+1))
            # mv "$gmissionname" "$file"
        else
            echo "$file is not present in both arrays. Check again."
        fi
    done
}

if [[ $year == "2024" ]]; then
    echo "Campaign ID: 2024.162_tc2024"
    cd "$dropbox_path/tc24_usaf_aro/1_complete"
    one_second_data=($(find . -name "*01.txt"))
    # echo $one_second_data
    # cp $one_second_data $ags2024
    cd "$ags2024"
    # find . -maxdepth 1 -name "*.txt"
    rename
elif [[ $year == "2025" ]]; then
    echo "Campaign ID: 2025.181_tc2025"
    cd "$dropbox_path/tc25_usaf_aro/1_complete"
    one_second_data=($(find . -name "*01.txt"))
    rename
fi

