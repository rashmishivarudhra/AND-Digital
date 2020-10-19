Directory tree:

AND-Digital
    ├───backend-creation
    ├───modules
    │   ├───alb
    │   ├───asg
    │   ├───backend
    │   ├───dynamo-db
    │   ├───iam
    │   ├───provider
    │   ├───s3
    │   ├───security_group
    │   └───vpc
    └───web-application
    


 #AND Digital project has 3 main directory.
 
 1. backend-creation
 2. modules
 3. web-application
 
 
 1. Backend-creation has backend_creation.tf file which is used to create s3 bucket and dynamodb table
    for the remote backend.Before running the main application this file has to be run.
    #commands:
    cd  backend-creation
    terraform init
    terraform plan
    terraform apply
    cd ..
    
 2. Modules directory consists of re-usable modules it consists of (ALB, ASG, Backend, Dynamodb, IAM, S3, 
    Security_Group and VPC).
    
 3. web-application directory consists of application.tf and user-data.sh file. 
    application.tf file is the main file where terraform init, terraform plan and apply has to run after creating
    the dynamodb table and s3 bucket for remote backend.
    #commands
    cd web-application
    terraform init
    terraform plan
    terraform apply
    
   
    
    
    