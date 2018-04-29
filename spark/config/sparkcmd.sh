#!/bin/bash

export USER=hadoop
source .profile
if [[ $1 = "start" ]]; then
  if [[ $HOSTNAME = "nodemaster" ]]; then
     ~/spark/sbin/start-master.sh
     exit
  fi
  ~/spark/sbin/start-slave.sh nodemaster:7077
  exit
fi

if [[ $1 = "stop" ]]; then
  if [[ $HOSTNAME = "nodemaster" ]]; then
     ~/spark/sbin/stop-master.sh
     exit
  fi
  ~/spark/sbin/stop-slave.sh
fi
