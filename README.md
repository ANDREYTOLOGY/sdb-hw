# Домашнее задание к занятию "`Защита хоста`" - `Чернышов Андрей`

### Задание 1

Показано содержимое каталога ~/plain пользователя cryptouser до шифрования.  
В каталоге находятся обычные текстовые файлы secret1.txt и secret2.txt, доступные для чтения.  
![host 1](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/host-1.png)  
Отображается домашний каталог пользователя после включения eCryptfs.  
Каталог .Private содержит зашифрованные файлы с нечитаемыми именами, что подтверждает применение шифрования.
![host 2](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/host-2.png)  

### Задание 2
Создан файл-контейнер размером 100 МБ и подключён как loop-устройство /dev/loop0.
Это устройство будет использовано для последующего шифрования с помощью LUKS.
![host 2](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/host-3.png)  
Выполнена команда cryptsetup luksFormat /dev/loop0.
Показано предупреждение об удалении данных и ввод пароля, что подтверждает успешную инициализацию LUKS-шифрования.  
![host 2](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/host-4.png)  
Создана файловая система ext4 на зашифрованном устройстве /dev/mapper/secure100, выполнено монтирование в каталог /mnt/secure100.  
Команда df -h подтверждает наличие подключённого зашифрованного раздела.
![host 2](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/host-5.png)  
В зашифрованный раздел записан файл secret.txt с содержимым TOP SECRET DATA, после чего раздел размонтирован и закрыт.  
Вывод hexdump устройства /dev/loop0 показывает нечитаемые зашифрованные данные, подтверждая работу LUKS.
![host 2](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/host-6.png)  
