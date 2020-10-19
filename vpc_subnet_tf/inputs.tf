# Defining variables
variable region {
  type          = string
  default       = "ap-south-1"
  description   = "Region for creating resources"
}

variable vpc_cidr {
    type        = string
    default     = "192.168.0.0/16"
    description = "CIDR of VPC"
}

variable vpc_tag {
    type        = string
    default     = "fromtf"
    description = "VPC Tag"
}

variable subnet_tags {
    type        = list(string)
    default     = ["web","app","db","mgmt"]
    description = "Subnet Tags"
}

variable avail_zones {
    type        = string
    default     = "a"
}
