from openjdk:8

USER root
EXPOSE 22/tcp
EXPOSE 22/udp

# In China, apt-get did not work, you should add follow order to change your mirror.
# RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.163\.com\/ubuntu\//g' /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server vim

WORKDIR /tmp
RUN wget https://downloads.lightbend.com/scala/2.12.5/scala-2.12.5.tgz && \
    tar xzf scala-2.12.5.tgz && \
    mv scala-2.12.5 /usr/share/scala && \
    ln -s /usr/share/scala/bin/* /usr/bin && \ 
    rm scala-2.12.5.tgz && \
\
    echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config && \
    echo "Host *" >> /etc/ssh/ssh_config

CMD service ssh start && sleep infinity
