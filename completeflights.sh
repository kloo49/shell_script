# !/bin/bash/

# future work: make this code applicable to user

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
cd /Users/kyloo/Library/CloudStorage/GoogleDrive-kloo@ucsd.edu/.shortcut-targets-by-id/1_L7QmkPn1WUVfeTuCeB04HKaOsed07O2/1\ -\ 2025\ Data/NHOP/
if [ -d "$month"* ]; then
    cd /Users/kyloo/Library/CloudStorage/GoogleDrive-kloo@ucsd.edu/.shortcut-targets-by-id/1_L7QmkPn1WUVfeTuCeB04HKaOsed07O2/1\ -\ 2025\ Data/NHOP/"$month"*
    if [ -d *"$mission"* ]; then
        # flight data has been upload, time to create directory to store data in agsd dropbox
        echo "Flight data exists."
        # go to tc25 usaf folder in dropbox
        cd /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete
        mkdir "$date"_"$storm"_"$tail"
    else
        echo "Flight data has not been uploaded yet."
        exit
    fi
else
    echo "Flight data has not been uploaded yet."
    exit
fi

# copy .SUM file
cd /Users/kyloo/Library/CloudStorage/GoogleDrive-kloo@ucsd.edu/.shortcut-targets-by-id/1_L7QmkPn1WUVfeTuCeB04HKaOsed07O2/1\ -\ 2025\ Data/NHOP/"$month"*/*"$mission"*

if [ -e *.SUM ]; then
    echo ".SUM file exists."
    cp *.SUM /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete/"$date"_"$storm"_"$tail"
else
    echo ".SUM file doesn't exist, flight data is incomplete."
fi

# retrieve ARO file
cd /Users/kyloo/Library/CloudStorage/GoogleDrive-kloo@ucsd.edu/.shortcut-targets-by-id/1_L7QmkPn1WUVfeTuCeB04HKaOsed07O2/1\ -\ 2025\ Data/NHOP/"$month"*/*"$mission"*
if [ -e *.25_.A ]; then
    echo "ARO file exists."
    cp *.25_.A /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete/"$date"_"$storm"_"$tail"
    if [ -e *.25_ ]; then
        echo "Second ARO file exists."
        cp *.25_ /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete/"$date"_"$storm"_"$tail"
    else
        echo "ARO file doesn't exist, flight data is incomplete."
    fi
else
    echo "ARO file doesn't exist, flight data is incomplete."
fi
# rename ARO file
cd /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete/"$date"_"$storm"_"$tail"
if [ -e *.25_.A ]; then
    # rename ARO file
    for arofile in a*.25*; do
        mv "$arofile" "${arofile/.A/}"
    done
else
    filename=$(find . -name *.25_)
    echo "ARO file name: $filename."
fi

# retrieve tgz
cd /Users/kyloo/Library/CloudStorage/GoogleDrive-kloo@ucsd.edu/.shortcut-targets-by-id/1_L7QmkPn1WUVfeTuCeB04HKaOsed07O2/1\ -\ 2025\ Data/NHOP/"$month"*/*"$mission"*
if [ -e *.tgz ]; then
    echo ".tgz file exists."

    cp *.tgz /Users/kyloo/Desktop/launchpad
    cd /Users/kyloo/Desktop/launchpad
    tar -xvzf *.tgz

    # find . -name "*.txt" | while read -r file; do

    #     # old file name into string
    #     old_name=$(basename "$file")

    #     # get rid of "\Data\\"
    #     new_name=$(echo "$old_name" | sed 's|\Data\\\\||')

    #     # if the file has already been renamed, it won't do it again
    #     if [[ "$old_name" != "$new_name" ]]; then
    #         mv -- "$file" "$(dirname "$file")/$new_name"
    #         echo "Renamed: $file -> $new_name"
    #     fi
    # done

    for file in *.txt; do
        mv "$file" "${file/\Data\\\\/}"
    done

    cp *.txt /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete/"$date"_"$storm"_"$tail"
    rm -f *
else
    echo ".tgz file doesn't exist, flight data is incomplete."
fi

echo "File name is "$date"_"$storm"_"$tail""
cd /Users/kyloo/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/1_complete/
open "$date"_"$storm"_"$tail"
open /Users/kyloo/Library/CloudStorage/GoogleDrive-kloo@ucsd.edu/.shortcut-targets-by-id/1_L7QmkPn1WUVfeTuCeB04HKaOsed07O2/1\ -\ 2025\ Data/NHOP/"$month"*/*"$mission"*
