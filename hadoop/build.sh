
ssh-keygen -t rsa -P '' -f config/id_rsa

docker build . -t hadoopbase
