#function to start EC2 instances. Takes Instance ID as parameter
function startec2() {
aws ec2 start-instances --instance-ids $1
}

#function to stop EC2 instances. Takes Instance ID as parameter
function stopec2() {
aws ec2 stop-instances --instance-ids $1
}

