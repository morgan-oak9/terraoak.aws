
resource "aws_sqs_queue" "sac_sqs" {
  name = "sac-testing-sqs"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_sqs_queue_policy" "sac_sqs_policy" {
  queue_url = aws_sqs_queue.sac_sqs.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "SQS:*",
            "Resource": "*",
            "Principal": {"AWS" : "*"}
        }
    ]
}
EOF
}
