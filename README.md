# Домашнее задание к занятию "`Оркестрация группой Docker контейнеров на примере Docker Compose`" - `Чернышов Андрей`

### Задание 1

(https://hub.docker.com/repository/docker/andrey1613/custom-nginx/general)


### Задание 2

![Docker "ChernyshovAndrey-custom-nginx-t2"](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/docker.png)

### Задание 3 MySQL

3.1. С помощью официальной документации приведите пример команды инкрементного резервного копирования базы данных MySQL.

mysqlbackup --defaults-file=/home/dbadmin/my.cnf \  
  --incremental --incremental-base=history:last_backup \  
  --backup-dir=/home/dbadmin/temp_dir \  
  --backup-image=incremental_image1.bi \  
   backup-to-image  






