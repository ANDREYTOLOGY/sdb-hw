# Домашнее задание к занятию "`Практическое применение Docker`" - `Чернышов Андрей`

### Задание 1

BIND 9.4.1 < 9.4.2 - Remote DNS Cache Poisoning (Metasploit) https://www.exploit-db.com/exploits/6122  

Samba 3.0.20 < 3.0.25rc3 - 'Username' map script' Command Execution (Metasploit)  https://www.exploit-db.com/exploits/16320  

PostgreSQL 8.3.6 - Conversion Encoding Remote Denial of Service   https://www.exploit-db.com/exploits/32849  

Apache Tomcat 5.5.15 - cal2.jsp Cross-Site Scripting  https://www.exploit-db.com/exploits/30563  

![Kali 1](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/kali1.png)

### Задание 2

SYN-сканирование выглядит почти как обычное подключение. Kali отправляет SYN, сервер, если порт открыт, отвечает SYN/ACK. После чего соединение сразу обрывается. Если порт закрыт — сервер отвечает RST.  

FIN-сканирование отправляет странный TCP-пакет с флагом FIN без установленного соединения. Закрытые порты отвечают RST, а открытые обычно вообще не отвечают. В итоге вывод делается по тому, есть ответ или нет.  

Xmas-сканирование похоже на FIN, только пакет содержит сразу несколько флагов (FIN, PSH, URG). Сервер реагирует почти так же: закрытые порты шлют RST, открытые молчат.  

UDP-сканирование работает совсем иначе. Kali просто отправляет UDP-пакеты. Если порт закрыт, сервер отвечает ICMP «port unreachable». Если порт открыт, он может ответить данными или не ответить вообще.  

В целом разница между режимами — в типах отправляемых пакетов и в том, как сервер на них реагирует: TCP-сканы работают через флаги TCP, а UDP-скан — через ICMP-ошибки или без ответа.


