# bothnode-infra
Welcome to bothnode-infra.
```
  |           |    |                     |            _)         _|         
   _ \   _ \   _|    \     \    _ \   _` |   -_) ____| |    \    _| _| _` | 
 _.__/ \___/ \__| _| _| _| _| \___/ \__,_| \___|      _| _| _| _| _| \__,_| 
```

### IaC tool for bothnode: Ethereum Smartcontracs (DeFi) Mitigating the Manipulation
What you can do with bothnode-infra:
 - manage cloud resouces for [bothnode](https://github.com/Utatistics/bothnode/tree/main) with the use of open-source cloud automation tools

### bothnode architecture

![Bothnode Architecture](images/architecture.png)


### Getting Started 
To install Terraform, follow the instructions provided in the [official documentation](https://developer.hashicorp.com/terraform/install).

Use terraform to activate cloud resources in accordance with the predefined configuration. 
```bash
terraform init 
terraform plan
terraform apply -var-file="terraform.tfvars"



Connect to AWS EC2 instance with SSH
```bash
# use ssh
ssh -v -i $SSH_KEY ubuntu@$EC2_IP_ADDRESS

# use the pre-configured ssh script 
./ssh <instance_id> <region>
```
