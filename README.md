# Blase-ssa_infra
Blase-ssa Infra repository

# Выполнено ДЗ №3
Знакомство_с_облачнои__инфраструктурои (Cloud-bastion)

# В процессе сделано:
 - создано 2 инстанса VM
	- с внешним IP и доступом во внутреннюю сеть (bastion)
	- только с внутренним IP (someinternalhost)
 - произведена проверка доступа к someinternalhost по SSH через бастион
	- для доступа к someinternalhost можно воспользоваться командой:
	``` ssh -J appuser@<bastion external IP> appuser@<someinternalhost internal IP> ```
	- можно создать алиас воспользовавшись командой
	``` echo "alias someinternalhost=\"ssh -i ~/.ssh/appuser -A -J appuser@<ext. IP> appuser@<int. IP>\"" >> ~/.bashrc ```
	``` echo "alias someinternalhost=\"ssh -i ~/.ssh/appuser -A -J appuser@<ext. IP> appuser@<int. IP>\"" >> ~/.zshrc ```
 - Настрока OpenVPN сервера на базе pritunl
bastion_IP = 35.217.41.14
someinternalhost_IP = 10.166.0.3

 - решена проблема с сертификатом https://35.217.41.14.sslip.io

# Выполнено ДЗ №4

Деплой тестового приложения (Cloud-testapp)

# В процессе сделано:
 - установлен и настроен gcloud для работы с аккаунтом GCP
 - создан хост reddit-app с помощью gcloud
 - установлен ruby
 - Установлен MongoDB
 - установлено и запущено тестовое приложение Monolith Reddit
 - созданы скрипты:
	- install_ruby.sh
	- install_mongodb.sh
	- deploy.sh
	- startup.sh

## Как проверить работоспособность:
 - для проверки достаточно открыть страницу http://35.228.74.27:9292/
 - проверочные данные для TravisCI
testapp_IP = 35.228.74.27
testapp_port = 9292
 - для проверки startup.sh можно воспользоваться командой
``` gcloud compute instances create reddit-app-2 --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup.sh ```

 - запуск startup.sh с использованием
``` gcloud compute instances create reddit-app-2 --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata startup-script-url=gs://blase-bucket/startup.sh  ```

## Дополнительное задание
 - посмотреть список правил
``` gcloud compute firewall-rules list ```
- удаление правила созданного через веб интерфейс
``` gcloud compute firewall-rules delete default-puma-server ```
- создание нового правила
```  gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --description 'puma server' ```

## PR checklist
 - [ ] Выставил label с номером домашнего задания
 - [ ] Выставил label с темой домашнего задания

# Выполнено ДЗ №5

СборкаобразовVM припомощи Packer

# В процессе сделано:

- установлен Packer
- создан ADC с помощью gcloud
- создано 2 Packer template:
  - ubuntu16.json
  - immutable.json
- параметризована часть переменных в шаблонах, в рамках самостоятельной работы
- создан variables.json для переопределния переменных
- выполнены задания со *

## Как проверить работоспособность:

- проверить корректность шаблонов можно командами
```
	packer validate .\ubuntu16.json
	packer validate .\immutable.json
```
- проверить выполнение шаблона
```
	packer build .\ubuntu16.json -var-file=variables.json
	packer build .\immutable.json -var-file=variables.json -var 'source_image_family=reddit-base'
```
- далее надо выполнить скрипт create-reddit-vm.sh

## PR checklist
 - [ ] Выставил label с номером домашнего задания
 - [ ] Выставил label с темой домашнего задания
