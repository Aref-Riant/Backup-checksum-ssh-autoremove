files=$(find /storage1/BK/*.gz -mtime +10)

for f in $files; do

mfile=$(echo $f | cut -d '/' -f 4);

#Get Local File MD5 checksum
md5l=$(md5sum /storage1/BK/$mfile | cut -d ' ' -f 1);

#Get Remote File MD5 checksum
md5r=$(ssh root@110.110.110.10 "md5sum /Backup/SRV1/'$mfile' | cut -d ' ' -f 1");

#Compare Checksums and remove local file if match
if [ $(echo $md5r | wc -m) -eq 33 ] && [ "${md5l}" = "${md5r}" ] ; then 
 echo Removing file $mfile;
 rm -f /storage1/BK/$mfile
fi

done