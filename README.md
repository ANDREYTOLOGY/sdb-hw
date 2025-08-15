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

1. `Скриншот "Configuration > Hosts":`
   ![Zabbix-hosts](https://github.com/ANDREYTOLOGY/zabbixx-hw/blob/main/img/zabbix-hosts.png)
  ` Для выполнения данного пункта использовались команды`

   ![git_push](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/push_mygitlab.png)
2. `Скриншот лога Zabbix Agent:`
   ![Zabbix-agent](https://github.com/ANDREYTOLOGY/zabbixx-hw/blob/main/img/zabbix-agent.png)
3. `Скриншот "Monitoring > Latest data":`
   ![Zabbix-Latest-data](https://github.com/ANDREYTOLOGY/zabbixx-hw/blob/main/img/zabbix_latest.png)
 
5. ` Для выполнения данного пункта использовались команды`
```bash
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.0+ubuntu22.04_all.deb
dpkg -i zabbix-release_latest_7.0+ubuntu22.04_all.deb
apt update
apt install zabbix-agent
systemctl restart zabbix-agent
systemctl enable zabbix-agent
```
