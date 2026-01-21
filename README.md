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

 ### Задание 4

![Docker 6](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker6.png)
![Docker 7](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker7.png)

 ### Задание 5

 Путь по умолчанию для файла Compose — ```compose.yaml```(предпочтительный) или ```compose.yml``` файл, расположенный в рабочем каталоге. Compose также поддерживает ```docker-compose.yaml``` и ```docker-compose.yml``` для обратной совместимости с более ранними версиями. Если оба файла существуют, Compose предпочитает канонический файл ```compose.yaml```.
 ![Docker 8](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker8.png)
 ![Docker 9](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker9.png)
  ![Docker 10](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker10.png)
    ![Docker 11](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker11.png)
 WARN[0000] Found orphan containers ([task5-portainer-1]) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.  
Docker Compose помнит, что в этом compose-проекте раньше был сервис portainer. Warning возник, потому что ранее в compose-проекте существовал сервис portainer, но после удаления compose-файла он больше не описан в конфигурации.  
Docker Compose обнаружил контейнер, не принадлежащий текущему набору сервисов, и пометил его как orphan. Для очистки таких контейнеров необходимо использовать флаг --remove-orphans.
