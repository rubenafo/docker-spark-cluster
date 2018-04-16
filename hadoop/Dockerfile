FROM scalabase:latest

EXPOSE 22/tcp
EXPOSE 22/udp

RUN useradd -m -s /bin/bash hadoop

WORKDIR /home/hadoop
COPY deps/hadoop-3.1.0.tar.gz /home/hadoop
RUN tar -zxf hadoop-3.1.0.tar.gz
RUN mv hadoop-3.1.0 hadoop

RUN mkdir /home/hadoop/.ssh
RUN echo PubkeyAcceptedKeyTypes +ssh-dss >> /home/hadoop/.ssh/config
RUN echo PasswordAuthentication no >> /home/hadoop/.ssh/config

COPY config/id_rsa.pub /home/hadoop/.ssh/id_rsa.pub
COPY config/id_rsa /home/hadoop/.ssh/id_rsa
RUN cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
RUN chown hadoop .ssh -R

RUN echo PATH=/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH >> /home/hadoop/.profile
RUN echo PATH=/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH >> /home/hadoop/.bashrc
RUN mkdir -p /home/hadoop/data/nameNode /home/hadoop/data/dataNode /home/hadoop/data/namesecondary /home/hadoop/data/tmp
RUN chown hadoop /home/hadoop/data/nameNode /home/hadoop/data/dataNode /home/hadoop/data/namesecondary /home/hadoop/data/tmp
RUN echo HADOOP_HOME=/home/hadoop/hadoop >> /home/hadoop/.bashrc
RUN chown hadoop /home/hadoop/.profile /home/hadoop/.bashrc
RUN echo JAVA_HOME=/docker-java-home >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo HDFS_NAMENODE_USER=hadoop >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo HDFS_DATANODE_USER=hadoop >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh                        
RUN echo HDFS_SECONDARYNAMENODE_USER=hadoop >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh

COPY config/core-site.xml config/hdfs-site.xml config/mapred-site.xml config/yarn-site.xml config/workers /home/hadoop/hadoop/etc/hadoop/
RUN chown hadoop /home/hadoop/hadoop/etc/hadoop/*
