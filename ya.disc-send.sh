#!/bin/bash
 
BACKUP_DIR=$HOME'/1c_backup'
YADISC_DIR='disk:/server_backups/'
 
# найти последний zip2 файл в папке бэкапов
# это zip - только переименованный 
LAST_BACKUP=$(ls -t $BACKUP_DIR/*.zip2 | head -1)
 
 
if [ -z $LAST_BACKUP ]
then
    echo -e "Бэкапов для отправки на ya.disk не найдено\n"
    exit
fi
 
 
ydcmd put $LAST_BACKUP $YADISC_DIR --timeout=300 --retries=3
 
rm -f $LAST_BACKUP
 
echo 'done!'