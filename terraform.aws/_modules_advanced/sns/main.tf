
resource "aws_sns_topic" "sac_sns_topic" {
  # oak9: Use customer-managed key for at-rest encryption
  name = "sac-testing-sns"
  display_name = "sac-test-sns"
}

resource "aws_sns_topic_subscription" "sac_sns_topic_subscription" {
  topic_arn = aws_sns_topic.sac_sns_topic.arn
  protocol  = "http"
  endpoint  = "http://devapi.oak9.cloud/console/"
}
