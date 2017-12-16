re_infra
##### Anton Olifir
-------------
## HOMEWORK 5
-------------
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
