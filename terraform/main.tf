# create the bucket
resource "aws_s3_bucket" "mapper-frontend" {
    bucket = "mapper-frontend"
}

# enable static website hosting on this bucket
resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.mapper-frontend.id

  index_document {
    suffix = "index.html"
  }
}

# turn off all public blocks
resource "aws_s3_bucket_public_access_block" "turn_off" {
  bucket = aws_s3_bucket.mapper-frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# create and apply public read policy for this bucket
resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.mapper-frontend.id

  policy = jsonencode(
      {
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Sid": "PublicReadGetObject",
                  "Effect": "Allow",
                  "Principal": "*",
                  "Action": "s3:GetObject",
                  "Resource": "arn:aws:s3:::mapper-frontend/*"
              }
          ]
      }
  )
  depends_on = [aws_s3_bucket_public_access_block.turn_off]
}

# create cloudfront distribution which redirects http to https
/*
resource "aws_cloudfront_distribution" "distribution" {
  enabled         = true
  is_ipv6_enabled = true

  origin {
    domain_name = aws_s3_bucket_website_configuration.hosting.website
    origin_id   = aws_s3_bucket.mapper-frontend.bucket_regional_domain_name

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols = [
        "TLSv1.2",
      ]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  default_cache_behavior {
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.mapper-frontend.bucket_regional_domain_name
  }
} */
