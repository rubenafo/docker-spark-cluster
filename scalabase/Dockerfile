from openjdk:8

USER root
EXPOSE 22/tcp
EXPOSE 22/udp

RUN apt-get update
RUN apt-get install -y --no-install-recommends openssh-server vim

WORKDIR /tmp
RUN wget https://downloads.lightbend.com/scala/2.12.5/scala-2.12.5.tgz
RUN tar xzf scala-2.12.5.tgz
RUN mv scala-2.12.5 /usr/share/scala
RUN ln -s /usr/share/scala/bin/* /usr/bin 
RUN rm scala-2.12.5.tgz

RUN echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config
RUN echo "Host *" >> /etc/ssh/ssh_config
CMD service ssh start && sleep infinity
