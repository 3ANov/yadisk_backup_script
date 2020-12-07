#!/bin/bash
 
BACKUP_DIR=$HOME'/1c_backup'
YADISC_DIR='disk:/server_backups/'
 
# найти последний .zip файл в папке
LAST_DB_FILE=$(ls -t $BACKUP_DIR/*_AA_BB.zip | head -1)
 
 
if [ -z $LAST_DB_FILE ]
then
    echo -e "Бэкапов для отправки на ya.disk не найдено\n"
    exit
fi
 
 
ydcmd put $LAST_DB_FILE $YADISC_DIR --timeout=300 --retries=3 --rsync

ydcmd get $YADISC_DIR $BACKUP_DIR -timeout=300 --retries=3 --rsync

 
echo 'done!'