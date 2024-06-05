write-host "tearing down s3 resources..."
cd .\terraform\s3
terraform destroy -auto-approve
cd ..\..\