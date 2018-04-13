FROM scalabase:latest

EXPOSE 22/tcp
EXPOSE 22/udp

RUN adduser -h /home/hadoop -D -s /bin/bash hadoop
RUN echo hadoop:hadoop | chpasswd

#USER hadoop
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

RUN echo export PATH=/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH >> /home/hadoop/.profile
RUN chown hadoop /home/hadoop/.profile

COPY config/core-site.xml config/hdfs-site.xml config/mapred-site.xml config/yarn-site.xml config/slaves /home/hadoop/hadoop/etc/
