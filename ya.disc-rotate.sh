#!/bin/bash
SERVER_NAME='MyOwnServer'
CONFIG_PATH=$HOME'/you/.ydcmd.cfg'
YD_COMMAND='/usr/bin/ydcmd --config='$CONFIG_PATH
YADISC_DIR='disk:/path-in-ya.disk/'
 
LIST=$($YD_COMMAND ls $YADISC_DIR)
ARCHIVES=$(echo "$LIST" | sed -r 's/.*[[:space:]](.*\.zip).*$//g')
 
# текущая дата
now=$(date)
 
for itm in $ARCHIVES
do
    # пропустить архивы, которые не относятся к правильным
    if [[ $itm != $SERVER_NAME* ]]
    then
        echo -e "Это архив не того бэкапа $YADISC_DIR$itm\n"
        continue
    fi
 
    cr=$($YD_COMMAND stat $YADISC_DIR$itm | grep created)
    cr=$(echo "$cr" | sed -r 's/.*created:(.*$)//g')
    weekday=$(date -d $cr '+%u')
     
    # разница между датами в днях
    SDIFF=$((((`date -d "$now" '+%s'` - `date -d "$cr" '+%s'`))/((60*60*24))))
 
    # Старые архивы удаляем. Старше 28 дней
    if (($SDIFF > 28))
    then
        echo -e "Удаляем старый $YADISC_DIR$itm'\n"
        $YD_COMMAND rm $YADISC_DIR$itm
        continue
    fi
 
    # архивы понедельника не трогаем
    if [ "$weekday" -eq "1" ]
    then
        echo -e "Понедельничный архив не трогаем $YADISC_DIR$itm\n"
        continue
    fi
     
    # последние 3 дня оставляем
    if (($SDIFF < 3))
    then
        echo -e "Оставляем $YADISC_DIR$itm\n"
        continue
    fi
 
    echo -e "Удаляем остальное $YADISC_DIR$itm\n"
    $YD_COMMAND rm $YADISC_DIR$itm
done
 
echo 'done!'
