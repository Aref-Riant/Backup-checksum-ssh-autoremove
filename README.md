# Backup-checksum-ssh-autoremove
Simple script to remove successfully backed up files through SSH

# What does it do?
 If you are using scp or rsync  in cronjonjobs to schedule backing up youfiles, 
 you may need another automated routine to remove alod files from your local storage.
 
 this script simply compares local and remote files checksums (using md5sum) through SSH and in case of match, 
 deletes old files from your local system.
