#!/bin/bash

STACK_NAME=udagram-server

# delete stack
echo "Deleting CloudFormation stack: $STACK_NAME"
aws cloudformation delete-stack --stack-name "$STACK_NAME"

echo "Waiting for stack deletion to complete..."
aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME"

# show deleting result
if [ $? -eq 0 ]; then
  echo "Stack $STACK_NAME deleted successfully."
else
  echo "Failed to delete stack $STACK_NAME."
fi