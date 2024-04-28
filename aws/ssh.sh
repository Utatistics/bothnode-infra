#!/bin/bash

# Check if INSTANCE_ID argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <INSTANCE_ID>"
    exit 1
fi

# Specify your EC2 instance ID
INSTANCE_ID="$1"
SSH_KEY="/home/vagrant/.ssh/ec2key.pem"

# Use AWS CLI to describe the EC2 instance and extract the public IP address
PUBLIC_IP_ADDRESS=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[*].Instances[*].PublicIpAddress" --output text)

# If public IP is empty, try getting the public DNS name as fallback
if [ -z "$PUBLIC_IP" ]; then
    PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[*].Instances[*].PublicDnsName" --output text)
fi

# Check if public IP or DNS name was successfully retrieved
if [ -z "$PUBLIC_IP" ]; then
    echo "Error: Unable to retrieve public IP address or DNS name for instance $INSTANCE_ID"
    exit 1
fi

# SSH into the EC2 instance using the retrieved public IP address or DNS name
echo "Connecting to $INSTANCE_ID:$PUBLIC_IP with $SSH_KEY..."
ssh -v -i "$SSH_KEY" ubuntu@$PUBLIC_IP_ADDRESS

