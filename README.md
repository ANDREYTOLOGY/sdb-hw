# Домашнее задание к занятию "`Основы Terraform. Yandex Cloud`" - `Чернышов Андрей`

### Задание 1

Для успешного развёртывания ВМ были внесены следующие исправления:  
1. Исправление значения ```platform_id``` , присутствовала орфографическая ошибка в слове standard (было standart).  
2. API Yandex Cloud сообщил, что платформа ```standard-v4``` недоступна в используемой зоне/квоте. В результате была выбрана доступная платформа: ```platform_id = "standard-v3" ``` 
3. Исправление параметра ```core_fraction```. Для платформы ```standard-v3``` допустимы только значения 20, 50, 100. Было выбрано 20.
4. На платформе standard-v3 нельзя использовать 1 ядро. Минимально допустимое значение — 2 ядра. поставил значение: ```cores  = 2 memory = 2```.  
Объём памяти также был увеличен, поскольку в Yandex Cloud он связан с числом ядер и должен соответствовать допустимым комбинациям ресурсов.

Cкриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес
![terraform 1](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform2-1.png)  

скриншот консоли c тем же внешним ip-адресом
![terraform 2](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform2-2.png)  

```preemptible = true``` 
Полезно в обучении, потому что такие ВМ дешевле. Минус — их могут принудительно остановить/удалить.  

```core_fraction```
Параметр уменьшает гарантированную долю CPU и снижает стоимость ВМ — для учебных задач (поднять ВМ, подключиться по SSH, выполнить пару команд) это обычно достаточно.  

В моём случае на платформе standard-v3 значение core_fraction = 5 оказалось недоступно — Yandex Cloud разрешил только 20/50/100, поэтому выставлено 20. Аналогично на standard-v3 минимальное количество ядер оказалось 2, поэтому пришлось использовать cores = 2 (иначе API возвращал ошибку).

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
Вывод docker ps  
![terraform 4](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform-4.png)  

6. Вывод docker ps c исправленным name контейнера  
![terraform 5](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform-5.png)

Terraform применит изменения без показа плана и без вопроса “yes/no”. Можно случайно разрушить/пересоздать ресурсы не в том окружении или не с теми переменными, особенно в проде.  
Основное назначение использования ключа - для автоматизации: CI/CD пайплайны, скрипты деплоя, когда Terraform запускается неинтерактивно.  

7. Cодержимое файла terraform.tfstate после terraform destroy, "resources": [] имеет пустое значение.  
```terraform
  {
  "version": 4,
  "terraform_version": "1.12.2",
  "serial": 15,
  "lineage": "86f9558b-6bdf-e5b1-3022-c2ecade8e431",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

8. В документации kreuzwerker/docker для docker_image параметр keep_locally описан как: если true — образ не удаляется при destroy. Если этот параметр убрать или установить keep_locally = false, то образ будет удалён вместе с ресурсами.  
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.


Листинг main.tf
```terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  required_version = "~>1.12.0"
}
provider "docker" {}


resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "hello_world"

  ports {
    internal = 80
    external = 9090
  }
}
```
