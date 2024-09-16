#!/bin/bash

# Function to retrieve EC2 instance IP or DNS
get_ec2_ip_address() {
    local instance_id="$1"
    local region="$2"
    
    # Use AWS CLI to describe the EC2 instance and extract the public IP address
    local ec2_ip_address=$(aws ec2 describe-instances --instance-ids "$instance_id" --region "$region" --query "Reservations[*].Instances[*].PublicIpAddress" --output text)

    # If public IP is empty, try getting the public DNS name as fallback
    if [ -z "$ec2_ip_address" ]; then
        ec2_ip_address=$(aws ec2 describe-instances --instance-ids "$instance_id" --region "$region" --query "Reservations[*].Instances[*].PublicDnsName" --output text)
    fi

    # Check if public IP or DNS name was successfully retrieved
    if [ -z "$ec2_ip_address" ]; then
        echo "Error: Unable to retrieve public IP address or DNS name for instance $instance_id"
        exit 1
    fi

    # Return the IP or DNS name
    echo "$ec2_ip_address"
}

main() {
    # Check if the correct number of arguments are provided
    if [ $# -ne 3 ]; then
        echo "Usage: $0 <INSTANCE_ID> <REGION> <USER>"
        exit 1
    fi

    # Specify your EC2 instance ID and region
    local instance_id="$1"
    local region="$2"
    local ec2_user="$3"

    # Load environment variables from .env file if it exists
    if [ -f "util/.env" ]; then
        source util/.env
    else
        echo "Error: .env file not found in the 'util' directory."
        exit 1
    fi

    # Ensure that the SSH keys were sourced
    if [ -z "$SSH_KEY_TOKYO" ] || [ -z "$SSH_KEY_LONDON" ]; then
        echo "Error: SSH key paths are not properly set in the .env file."
        exit 1
    fi

    # Print SSH keys for debugging (remove this in production)
    echo "SSH_KEY_TOKYO: $SSH_KEY_TOKYO"
    echo "SSH_KEY_LONDON: $SSH_KEY_LONDON"

    # Select the correct SSH key based on the region
    if [ "$region" == "ap-northeast-1" ]; then
        ssh_key="$SSH_KEY_TOKYO"
    elif [ "$region" == "eu-west-2" ]; then
        ssh_key="$SSH_KEY_LONDON"
    else
        echo "Error: Unsupported region $region"
        exit 1
    fi

    # Retrieve EC2 IP or DNS using the get_ec2_ip function
    ec2_ip_address=$(get_ec2_ip_address "$instance_id" "$region")

    # SSH into the EC2 instance using the retrieved public IP address or DNS name
    echo "Connecting to $instance_id ($ec2_ip_address) with $ssh_key..."
    ssh -v -i "$ssh_key" $ec2_user@"$ec2_ip_address"
}

# Run the main function if this script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
