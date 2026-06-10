# Лаб. работа №1. Скрипты в ОС Linux
Скрипт написан на `bash`, получает JSON-ответ от сервера при помощи `curl` и парсит при помощи `jq`.  

### Для получения ответа  
используется команда и адрес:  
`curl -H "Accept: application/json" 'https://check-host.net/check-http?host=check-host.net&max_nodes=3'`  
### Выходная строка  
Формируется для первого сервера из JSON-структуры: из имени сервера, страны и города расположения, ip адреса. В конец добавляется общий id запроса.

### Сервер NGINX  
Установлен командой `sudo apt install nginx`  
Для файла `/var/www/html/index.nginx-debian.html` установлены права для записи всем пользователям при помощи команды `sudo chmod 666 index.nginx-debian.html`, выполнена из каталога `/var/www/html`.  

### Планировщик 
Скрипт добавлен в планировщик crontab при помощи команды `crontab -e`:  
`* * * * * /home/sysadmin/script.sh >> /var/www/html/index.nginx-debian.html`

### Проброс портов на хост  
выполнен в интерфейсе VitrualBox, порт хоста 8080 проброшен на порт 80 гостевой ОС.

### Результат выполнения скрипта
Можно посмотреть в браузере на хостовой машине по адресу `http://localhost:8080`  

<img width="617" height="548" alt="screen1" src="https://github.com/user-attachments/assets/edcf2f26-5759-4a1a-ab11-e42975323228" />

