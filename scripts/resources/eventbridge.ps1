write-host "creating eventbridge resources..."
cd .\terraform\eventbridge
terraform init
terraform plan
terraform apply --auto-approve
cd ..\..