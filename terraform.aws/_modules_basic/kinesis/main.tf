
resource "aws_kinesis_stream" "sac_kinesis_stream" {
  # oak9: Define asset inventory tags
  # oak9: Use customer-managed key for at-rest encryption
  name             = "sac-testing-kinesis"
  shard_count      = 1
  retention_period = 24
  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]
  stream_mode_details {
    stream_mode = "PROVISIONED"
  }
  encryption_type = "NONE"
}
