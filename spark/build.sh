
echo "Y" | ssh-keygen -t rsa -P '' -f config/id_rsa

mkdir -p deps

# Uncomment to retrieve the dependencies
#wget http://mirrors.whoishostingthis.com/apache/hadoop/common/hadoop-3.1.0/hadoop-3.1.0.tar.gz -P ./deps
#wget http://mirrors.whoishostingthis.com/apache/spark/spark-2.3.0/spark-2.3.0-bin-without-hadoop.tgz -P ./deps

docker build . -t sparkbase
