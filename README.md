# acidlynx_microservices
acidlynx microservices repository

## Homework 16

1. Installed docker, docker-machine
2. Worked with docker and remote docker (yandex-cloud instance via docker-machine)
3. Created Dockerfile, built new image and pushed it to DockerHub.

Useful commands:

```bash
docker ps # list of docker runnable containers
docker ps -a # list of all docker containers
docker images # list of docker images
docker run -it ubuntu:18.04 /bin/bash #run container and cmd inside
docker start <container_id>
docker attach <container_id>
docker run -it #foreground mode with TTY (docker attach)
docker run -d #background mode
docker exec <container_id> bash #run bash inside container
docker commit <container_id> tag/name
docker kill <container_id> #kill process in container
docker kill $(docker ps -q) #kill all processes in all containers
docker system df #disk usage
docker rm #delete container
docker rmi #delete image

yc compute instance create # create cloud instance
docker-machine create <name> # initialise cloud machine with docker
eval $(docker machine env <name>) #switch context to anohter docker-machine instance
eval $(docker-machine env --unset) #switch contect to local docker
docker-machine rm #remove cloud machine with docker
docker-machine ls #list of machines

docker build -t reddit:latest . # build docker image from current container
docker run --name reddit -d --network host reddit:latest

docker tag reddit:latest <your-login>/otus-reddit:1.0 # tag image
docker push <your-login>/otus-reddit:1.0 # push image to hub (or any other repo)
```

## Homework 18

`docker-compose` has option -p for --project-name in commands

## Homework 21

How to create docker-host and use it with docker-machine

```bash
yc compute instance create \
  --name docker-host \
  --zone ru-central1-a \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=15 \
  --ssh-key ~/.ssh/yandexcloud_appuser_rsa.pub 
	
docker-machine create \
  --driver generic \
  --generic-ip-address=178.154.225.52 \
  --generic-ssh-user yc-user \
  --generic-ssh-key ~/.ssh/yandexcloud_appuser_rsa \
  docker-host
  
eval $(docker-machine env docker-host)
```

Do the same command in several folders

```bash
for i in ui post-py comment; do cd src/$i; bash docker_build.sh; cd -; done
```

Docker hub is [here](https://hub.docker.com/u/binira)
