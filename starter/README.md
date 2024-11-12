# CD12352 - Infrastructure as Code Project Solution
# Udagram Project

This IaC project will create infrastructure for Instagram like application.
Since this system network and server will be maintained by separated teams, there are two CloudFormation templates for each team.
In this phase, we will deploy a dummy application (simple HTML file) on our NGINX server running on EC2 Ubuntu instance.


## Spin up instructions
    
- Please checkout below repository if you prefer to clone from github
```bash
git clone https://github.com/ddungz/uiac.git
```

- Go to project folder
```bash
cd uiac/starter
```

- Before running scripts, make sure AWS CLI is installed and configured on your computer.

- These instructions are for Windows users using GitBash terminal. 
If you are working on other OS than Windows, it's recommended to grant permission for script files before execution.

```bash
chmod +x create_keypair.sh
chmod +x create_network_stack.sh
chmod +x create_server_stack.sh
```

### Create stacks

1. Create keypair

- Execution the script like below will create a keypair named `udagram-ec2-keypair.pem` file on current directory, which would help for debuging purpose.

```bash
./create_keypair.sh
```

2. Deploye network stack
- Execution the script like below will create Network resources such us: VPC, subnets, Internet Gateway, NAT Gateways, S3 bucket, Route Tables.
This command should returns a StackId on your terminal.

```bash
./create_network_stack.sh
```

3. Deploye server stack
- Execution the script like below will create Network resources such us: EC2 resources: Autoscaling group with EC2 instances, Load Balancer, Security Groups.
This command should returns a StackId on your terminal.

```bash
./create_server_stack.sh
```

4. Verify deployment

- Go to CloudFormation console to verify that your stacks are completed created.

- Alternatively, execute below command to verify the creation result

```bash
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE
```

- By execute below command, you can get ALB public URL, which is "DNSName" on result. Access this URL should involke our web server and show "Welcome to Udagram" on your browser. 

```bash
aws elbv2 describe-load-balancers
```

URL: http://udagra-WebAp-LxUHnKk5IiK3-1147583636.us-east-1.elb.amazonaws.com

## Tear down instructions

- Execution the script like below should delete created stacks. Stack [stack-name] deleted successfully message should show up on your terminal.

```bash
./delete_server_stack.sh
./delete_network_stack.sh
```

## Other considerations

- Feel free to edit any parameters in json files if necessary.

- Remember to delete your CloudFormation stack when you're done to avoid recurring charges.
