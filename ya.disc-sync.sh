#!/bin/bash
 
BACKUP_DIR=$HOME'/1c_backup'
YADISC_DIR='disk:/1c_backup/' 
 
ydcmd get $YADISC_DIR $BACKUP_DIR --timeout=300 --retries=3 

ydcmd --rsync put $BACKUP_DIR --timeout=300 --retries=3 

 
echo 'done!'