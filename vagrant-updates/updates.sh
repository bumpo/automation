#!/bin/bash

#sourcing paths

source /home/iws/scripts/paths.sh

echo $PATH

### bash script to update vagrant templates in place. ###

#variables
now=$(date +"%m_%d_%Y")
RED='\033[0;31m'
NC='\033[0m'

#function to update centos7 base box
function update_centos7 () {
cd /home/iws/centos7template/
vagrant up
vagrant ssh -c "sudo yum -y update --exclude=kernel*"
vagrant package --output centos7template.box
vagrant box add --force centos7template centos7template.box
vagrant destroy -f
rm centos7template.box 
}

#function to update centos6 base box
function update_centos6 () {
cd /home/iws/centos6/
vagrant up
vagrant ssh -c "sudo yum -y update --exclude=kernel*"
vagrant package --output centos6.box
vagrant box add --force centos6 centos6.box
vagrant destroy -f
rm centos6.box
}


#function to update ubuntu16 base box
function update_ubuntu16 () {
cd /home/iws/ubuntu16template/
vagrant up
vagrant ssh -c "sudo apt-get -y upgrade"
vagrant package --output ubuntu16template.box
vagrant box add --force ubuntu16template ubuntu16template.box
vagrant destroy -f
rm ubuntu16template.box
}

#function to update ubuntu14 base box
function update_ubuntu14 () {
cd /home/iws/ubuntu14/
vagrant up
vagrant ssh -c "sudo apt-get -y upgrade"
vagrant package --output ubuntu14.box
vagrant box add --force ubuntu14 ubuntu14.box
vagrant destroy -f
rm ubuntu14.box
}


#running updates and logging actions
echo $now >> /home/iws/log/updates.log
echo -e "${RED}######updating centos7######${NC}" >> /home/iws/log/updates.log
update_centos7 >> /home/iws/log/updates.log
echo -e "${RED}######updating centos6######${NC}" >> /home/iws/log/updates.log
update_centos6 >> /home/iws/log/updates.log
echo -e "${RED}######updating ubuntu16######${NC}" >> /home/iws/log/updates.log
update_ubuntu16 >> /home/iws/log/updates.log
echo -e "${RED}######updating ubuntu14######${NC}" >> /home/iws/log/updates.log
update_ubuntu14 >> /home/iws/log/updates.log

