FROM scalabase:latest

EXPOSE 8081
EXPOSE 8080
EXPOSE 8088
EXPOSE 7077
EXPOSE 9870

RUN useradd -m -s /bin/bash hadoop

WORKDIR /home/hadoop

USER hadoop
COPY --chown=hadoop deps/* /home/hadoop/
RUN tar -zxf hadoop-3.2.0.tar.gz
RUN mv hadoop-3.2.0 hadoop
RUN tar -zxf spark-2.4.0-*.tgz
RUN rm *.tgz
RUN mv spark-2.4.0-* spark
#RUN chown hadoop spark -R

RUN mkdir /home/hadoop/.ssh
RUN mkdir /home/hadoop/hadoop/logs
RUN touch /home/hadoop/hadoop/logs/fairscheduler-statedump.log
RUN echo PubkeyAcceptedKeyTypes +ssh-dss >> /home/hadoop/.ssh/config
RUN echo PasswordAuthentication no >> /home/hadoop/.ssh/config

COPY --chown=hadoop config/id_rsa.pub /home/hadoop/.ssh/id_rsa.pub
COPY --chown=hadoop config/id_rsa /home/hadoop/.ssh/id_rsa
RUN cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
#RUN chown hadoop .ssh -R

RUN echo PATH=/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH >> /home/hadoop/.profile
RUN echo PATH=/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH >> /home/hadoop/.bashrc
RUN mkdir -p /home/hadoop/data/nameNode /home/hadoop/data/dataNode /home/hadoop/data/namesecondary /home/hadoop/data/tmp
#RUN chown hadoop /home/hadoop/data/nameNode /home/hadoop/data/dataNode /home/hadoop/data/namesecondary /home/hadoop/data/tmp /home/hadoop/spark
RUN echo HADOOP_HOME=/home/hadoop/hadoop >> /home/hadoop/.bashrc
#RUN chown hadoop /home/hadoop/.profile /home/hadoop/.bashrc
RUN echo JAVA_HOME=/docker-java-home >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo HDFS_NAMENODE_USER=hadoop >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo HDFS_DATANODE_USER=hadoop >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh                        
RUN echo HDFS_SECONDARYNAMENODE_USER=hadoop >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh

# Spark
RUN echo "export HADOOP_CONF_DIR=/home/hadoop/hadoop/etc/hadoop" >> /home/hadoop/.bashrc
RUN echo "export HADOOP_CONF_DIR=/home/hadoop/hadoop/etc/hadoop" >> /home/hadoop/.profile
RUN echo "export SPARK_DIST_CLASSPATH=\$(hadoop classpath)" >> /home/hadoop/.bashrc
RUN echo "export SPARK_DIST_CLASSPATH=\$(hadoop classpath)" >> /home/hadoop/.profile
RUN echo "export SPARK_HOME=/home/hadoop/spark" >> /home/hadoop/.profile
RUN echo "export SPARK_HOME=/home/hadoop/spark" >> /home/hadoop/.bashrc
COPY --chown=hadoop config/workers /home/hadoop/spark/conf/slaves
COPY --chown=hadoop config/sparkcmd.sh /home/hadoop/
#RUN chown hadoop /home/hadoop/*

COPY --chown=hadoop config/core-site.xml config/hdfs-site.xml config/mapred-site.xml config/yarn-site.xml config/workers /home/hadoop/hadoop/etc/hadoop/
#RUN chown hadoop /home/hadoop/hadoop/etc/hadoop/*
USER root
#ENTRYPOINT ["/home/hadoop/sparkcmd.sh","start"]
CMD service ssh start && sleep infinity
