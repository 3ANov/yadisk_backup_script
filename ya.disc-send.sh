#!/bin/bash
 
BACKUP_DIR=$HOME'/1c_backup'
YADISC_DIR='disk:/server_backups/'
 
# найти последний .zip файл в папке бэкапов
LAST_BACKUP=$(ls -t $BACKUP_DIR/*.tar.gz | head -1)
 
 
if [ -z $LAST_BACKUP ]
then
    echo -e "Бэкапов для отправки на ya.disk не найдено\n"
    exit
fi
 
 
ydcmd put $LAST_BACKUP $YADISC_DIR
 
rm -f $LAST_BACKUP
 
echo 'done!'