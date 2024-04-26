resource "aws_cognito_user_pool" "pool" {
  name = "mapper"
  username_attributes = ["email"]
}