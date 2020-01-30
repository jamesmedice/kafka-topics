  
#!/bin/bash

# script: kafka-create-topics.sh
# script description: creates kafka topics
# build Stage: Alpha
# Author: tiago medice (@a73s)



# *********** Creating Kafka Topics**************
#Reference: split string into an array in bash
source ./.env
source ./config

IFS=', ' read -r -a topics <<< "$KAFKA_CREATE_TOPICS"

for t in ${topics[@]}; do 
  echo "[INSTALLATION-INFO] Creating Kafka Topic : ${t} "
  echo "${KAFKA_HOME}/bin/kafka-topics.sh --create --zookeeper ${ZOOKEEPER_NAME}:2181 --replication-factor ${REPLICATION_FACTOR} --partitions ${PARTITIONS} --topic ${t} --if-not-exists "
done

wait