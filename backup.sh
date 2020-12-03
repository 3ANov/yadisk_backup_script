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
 
# Запакуем в темпах и перенесем в нужную папку
zip -r "/tmp/$SERVER_NAME-$NOW.zip" $ARCHIVATE_PATH > /dev/null 2>&1
mv "/tmp/$SERVER_NAME-$NOW.zip" "$ARCHIVATE_TO/$SERVER_NAME-$NOW.zip"
 
echo 'backup done!'
