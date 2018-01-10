-------------
## HOMEWORK 5

**ssh multihop to internal host throught bastion:**
```
ssh -At user@bastionhost ssh internalhost
```
**ssh config (.ssh/config) for alias:**
```
Host bastion  
Hostname 35.195.87.230
IdentityFile ~/.ssh/id_rsa  
User username

Host internal
Hostname 10.132.0.3
User username
ProxyJump bastion
```
use **ssh internal** get internalhost

-------------
Host **bastion**, IP:35.195.87.230, internal IP:10.132.0.2

Host **internalhost**, internal IP:10.132.0.3

-------------
## HOMEWORK 6

gcloud startup script metadata added:
```
gcloud compute instances create reddit-app\       
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
--zone=europe-west3-b \
--metadata-from-file startup-script=gcp_startup.sh
```

-------------
## HOMEWORK 7

validate packer image:
```
packer validate -var-file=variables.json immutable.json
```
build packer image:
```
packer build -var-file=variables.json immutable.json
```
gcloud vm from packer image:
```
config-scripts/create-reddit-vm.sh
```

-------------
## HOMEWORK 8

**task 1**
- при добавлении ssh метаданных appuser1 поверх уже существующего appuser, старые данные будут заменены новыми, т.е. останется только ключ appuser1, который и описан в terraform

- при добавлении ssh метаданных пользователeй appuser1 и appuser2 будет возможно подключение под обеими пользоватлеям, оба публичных ключа также будут указаны в метадате

- при добавлении ssh метаданных пользователя appuser_web они перестанут быть доступны после применения terraform apply, метаданные будут обновлены в соответствие с теми, что описаны в terraform

-------------
**task 2**
- в конфиг main.tf добавлено описание ко второй задаче со звездочкой
- в конфиг outputs.tf добавлен вывод всех необходимых условий

-------------
## HOMEWORK 9

<img align="left" style="padding-right: 30px" src="./assets/terraform_tree.png?raw=true">

* Созданы 2 окружения: ***stage***; ***prod***;
* Параметризированны конфигурации модулей
* Конфигурационные файлы отформатированны 

