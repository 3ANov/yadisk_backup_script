# yadisk_backup_script  

Скрипт для бэкапа из [этой статьи](https://saribzhanov.ru/tehno/rezervnoe-kopirovanie-sajta-na-yandeks-disk-backup-na-ya-disk/)

Скрипт для синхронизации распределённой базы 1с через яндекс-диск

Согласно этой [статье](https://blog.vpsville.ru/blog/howto/177.html) необходимо:   
* установить ydcmd и получить токен  
* cоздать файл для сохранения токена для подключения к Rest.Api:  
**sudo nano /root/.ydcmd.cfg**  
* поменять права для файла с токеном:  
**sudo chmod 400 /root/.ydcmd.cfg**  
* выполнить команду для добавления задачи  
**sudo crontab -e**  
* добавить задачу на выполнение (к примеру - будет производится копирование в 19:30 каждый день) (см [документацию сron](https://help.ubuntu.ru/wiki/cron):  
**30 19 * * * /home/mini_user/yadisk_backup_script/ya.disc-sync.sh >> /dev/null 2>&1** 
* перезапустить сервис cron:  
**service cron restart**

Для проверки работы скрипта - можно просмотреть системные логи:  
**grep CRON /var/log/syslog**

