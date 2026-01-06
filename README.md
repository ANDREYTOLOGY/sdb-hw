# Домашнее задание к занятию "`Репликация и масштабирование. Часть 1`" - `Чернышов Андрей`

### Задание 1

На лекции рассматривались режимы репликации master-slave, master-master, опишите их различия.


### Задание 2.
За основу взят материал https://github.com/vbabak/docker-mysql-master-slave
Выполнена конфигруация master-slave с помощью docker-compose, использовалась бд MySQL
Содержимое docker-compose.yml
```yml
version: '3'
services:
  mysql_master:
    image: mysql:8.0
    env_file:
      - ./master/mysql_master.env
    container_name: "mysql_master"
    restart: "no"
    ports:
      - 4406:3306
    volumes:
      - ./master/conf/mysql.conf.cnf:/etc/mysql/conf.d/mysql.conf.cnf
      - ./master/data:/var/lib/mysql
    networks:
      - overlay

  mysql_slave:
    image: mysql:8.0
    env_file:
      - ./slave/mysql_slave.env
    container_name: "mysql_slave"
    restart: "no"
    ports:
      - 5506:3306
    depends_on:
      - mysql_master
    volumes:
      - ./slave/conf/mysql.conf.cnf:/etc/mysql/conf.d/mysql.conf.cnf
      - ./slave/data:/var/lib/mysql
    networks:
      - overlay

networks:
  overlay:
```
Скриншот запущенных контейнеров
![docker ps](https://github.com/ANDREYTOLOGY/sdb-hw/blob/main/img/dockerps.jpg)

Скриншот Master status
![master status](https://github.com/ANDREYTOLOGY/sdb-hw/blob/main/img/master-status.jpg)

Скриншот Slave status
![slave status](https://github.com/ANDREYTOLOGY/sdb-hw/blob/main/img/slave-status.jpg)

Cкриншот тестирования Master-Slave
![master slave](https://github.com/ANDREYTOLOGY/sdb-hw/blob/main/img/master-slave.jpg)
