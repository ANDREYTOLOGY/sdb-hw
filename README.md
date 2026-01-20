# Домашнее задание к занятию "`Оркестрация группой Docker контейнеров на примере Docker Compose`" - `Чернышов Андрей`

### Задание 1

(https://hub.docker.com/repository/docker/andrey1613/custom-nginx/general)


### Задание 2

![Docker "ChernyshovAndrey-custom-nginx-t2"](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker2.png)

### Задание 3 
![Docker 3](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker3.png)
Контейнер остановился, потому что ``` docker attach```  подключает меня к главному процессу контейнера, а ``` Ctrl-C```  отправляет ему сигнал SIGINT. Главный процесс завершился — значит контейнер завершился.

![Docker 4](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker4.png)

![Docker 5](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker5.png)
 Проброс порта остался прежним: 127.0.0.1:8080 слушает docker контейнер:80, но т.к. мы изменили конфиг nginx, и он теперь слушает 81, а не 80. Поэтому curl http://127.0.0.1:8080 не получит страницу, потому что внутри контейнера на порту 80 нет сервиса.
 

