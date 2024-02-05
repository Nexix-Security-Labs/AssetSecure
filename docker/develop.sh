#!/bin/bash

#docker run -v docker start mysql
# docker run --name assetsecure-mysql -e MYSQL_ROOT_PASSWORD=my_crazy_super_secret_root_password -e MYSQL_DATABASE=assetsecureit -e MYSQL_USER=assetsecureit -e MYSQL_PASSWORD=whateverdood -d mysql
docker run -d assetsecure-mysql
#docker run -d -v ~/Documents/assetsecureyhead/assetsecure-it/:/var/www/html -p $(boot2docker ip)::80   --link assetsecure-mysql:mysql --name=assetsecureit assetsecureit
docker run --link assetsecure-mysql:mysql -d -p 40000:80 --name=assetsecure-it -v ~/Documents/assetsecureyhead/assetsecure-it/:/var/www/html \
-v ~/Documents/assetsecureyhead/assetsecure-it-storage:/var/lib/assetsecureit --env-file docker.env assetsecure-test
