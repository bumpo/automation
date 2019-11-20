#!/bin/bash


profile=${1:- default}

#fucntion to convert white space to comma
function commatime () {
sed -e 's/\s\+/,/g' $1 > $1.csv
rm $1 &>/dev/null
}

#run audit in default region

for region in `aws ec2 describe-regions --output text | cut -f3`; do      
    echo -e "\nListing-Instances-in-region:'$region'..."
    /bin/aws ec2 describe-instances --profile $profile --region $region --filters --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,InstanceType,Platform,State.Name,Tags[?Key==`Name`].Value[]]' --output text | sed '$!N;s/\n/ /' 
done  > ec2-$profile

#convert space to commans for gsheet import
commatime ec2-$profile 

for region in `aws ec2 describe-regions --output text | cut -f3`; do      
    echo -e "\nListing-Instances-in-region:'$region'..."
    aws rds describe-db-instances --profile $profile --region $region | grep ENDPOINT | awk '{print $2}' 
done > rds-$profile

commatime rds-$profile

