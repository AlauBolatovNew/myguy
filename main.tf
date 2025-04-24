module "vpc" {
  source = "./vpc"

  cidr_block = "10.10.0.0/16"

  subnets = [{ cidr_block = "10.10.1.0/24" }, { cidr_block = "10.10.2.0/24" }]

  egress_rules = [{ from_port = 0, to_port = 0, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }]
}
