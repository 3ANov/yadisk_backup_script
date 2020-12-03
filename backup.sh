#!/bin/bash
 
# назание сервера, чтобы потом без проблем отличать что и откуда
SERVER_NAME='PetrServer'
 
# Папка, котрую архивируем
ARCHIVATE_PATH=$HOME'/1c'
 
# Папка, куда архивируем
ARCHIVATE_TO=$HOME'/1c_backup'
 
# проверим на ARCHIVATE_TO папку для дампов
if  [ ! -d $ARCHIVATE_TO ]; then
    mkdir $ARCHIVATE_TO
fi
  
# текущая дата
NOW=`date +%Y-%m-%d`



# Архивация бэкапа
tar -czf $ARCHIVATE_TO/$SERVER_NAME-$NOW.tar.new -C $ARCHIVATE_PATH ./$ARCHIVATE_TO
 
echo 'backup done!'
