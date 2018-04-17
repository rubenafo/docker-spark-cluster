# docker-hadoop-cluster
Build your own hadoop cluster inside Docker (Spark coming soon :hammer:).      
A real multinode Hadoop installation where each node of the network runs in its own, separate docker container.   
The installation takes care of the Hadoop configuration and setup:
1) generates a debian image with scala and java9 (scalabase image)
2) generates three fully configured Hadoop nodes (hadoopbase image):
    * nodemaster (master node...)
    * node2
    * node3

## Motivation
You can run Hadoop in a (boring) single-node setup or create your own network to hold a full multinode setup inside Docker.   
I find the latter much more fun:
* you can experiment with an almost-real network setup
* experience network issues from wrong Hadoop installation
* bring new nodes up and down to simulate scalability/downtimes and see how Hadoop performs.

## Installation
1) Clone this repository
2) cd scalabase
3) ./build.sh    # This builds the base java+scala debian container from openjdk9
4) cd hadoop
5) ./build.sh    # This builds hadoopbase image
6) run ./deploy.sh
7) docker ps -a shows:
   * nodemaster container
   * node2
   * node3
