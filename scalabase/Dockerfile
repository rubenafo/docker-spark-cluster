from openjdk:8-jdk-alpine

USER root

RUN apk add --no-cache wget bash openssh

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

WORKDIR /tmp
RUN wget https://downloads.lightbend.com/scala/2.12.5/scala-2.12.5.tgz
RUN tar xzf scala-2.12.5.tgz
RUN mv scala-2.12.5 /usr/share/scala
RUN ln -s /usr/share/scala/bin/* /usr/bin 
RUN rm scala-2.12.5.tgz

RUN echo PubkeyAuthentication yes >> /etc/ssh/ssh_config
RUN echo Host * >> /etc/ssh/ssh_config
#RUN echo GSSAPIauthentication yes >> /etc/ssh/ssh_config
#RUN echo PermitRootLogin yes >> /etc/ssh/ssh_config
CMD /usr/sbin/sshd -D && bash
