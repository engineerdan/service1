# create the cognito user pool, all new users will be registered in this pool
resource "aws_cognito_user_pool" "pool" {
  name = "mapperTemp2"
  username_attributes = ["email"]
  auto_verified_attributes = ["email"]
  }

# create the user pool client (i.e. the front end React client)
resource "aws_cognito_user_pool_client" "client" {
  name = "mapperReact2"
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
  }

# create the identity pool
resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name = "identity pool"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id = aws_cognito_user_pool_client.client.id
    provider_name = "cognito-idp.eu-west-2.amazonaws.com/${aws_cognito_user_pool.pool.id}"
    #server_side_token_check = false
    }
  }

# create policy document
data "aws_iam_policy_document" "cognito_iam_role_policy_doc" {
  statement {
    effect = "Allow"
    resources = ["*"]
    actions = ["cognito-identity:GetCredentialsForIdentity"]
    }
  }

# create policy
resource "aws_iam_policy" "cognito_iam_role_policy" {
  name = "cognito-policy"
  policy = data.aws_iam_policy_document.cognito_iam_role_policy_doc.json
  }

# create iam role
resource "aws_iam_role" "authenticated" {
  name = "cognito_authenticated"
  assume_role_policy = jsonencode({
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Effect": "Allow",
                  "Principal": {
                      "Federated": "cognito-identity.amazonaws.com"
                  },
                  "Action": "sts:AssumeRoleWithWebIdentity",
                  "Condition": {
                      "StringEquals": {
                          "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.identity_pool.id}"
                      },
                      "ForAnyValue:StringLike": {
                          "cognito-identity.amazonaws.com:amr": "authenticated"
                      }
                  }
              }
          ]
      })
  }

resource "aws_cognito_identity_pool_roles_attachment" "main" {
  identity_pool_id = aws_cognito_identity_pool.identity_pool.id

#   role_mapping {
#     identity_provider         = "graph.facebook.com"
#     ambiguous_role_resolution = "AuthenticatedRole"
#     type                      = "Rules"
#
#     mapping_rule {
#       claim      = "isAdmin"
#       match_type = "Equals"
#       role_arn   = aws_iam_role.authenticated.arn
#       value      = "paid"
#     }
#   }
#
  roles = {
    "authenticated" = aws_iam_role.authenticated.arn
  }
}