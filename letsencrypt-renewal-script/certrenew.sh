#!/bin/sh
#bash script to renew letsencrypt ssl

#setting env path for script
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/snap/bin

#finds and kills site and redirect
kill $(pgrep Base64Site)
kill $(pgrep GoRedirect)


#function to request renewal
 renew (){
cd /home/ubuntu/Golang/bin
./lego -m infotech@iwsinc.com -d base64.iwsinc.com renew
}

renew

#copying site cert files into place
cp /home/ubuntu/Golang/bin/.lego/certificates/base64.iwsinc.com.crt /home/ubuntu/Golang/src/github.com/d1str0/Base64Site
cp /home/ubuntu/Golang/bin/.lego/certificates/base64.iwsinc.com.key /home/ubuntu/Golang/src/github.com/d1str0/Base64Site

#setting ownership of cert files
chown ubuntu:ubuntu /home/ubuntu/Golang/src/github.com/d1str0/Base64Site/base64.iwsinc.com.crt
chown ubuntu:ubuntu /home/ubuntu/Golang/src/github.com/d1str0/Base64Site/base64.iwsinc.com.key

#function to restart the site and redirect
start_up (){
cd /home/ubuntu/Golang/src/github.com/d1str0/Base64Site/
./GoRedirect &
cd /home/ubuntu/Golang/src/github.com/d1str0/GoRedirect/
./Base64Site &
}

start_up

