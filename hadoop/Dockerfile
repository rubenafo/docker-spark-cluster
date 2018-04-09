FROM scalabase:latest

WORKDIR /home/hadoop
COPY deps/hadoop-3.1.0.tar.gz /home/hadoop
RUN tar -zxf hadoop-3.1.0.tar.gz
RUN mv hadoop-3.1.0 hadoop
RUN echo PATH=/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH >> /home/hadoop/.profile

#COPY config/master_id_rsa.pub .id_rsa.pub
#RUN ssh-copy-id -i $HOME/.id_rsa.pub hadoop@node-master

COPY config/core-site.xml config/hdfs-site.xml config/mapred-site.xml config/yarn-site.xml config/slaves /home/hadoop/hadoop/etc/

CMD ["bash"]
