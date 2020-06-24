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
 	``` gcloud compute instances create reddit-app-2 --boot-disk-size=10GB \
		--image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud \
		--machine-type=g1-small --tags puma-server --restart-on-failure \
		--metadata-from-file startup-script=startup.sh ```
 - запуск startup.sh с использованием
 	``` gcloud compute instances create reddit-app-2 --boot-disk-size=10GB \
		--image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud \
		--machine-type=g1-small --tags puma-server --restart-on-failure \
		--metadata startup-script-url=gs://blase-bucket/startup.sh  ```

## PR checklist
 - [ ] Выставил label с номером домашнего задания
 - [ ] Выставил label с темой домашнего задания
