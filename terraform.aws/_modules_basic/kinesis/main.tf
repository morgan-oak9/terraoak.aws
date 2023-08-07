
resource "aws_kinesis_stream" "sac_kinesis_stream" {
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
