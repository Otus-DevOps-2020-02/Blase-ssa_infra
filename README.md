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
