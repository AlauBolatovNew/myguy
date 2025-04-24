variable "cidr_block" {
  type = string

  validation {
    condition = length(var.cidr_block) > 5
    error_message = "pwpwppw"
  }
}

variable "subnets" {
  type = list(object({
    cidr_block = string
  }))
}


variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
