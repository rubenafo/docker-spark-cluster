# docker-spark-cluster
Build your own Spark cluster setup in Docker.      
A multinode Spark installation where each node of the network runs in its own separated Docker container.   
The installation takes care of the Hadoop & Spark configuration, providing:
1) a debian image with scala and java9 (scalabase image)
2) three fully configured Spark nodes running on Hadoop (sparkbase image):
    * nodemaster (master node)
    * node2      (slave)
    * node3      (slave)

## Motivation
You can run Spark in a (boring) standalone setup or create your own network to hold a full cluster setup inside Docker.   
I find the latter much more fun:
* you can experiment with an almost-real network setup
* experience network issues from wrong Hadoop installation
* simulate scalability, downtimes and rebalance by adding/removing nodes to the network automagically

## Installation
1) Clone this repository
2) cd scalabase
3) ./build.sh    # This builds the base java+scala debian container from openjdk9
4) cd spark
5) ./build.sh    # This builds sparkbase image
6) run ./deploy.sh deploy
7) The script will finish displaying the Hadoop and Spark admin URLs:
    * Hadoop info @ nodemaster: http://172.18.1.1:8088/cluster
    * Spark info @ nodemater  : http://172.18.1.1:8080/

## Options
```bash
docker-spark-cluster/deploy.sh stop   # Stop the cluster
docker-spark-cluster/deploy.sh start  # Start the cluster

# Warning! This will remove everything from HDFS
docker-spark-cluster/deploy.sh deploy # Format the cluster and deploy images again
```
