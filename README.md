docker-CentOS-oracle-xe-11g
============================

Oracle Express Edition 11g Release 2 on CentOS 7

This **Dockerfile** is a [trusted build](https://hub.docker.com/r/muboch/docker-centos-oracle-xe-11g/) of [Docker Registry](https://registry.hub.docker.com/).

### Installation
```
docker pull docker pull muboch/docker-centos-oracle-xe-11g
```

Run with 22 and 1521 ports opened:
```
docker run -d -p 49160:22 -p 49161:1521 muboch/docker-centos-oracle-xe-11g
```

Connect database with following setting:
```
port: 49161
hostname: localhost
sid: xe
username: system
password: oracle
```

Password for SYS & SYSTEM
```
oracle
```

Login by SSH or exec (both variants works)
```
docker exec -it docker_name /bin/bash
ssh root@localhost -p 49160
password: admin
```
