# Домашнее задание к занятию "`Введение в Terraform`" - `Чернышов Андрей`

### Задание 1

1. проверка версии Terraform 
![terraform 1](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform-1.png)  

terraform init  
![terraform 2](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform-2.png)  

2. Допустимо хранить секреты в файле personal.auto.tfvars, потому что он явно игнорируется .gitignore и при этом Terraform автоматически подхватывает *.auto.tfvars.
3. Ключ: R19u1dLdgOHZ7x44
![terraform 3](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform-3.png)

4. Ошибка в объявлении ресурса docker_image: нет имени ресурса, выполнено исправление, добавлено имя "nginx"
Неверная ссылка на docker_image, в исходнике ресурса docker_image вообще не объявлен как "nginx" (там нет имени). После исправления из пункта 1 ссылка стала валидной.
Ошибка в переменной имени resource "docker_image" "1nginx". Имя ресурса в Terraform не может начинаться с цифры.  
Неверная ссылка на random_password. Ресурса random_password с именем random_string_FAKE не существует, атрибут resulT написан с ошибкой регистра: должно быть result.

5. Исправленный фрагмент кода:
```terraform
   resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"
```



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
