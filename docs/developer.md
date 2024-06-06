# Development Environment

We want the environment we use to develop new features for the product to match as much as possible the environment we use to deploy the production application.

When we develop locally we utilise IntelliJ file watchers and the AWS CLI to do the following things:

- sync the front end files with S3 automatically on save
- automatically push lambda functions on save

We use Terraform to manage our infrastructure and build the dev, test and prod environments.  We try to ensure the differences between the environments are minimised.

## Mapper Util

You will need to have your AWS credentials configured prior to deploying this application.

To deploy mapper in your AWS environment run:

=== "dev"
    ```powershell
    .\script\mapper.ps1 dev --up
    ```
=== "prod"
    ```powershell
    .\script\mapper.ps1 prod --up
    ```


|                                      | `dev`                                | `prod`                               |
|--------------------------------------|--------------------------------------|--------------------------------------|
| creates S3 resources                 | :octicons-check-circle-24:{ .green } | :octicons-check-circle-24:{ .green } |
| creates cognito resources in AWS     | :octicons-check-circle-24:{ .green } | :octicons-check-circle-24:{ .green } |
| creates eventbridge resources in AWS | :octicons-check-circle-24:{ .green } | :octicons-check-circle-24:{ .green } |
| builds the front end                 | :octicons-check-circle-24:{ .green } | :octicons-check-circle-24:{ .green } |
| syncs the front end with S3          | :octicons-check-circle-24:{ .green } | :octicons-check-circle-24:{ .green } |
| add test users                       | :octicons-check-circle-24:{ .green } | :octicons-x-circle-24:{ .red }       |
| migrate prod users                   | :octicons-x-circle-24:{ .red }       | :octicons-check-circle-24:{ .green } |
| run tests                            | :octicons-x-circle-24:{ .red }       | :octicons-check-circle-24:{ .green } |
| replay events                        | :octicons-x-circle-24:{ .red }       | :octicons-check-circle-24:{ .green } |


This script builds the infrastructure in AWS:

- **creates S3 resources in AWS:**
    - creates a bucket called `mapper-frontend`
    - enables static web hosting
    - turns off public blocks
    - creates a public read policy
- **creates cognito resources in AWS:**
    - creates a cognito user pool
    - creates a user pool client for the front end
    - creates an identity pool
    - creates a policy document
    - creates a policy
    - creates an IAM role
    - attaches the role to the identity pool
- **creates eventbridge resources in AWS:**
    - creates a log group
    - creates an IAM policy document
    - creates a policy
    - creates an eventbridge rule to match an event pattern
    - associates the eventbridge rule to the log group
- **builds the front end:**
    - runs `npm run build` to build the front end
- **syncs the front end with S3:**
    - syncs the build output directory with the S3 bucket by running `aws s3 sync`

## Running Tests

Front end tests can be run using **.

Service tests can be run using **.  Unit test lambda function.  Integration test lambda.  e2e test fe + be.

## Route to Release

When a developer is happy that they have everything working in their own development environment they can push their changes to the main branch.   

# Documentation

We used Material for MKDocs to manage our documentation which is stored in the `.\docs` folder.  The documentation is stored in the project repo since we want to ensure that documentation and product stay up to date.

Docs are deployed via Github pages.

# Repository Structure

# OS independent

Choice whether write script in Bash or Powershell.  Want to use the same tool on any operating system, Linux, MacOS or Windows.  One command to get everything running.

Bash and Powershell will run without installing but will require maintaining two separate scripts.  Python can use one script but will require installing Python. 

Maybe a bash and Powershell entry file that calls a common Python file might be the best option and pass on any arguments.  The Bash and Powershell scripts can ensure Python and any other requirements are installed.

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

