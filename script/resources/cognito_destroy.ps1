write-host "tearing down cognito resources..."
cd .\terraform\cognito
terraform destroy -auto-approve
cd ..\..