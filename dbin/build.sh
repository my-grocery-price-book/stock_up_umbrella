#!/usr/bin/env bash
docker-compose build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg PWD=$(pwd) --build-arg USER_HOME=$(echo $HOME) --build-arg UNAME=$(whoami)