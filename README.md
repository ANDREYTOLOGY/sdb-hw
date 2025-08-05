# Домашнее задание к занятию "`GitLab`" - `Чернышов Андрей`

### Задание 1

`GitLab был установлен локально на сервере Ubuntu 24.04`

![Версия Gitlab](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/gitlab_install.png)


```
Создайте новый проект и пустой репозиторий в нём.

```
Зарегистрируйте gitlab-runner для этого проекта и запустите его в режиме Docker. Раннер можно регистрировать и запускать на той же виртуальной машине, на которой запущен GitLab.
![Этапы регистрации gitlab-runner](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/runner-registration.png)
```
В качестве ответа в репозиторий шаблона с решением добавьте скриншоты с настройками раннера в проекте.
```
  ![Запущенный gitlab-runner](https://github.com/ANDREYTOLOGY/gitlab-hw/blob/main/img/runner.png)




---

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
