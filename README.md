# acidlynx_microservices
acidlynx microservices repository

Homework 16

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
