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


### Задание 2

Проверка выполнена командой terraform plan  
![terraform 3](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform2-3.png)  

В main.tf все ранее захардкоженные значения, для ресурсов yandex_compute_image и yandex_compute_instance заменены на переменные.

Исправленный фрагмент кода в main.tf:  
```terraform
data "yandex_compute_image" "ubuntu" {
   family = var.vm_web_image_family
}
resource "yandex_compute_instance" "platform" {
   name = var.vm_web_name
   platform_id = var.vm_web_platform_id

  resources {

    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction

  }
```

### Задание 3

Cкриншот ЛК Yandex Cloud с созданной ВМ db  
![terraform 1](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform2-4.png)  

### Задание 4

Cкриншот вывода команды terraform output  
![terraform 1](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform2-5.png)  

### Задание 5

В файле locals.tf создан один блок locals {}.

В нём определены локальные переменные имён ВМ с интерполяцией из нескольких переменных Terraform 
