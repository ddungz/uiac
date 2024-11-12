aws cloudformation create-stack --stack-name udagram-server \
--template-body file://udagram.yml \
--parameters file://udagram-parameters.json \
--capabilities "CAPABILITY_NAMED_IAM"  \
--region=us-east-1