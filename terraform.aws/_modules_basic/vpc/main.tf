
resource "aws_vpc" "sac_vpc" {
  # oak9: Define asset inventory tags
  cidr_block = "10.1.0.0/16"
}

resource "aws_vpc_peering_connection" "sac_vpc_pc" {
  vpc_id      = aws_vpc.sac_vpc.id
  peer_vpc_id = aws_vpc.sac_peer_vpc.id
}
