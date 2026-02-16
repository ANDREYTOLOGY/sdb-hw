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
Вывод docker ps  
![terraform 4](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform-4.png)  

6. Вывод docker ps c исправленным name контейнера    
![terraform 5](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/terraform-4.png)

Terraform применит изменения без показа плана и без вопроса “yes/no”. Можно случайно разрушить/пересоздать ресурсы не в том окружении или не с теми переменными, особенно в проде.  
Основное назначение использования ключа - для автоматизации: CI/CD пайплайны, скрипты деплоя, когда Terraform запускается неинтерактивно.  

7. Cодержимое файла terraform.tfstate.  
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

