#!/bin/bash
 
BACKUP_DIR=$HOME'/1c_backup'
YADISC_DIR='disk:/server_backups/'
 
# найти последний .zip файл в папке бэкапов
LAST_BACKUP=$(ls -t $BACKUP_DIR/.zip | head -1)
 
LAST_BACKUP_PATH=$BACKUP_DIR$LAST_BACKUP
 
if [ -z $LAST_BACKUP ]
then
    echo -e "Бэкапов для отправки на ya.disk не найдено\n"
    exit
fi
 
 
/usr/bin/ydcmd put $LAST_BACKUP_PATH $YADISC_DIR
 
rm -f $LAST_BACKUP_PATH
 
echo 'done!'