# !/bin/bash/

# local path to google drive 2025 NHOP folder
gdrive_path="~/Library/CloudStorage/GoogleDrive-kloo@ucsd.edu/.shortcut-targets-by-id/1_L7QmkPn1WUVfeTuCeB04HKaOsed07O2/1\ -\ 2025\ Data/NHOP"
# local path to agsd's shared workspace
dropbox_path="~/agsd Dropbox/agsd's shared workspace/data_temp/tc25_usaf_aro/1_complete"
# local path to your downloads folder
download_path="~/Downloads/"
# local path to your desktop
desktop_path="~/Desktop/"


# get file name input from user
echo -n "Enter flight date (YYYY-MM-DD): "
read -r date

echo -n "Enter storm name: "
read -r storm

echo -n "Enter tail number: "
read -r tail

echo -n "Enter mission month (MM): "
read -r month

echo -n "Enter mission ID: "
read -r mission

# check if flight exists
cd "$gdrive_path"/"$month"*
if [ -d *"$mission"* ]; then
    # flight data has been upload, time to create directory to store data in agsd dropbox
    echo "Flight data exists."
    # go to tc25 usaf folder in dropbox
    cd "$dropbox_path"
    mkdir "$date"_"$storm"_"$tail"
else
    echo "Flight data has not been uploaded yet."
    exit
fi

# copy .SUM file
cd "$gdrive_path"/"$month"*/*"$mission"*

if [ -e *.SUM ]; then
    echo ".SUM file exists."
    cp *.SUM "$dropbox_path"/"$date"_"$storm"_"$tail"
else
    echo ".SUM file doesn't exist, flight data is incomplete."
fi

# retrieve ARO file
cd "$gdrive_path"/"$month"*/*"$mission"*
if [ -e *.25_.A ]; then
    echo "ARO file exists."
    cp *.25_.A "$dropbox_path"/"$date"_"$storm"_"$tail"
else
    if [ -e *.25_ ]; then
        echo "ARO file exists."
        cp *.25_ "$dropbox_path"/"$date"_"$storm"_"$tail"
    else
        echo "ARO file doesn't exist, flight data is incomplete."
    fi
fi
# rename ARO file
cd "$dropbox_path"/"$date"_"$storm"_"$tail"
for arofile in a*.25_.A; do
    mv "$arofile" "${arofile/.A/}"
done
filename=$(find . -name *.25_)
echo "ARO file name: $filename."

# retrieve tgz
cd "$gdrive_path"/"$month"*/*"$mission"*
if [ -e *.tgz ]; then
    echo ".tgz file exists."

    cp *.tgz ~/launchpad
    cd ~/launchpad
    tar -xzf *.tgz

    for file in *.txt; do
        mv "$file" "${file/\Data\\\\/}"
    done

    cp *.txt "$dropbox_path"/"$date"_"$storm"_"$tail"
    rm -f *
else
    echo ".tgz file doesn't exist, flight data is incomplete."
fi

echo "File name is "$date"_"$storm"_"$tail""
cd "$dropbox_path"
open "$date"_"$storm"_"$tail"
open "$gdrive_path"/"$month"*/*"$mission"*

