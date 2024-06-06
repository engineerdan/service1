# create log group
resource "aws_cloudwatch_log_group" "events" {
  name = "events"
}

# create iam policy document
data "aws_iam_policy_document" "log_policy" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream"
    ]

    resources = [
      "${aws_cloudwatch_log_group.events.arn}:*"
    ]

    principals {
      type = "Service"
      identifiers = [
        "events.amazonaws.com",
        "delivery.logs.amazonaws.com"
      ]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "logs:PutLogEvents"
    ]

    resources = [
      "${aws_cloudwatch_log_group.events.arn}:*:*"
    ]

    principals {
      type = "Service"
      identifiers = [
        "events.amazonaws.com",
        "delivery.logs.amazonaws.com"
      ]
    }

    condition {
      test     = "ArnEquals"
      values   = [aws_cloudwatch_event_rule.log.arn]
      variable = "aws:SourceArn"
    }
  }
}

# create policy
resource "aws_cloudwatch_log_resource_policy" "policy" {
  policy_document = data.aws_iam_policy_document.log_policy.json
  policy_name     = "log-publishing-policy"
}

# create eventbridge rule to match event_pattern
resource "aws_cloudwatch_event_rule" "log" {
  name        = "log_events"
  description = "Capture all events and log to cloudwatch"

  event_pattern = <<PATTERN
  {
    "detail-type": [
      "testtype"
    ]
  }
PATTERN
}

# associate eventbridge rule to the log group
resource "aws_cloudwatch_event_target" "log_to_cloudwatch" {
  rule      = aws_cloudwatch_event_rule.log.name
  arn       = aws_cloudwatch_log_group.events.arn
}