write-host "syncing frontend with s3..."
aws s3 sync --delete .\frontend\build s3://mapper-frontend