write-host "creating s3 resources..."
cd .\terraform\s3
terraform init
terraform plan
terraform apply --auto-approve
cd ..\..