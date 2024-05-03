# Development Environment

We want the environment we use to develop new features for the product to match as much as possible the environment we use to deploy the production application.

When we develop locally we utilise IntelliJ file watchers and the AWS CLI to do the following things:

- sync the front end files with S3 automatically on save
- automatically push lambda functions on save

We use Terraform to manage our infrastructure and build the dev, test and prod environments.  We try to ensure the differences between the environments are minimised.

## Sync Front End Files with S3 on Save

## Automatically Push Updated Lambda Functions on Save

When a developer is happy that they have everything working in their own     

# Documentation

We used Material for MKDocs to manage our documentation which is stored in the `.\docs` folder.  The documentation is stored in the project repo since we want to ensure that documentation and product stay up to date.

Docs are deployed via Github pages.

# Repository Structure

# Permissions

Permissions S3
Permissions EventBridge

# EventBridge

`create_eventbridge_rules.bat` will create an Eventbridge rule to write to Cloudwatch logs.

# Authentication

Ref: https://www.sammeechward.com/cognito-user-pool-react

Users are authenticated against a Cognito user pool using `amazon-cognito-identity-js`.

https://docs.aws.amazon.com/cognito/latest/developerguide/getting-credentials.html

## Signup

## Email Confirmation

## Login

## Logout

## Forgot Password

# Pipelines

Our aim is to practice continuous integration and delivery.

# Environments

We want to be able to create and tear down environments as easy as possible.

We also want to be able to replay Event Bridge events as easy as possible.

