
ssh-keygen -t rsa -P '' -f config/id_rsa

mkdir -p deps
wget http://mirrors.whoishostingthis.com/apache/hadoop/common/hadoop-3.1.0/hadoop-3.1.0.tar.gz -P ./deps
docker build . -t hadoopbase
