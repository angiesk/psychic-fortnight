`docker build -t node-app-image .`

`docker run -p 3000:3000 -d --name node-app node-app-image`

`docker exec -it node-app bash`

`docker rm node-app -f`

# file sharing
ps

`docker run -v ${pwd}:/app -p 3000:3000 -d --name node-app node-app-image`

bash
`docker run -v $(pwd):/app -p 3000:3000 -d --name node-app node-app-image`

"dev": "nodemon index.js",
or
/*"dev": "nodemon -L index.js", if you get error on windows*/

`docker ps -a ` all containers

`docker ps` running containers

`docker logs node-app`

how to avoid delete synced files from docker image when deleted local is deleted

create a new volume
# binodes to sync stuff for dev
-v indicates volume
`docker run -v ${pwd}:/app -v /app/node_modules -p 3000:3000 -d --name node-app node-app-image`

 binode allows 2 way sync, ie , docker and write files to local, giving docker readonly permissions below

`docker run -v ${pwd}:/app:ro -v /app/node_modules -p 3000:3000 -d --name node-app node-app-image`

## Passing env vairables
`docker run -v ${pwd}:/app -v /app/node_modules --env PORT=4000 -p 3000:4000 -d --name node-app node-app-image`

`docker run -v ${pwd}:/app -v /app/node_modules -e PORT=4000 -p 3000:4000 -d --name node-app node-app-image`

`docker exec -it node-app bash`
`printenv`
prints env variables

### passing env vars from a file
```
docker run -v ${pwd}:/app -v /app/node_modules --env-file ./.env -p 3000:4000 -d --name node-app node-app-image
```
#### list docker volumes
`docker volume ls`

#### removes all unused volumes
`docker volume prune`

### removes voulme asscoiated with container
`docker rm node-app -fv`

`docker-compose up --build``docker-compose build`
` docker-compose up -d`
`docker compose up`

`docker-compose down`

`docker-compose down -v`

`docker image ls`

docker compose looks for image with the name,
so explictly pass build flag to build new image
`docker-compose up -d --build`

`docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d`
`docker-compose -f docker-compose.yml -f docker-compose.dev.yml down -v`

`docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build`
`docker-compose -f docker-compose.yml -f docker-compose.prod.yml down -v`