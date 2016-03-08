# docker-kanboard
Kanboard.net in a docker container

# Usage
Create the image with something like:
```
docker create -P -v <localhostdirectory>:/var/www/html/data:z <imageid>
docker start <containerid>
```
