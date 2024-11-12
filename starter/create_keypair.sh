#!/bin/bash

key_name=udagram-ec2-keypair

# Specify the AWS profile
read -p "Enter your AWS profile name: " aws_profile

# Create the key pair and save the private key to file
aws ec2 create-key-pair --key-name "$key_name" --query 'KeyMaterial' --output text --profile "$aws_profile" > "${key_name}.pem"

# Check if the key was created and saved successfully
if [ $? -eq 0 ]; then
    echo "Key pair '${key_name}' created successfully and saved as ./${key_name}.pem"
    # Change permissions to make the private key secure
    chmod 400 "./${key_name}.pem"
else
    echo "Failed to create key pair"
fi
