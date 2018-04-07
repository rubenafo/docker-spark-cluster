
docker rm -f `docker ps -a | grep scalabase | cut -d\  -f1` # delete old containers
docker network rm sparknet
docker network create --subnet=172.18.0.0/16 sparknet # create custom network

# 3 nodes
docker run -d --net sparknet --ip 172.18.0.2 --hostname node1 -it scalabase
docker run -d --net sparknet --ip 172.18.0.3 --hostname node2 -it scalabase
docker run -d --net sparknet --ip 172.18.0.4 --hostname node3 -it scalabase
