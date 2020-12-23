#!/bin/bash
 
BACKUP_DIR=$HOME'/1c_backup'
YADISC_DIR='disk:/1c_backup' 

FILE_FROM_MAIN_SERVER='message_aa_bb.txt'
FILE_FROM_SLAVE_SERVER='message_bb_aa.txt'


# !!! Исправить расширение !!!
# Сообщение с главного сервера на второстепенный (загружается в диск)
FROM_MAIN_TO_SLAVE_MESSAGE_LOCAL=$BACKUP_DIR/$FILE_FROM_MAIN_SERVER
FROM_MAIN_TO_SLAVE_MESSAGE_YADISK=$YADISC_DIR/$FILE_FROM_MAIN_SERVER



# !!! Исправить расширение !!!
# Сообщение с второстепенного сервера на главный (выгружается с диска)
FROM_SLAVE_TO_MAIN_MESSAGE_YADISK=$YADISC_DIR/$FILE_FROM_SLAVE_SERVER
FROM_SLAVE_TO_MAIN_MESSAGE_LOCAL=$BACKUP_DIR/$FILE_FROM_SLAVE_SERVER



ydcmd put $FROM_MAIN_TO_SLAVE_MESSAGE_LOCAL $FROM_MAIN_TO_SLAVE_MESSAGE_YADISK --timeout=300 --retries=3 
ydcmd get $FROM_SLAVE_TO_MAIN_MESSAGE_YADISK $FROM_SLAVE_TO_MAIN_MESSAGE_LOCAL --timeout=300 --retries=3 

 
echo 'done!'