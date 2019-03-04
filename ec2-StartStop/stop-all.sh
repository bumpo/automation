#!/bin/bash


declare -a INSTANCE_AR=('' '')

function stopec2() {
aws ec2 stop-instances --instance-ids $1
}

for i in "${INSTANCE_AR[@]}"
do
  stopec2 $i
  echo $i "started"
done

