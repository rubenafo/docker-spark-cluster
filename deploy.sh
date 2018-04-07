
docker rm -f `docker ps -a | grep scalabase | cut -d\  -f1` # delete old containers
docker network rm sparknet
docker network create --subnet=172.18.0.0/16 sparknet # create custom network

# 3 nodes
docker run -d --net sparknet --ip 172.18.1.1 --hostname node1 --add-host node2:172.18.1.2 --add-host node3:172.18.1.3 -it scalabase
docker run -d --net sparknet --ip 172.18.1.2 --hostname node2 --add-host node1:172.18.1.1 --add-host node3:172.18.1.3 -it scalabase
docker run -d --net sparknet --ip 172.18.1.3 --hostname node3 --add-host node1:172.18.1.1 --add-host node2:172.18.1.2 -it scalabase
