FROM scalabase:latest

WORKDIR /home/hadoop
COPY ../deps/hadoop-3.1.0.tar.gz /home/hadoop
RUN tar -zxf hadoop-3.1.0.tar.gz

RUN apk add --no-cache openssh
RUN ssh-keygen -b 4096

CMD ["bash"]
