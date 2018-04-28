#!/bin/bash

# Bring the services up
function startServices {
  echo ">> Starting hdfs ..."
  docker exec -u hadoop -it nodemaster hadoop/sbin/start-dfs.sh
  echo ">> Starting yarn ..."
  docker exec -u hadoop -d nodemaster hadoop/sbin/start-yarn.sh
  echo ">> Starting Spark ..."
  docker exec -u hadoop -d nodemaster spark/sbin/start-master.sh
  docker exec -u hadoop -d node2 spark/sbin/start-slave.sh nodemaster:7077
  docker exec -u hadoop -d node3 spark/sbin/start-slave.sh nodemaster:7077
}

if [[ $1 = "start" ]]; then
  startServices
  exit
fi

if [[ $1 = "deploy" ]]; then
  docker rm -f `docker ps -aq` # delete old containers
  docker network rm sparknet
  docker network create --subnet=172.18.0.0/16 sparknet # create custom network

  # 3 nodes
  echo ">> Starting nodes master and worker nodes ..."
  docker run -d --net sparknet --ip 172.18.1.1 --hostname nodemaster --add-host node2:172.18.1.2 --add-host node3:172.18.1.3 --name nodemaster -it hadoopbase
  docker run -d --net sparknet --ip 172.18.1.2 --hostname node2  --add-host nodemaster:172.18.1.1 --add-host node3:172.18.1.3 --name node2 -it hadoopbase
  docker run -d --net sparknet --ip 172.18.1.3 --hostname node3  --add-host nodemaster:172.18.1.1 --add-host node2:172.18.1.2 --name node3 -it hadoopbase

  # Format nodemaster
  echo ">> Formatting hdfs ..."
  docker exec -u hadoop -it nodemaster hadoop/bin/hdfs namenode -format
  startServices
  exit
fi

echo "Usage: deploy.sh deploy|run"
echo "                 deploy - create a new Docker network"
echo "                 run    - start the existing containers"
