from openjdk:8-jdk-alpine

USER root

RUN apk add --no-cache wget bash

WORKDIR /tmp
RUN wget https://downloads.lightbend.com/scala/2.12.5/scala-2.12.5.tgz
RUN tar xzf scala-2.12.5.tgz
RUN mv scala-2.12.5 /usr/share/scala
RUN ln -s /usr/share/scala/bin/* /usr/bin 
RUN rm scala-2.12.5.tgz

CMD ["bash"]
