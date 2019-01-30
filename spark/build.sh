
echo "Y" | ssh-keygen -t rsa -P '' -f config/id_rsa

if [ ! -d "deps" ]; then
  mkdir -p deps
  echo "Downloading hadoop, spark dependencies"
  wget https://archive.apache.org/dist/hadoop/core/hadoop-3.2.0/hadoop-3.2.0.tar.gz -P ./deps
  wget https://archive.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-bin-without-hadoop.tgz -P ./deps
else
  echo "Dependencies found, skipping retrieval..."
fi

docker build . -t sparkbase
