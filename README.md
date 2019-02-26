# docker-spark-cluster
Build your own Spark cluster setup in Docker.      
A multinode Spark installation where each node of the network runs in its own separated Docker container.   
The installation takes care of the Hadoop & Spark configuration, providing:
1) a debian image with scala and java (scalabase image)
2) four fully configured Spark nodes running on Hadoop (sparkbase image):
    * nodemaster (master node)
    * node2      (slave)
    * node3      (slave)
    * node4      (slave)

## Motivation
You can run Spark in a (boring) standalone setup or create your own network to hold a full cluster setup inside Docker instead.   
I find the latter much more fun:
* you can experiment with a more realistic network setup
* tweak nodes configuration
* simulate scalability, downtimes and rebalance by adding/removing nodes to the network automagically   

There is a Medium article related to this: https://medium.com/@rubenafo/running-a-spark-cluster-setup-in-docker-containers-573c45cceabf

## Installation
1) Clone this repository
2) cd scalabase
3) ./build.sh    # This builds the base java+scala debian container from openjdk9
4) cd ../spark
5) ./build.sh    # This builds sparkbase image
6) run ./cluster.sh deploy
7) The script will finish displaying the Hadoop and Spark admin URLs:
    * Hadoop info @ nodemaster: http://172.18.1.1:8088/cluster
    * Spark info @ nodemaster : http://172.18.1.1:8080/
    * DFS Health @ nodemaster : http://172.18.1.1:9870/dfshealth.html

## Options
```bash
cluster.sh stop   # Stop the cluster
cluster.sh start  # Start the cluster
cluster.sh info   # Shows handy URLs of running cluster

# Warning! This will remove everything from HDFS
cluster.sh deploy # Format the cluster and deploy images again
```
