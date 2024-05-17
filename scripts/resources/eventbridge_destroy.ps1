write-host "tearing down eventbridge resources..."
cd .\terraform\eventbridge
terraform destroy -auto-approve
cd ..\..