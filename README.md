# Домашнее задание к занятию "`Система мониторинга Zabbix`" - `Чернышов Андрей`

### Задание 1

`Авторизация в админке Zabbix Server после установки`

![Админка Zabbix](https://github.com/ANDREYTOLOGY/zabbixx-hw/blob/main/img/zabbix_admin.png)


```
apt install postgresql
# wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.0+debian12_all.deb
# dpkg -i zabbix-release_latest_7.0+debian12_all.deb
# apt update
# apt install zabbix-server-pgsql zabbix-frontend-php php8.2-pgsql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent
# sudo -u postgres createuser --pwprompt zabbix
# sudo -u postgres createdb -O zabbix zabbix
# zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
# systemctl restart zabbix-server zabbix-agent nginx php8.2-fpm
# systemctl enable zabbix-server zabbix-agent nginx php8.2-fpm
```

### Задание 2

1. `Запушьте репозиторий на GitLab, изменив origin.`
  ` Для выполнения данного пункта использовались команды`
   ```bash
    git clone https://github.com/netology-code/sdvps-materials.git
   cd sdvps-materials
   git remote remove origin
   git remote add my_gitlab http://212.192.127.90/root/sdvps-materials.git
   git push my_gitlab
   ```
   ![git_push](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/push_mygitlab.png)
2. `Создайте .gitlab-ci.yml, описав в нём все необходимые, на ваш взгляд, этапы.`
   
   `Был использован пример из лекции с содержимым  .gitlab-ci.yml`
```yml
stages:
  - test
  - build

test:
  stage: test
  image: golang:1.17
  script: 
    - go test .
  tags:
    - netology

build:
  stage: build
  image: docker:latest
  script:
    - docker build .
  tags:
    - netology
```
![gitlab_ci](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/gitlab-ci.png)
