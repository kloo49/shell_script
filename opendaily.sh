# !/bin/bash/

cd /Applications/ 
echo "Starting process..."
echo ""

# User changes to prefered brower
browser="Google Chrome"
#browser="Safari"

echo "Loading websites"
websites=("https://www.tropicaltidbits.com/recon/
https://www.tropicaltidbits.com/storminfo/
https://www.nhc.noaa.gov/
https://www.nhc.noaa.gov/text/MIAREPRPD.shtml
https://tropic.ssec.wisc.edu/
https://www.flightaware.com/live/flight/965300 
https://www.flightaware.com/live/flight/965301 
https://www.flightaware.com/live/flight/965302 
https://www.flightaware.com/live/flight/975303 
https://www.flightaware.com/live/flight/975304 
https://www.flightaware.com/live/flight/975305 
https://www.flightaware.com/live/flight/975306 
https://www.flightaware.com/live/flight/985307 
https://www.flightaware.com/live/flight/985308 
https://www.flightaware.com/live/flight/995309
https://www.flightaware.com/live/flight/N42RF
https://www.flightaware.com/live/flight/N43RF
https://www.flightaware.com/live/flight/N49RF
https://www.dropbox.com/scl/fi/7vm0j174846pcawofppav/tc25_recovery_datalog.xlsx?rlkey=bs9aw3gzit8q3658b0w927916&st=1prki027&dl=0")
echo " "

open -na "$browser" --args --new-window $websites
open ~/agsd\ Dropbox/agsd\'s\ shared\ workspace/data_temp/tc25_usaf_aro/forecast_record_tc25.docx 


echo "...browser opened."