#!/bin/bash


declare -a INSTANCE_AR=('' '')

function startec2() {
aws ec2 start-instances --instance-ids $1
}

for i in "${INSTANCE_AR[@]}"
do
  startec2 $i
  echo $i "started"
done


