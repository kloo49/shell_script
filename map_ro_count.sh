# !/bin/bash/

tc25_path='/ags/projects/hiaper/2025.181_tc2025/aro_a0xt'

#############################################################################
# # for TC24
echo 
echo "~~~~~~~~~~~TC 2024~~~~~~~~~~~"
echo "...Calculating maps and ROs..."

# # let's count C-130s first
# count maps
cd /ags/projects/hiaper/2024.162_tc2024/aro/9_map
af_map24=$(ls ./2024*/2024.*_ivt_map.png | wc -l)
echo "There are "$af_map24" IVT maps."

# counting ROs second
cd /ags/projects/hiaper/2024.162_tc2024/aro/
af_ro24=$(ls 6_nret/* | wc -l)
echo "There are "$af_ro24" estimated radio occultations."
echo
#############################################################################
# # for TC25
echo 
echo "~~~~~~~~~~~TC 2025~~~~~~~~~~~"
echo "...Calculating maps and ROs..."

# # let's count C-130s first
# count maps
cd $tc25_path'/9_map'
af_map25=$(ls ./2025*/2025.*_ivt_map.png | wc -l)
echo "There are "$af_map25" IVT maps."

# counting ROs second
cd $tc25_path
af_ro25=$(ls 6_nret/* | wc -l)
echo "There are "$af_ro25" estimated radio occultations."
echo
#############################################################################