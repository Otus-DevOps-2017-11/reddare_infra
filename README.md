reddare_infra
##### Anton Olifir
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
--metadata "startup-script-url=https://storage.googleapis.com/reddare-infra/gcp_startup.sh"
```
gcloud startup script:
```
#!/bin/sh

#ruby installation
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

#mongodb installation
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

#deploy puma app
git clone https://github.com/Otus-DevOps-2017-11/reddit.git
cd reddit && bundle install
puma -d
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
