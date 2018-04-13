
docker rm -f `docker ps -aq` # delete old containers
docker network rm sparknet
docker network create --subnet=172.18.0.0/16 sparknet # create custom network

# 3 nodes
docker run -d --net sparknet --ip 172.18.1.1 --hostname nodemaster --add-host node2:172.18.1.2 --add-host node3:172.18.1.3 --name nodemaster -it hadoopbase
docker run -d --net sparknet --ip 172.18.1.2 --hostname node2  --add-host nodemaster:172.18.1.1 --add-host node3:172.18.1.3 --name node2 -it hadoopbase
docker run -d --net sparknet --ip 172.18.1.3 --hostname node3  --add-host nodemaster:172.18.1.1 --add-host node2:172.18.1.2 --name node3 -it hadoopbase
