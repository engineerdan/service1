#!/bin/bash

cd ./terraform
terraform init
terraform plan
terraform apply -auto-approve