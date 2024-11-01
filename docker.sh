# Delete all containers 
docker rm -f $(docker ps -aq)

# Create network 
docker network create flask-network

# Create volume 
docker volume create flask-volume

# Build the Flask image from Dockerfile
docker build -t tgg1818/flask flask-app 

# Build the MySQL image from Dockerfile
docker build -t tgg1818/mysql-db db

# Run MySQL container
docker run -d --name mysql \
    --network flask-network \
    --mount source=flask-volume,target=/var/lib/mysql \
    tgg1818/mysql-db 
# Run Flask container
docker run -d \
    --name flask-app \
    --network flask-network \
    -e MYSQL_ROOT_PASSWORD=password \
    tgg1818/flask 

# Run NGINX container 
# Bind mount for the NGINX configuration file and connect to network
docker run -d \
    --name nginx \
    --network flask-network \
    -p 80:80 \
    --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
    nginx
# Show running containers
docker ps -a
