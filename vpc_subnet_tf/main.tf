#  VPC section
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  tags                 = {
    Name = var.vpc_tag    
  }
}

# Looping using count 
resource "aws_subnet" "subnets"{
  vpc_id              =  aws_vpc.main.id
  count               =  length(var.subnet_tags)
  cidr_block          =  cidrsubnet(var.vpc_cidr, 8 ,count.index)
  availability_zone   =  format("%s%s", var.region, var.avail_zones)
  tags                =  {
    Name              = var.subnet_tags[count.index]
  }
}

# Looping using for_each
# resource "aws_subnet" "subnets"{
#   vpc_id              =  aws_vpc.main.id
#   for_each            =  toset(var.subnet_index)
#   cidr_block          =  cidrsubnet(var.vpc_cidr, 8 , tonumber(each.value))
#   availability_zone   =  format("%s%s", var.region, var.avail_zones)
#   tags                =  {
#     Name              = var.subnet_tags[tonumber(each.value)]
#   }
# }



# Subnet section individual
# resource "aws_subnet" "web" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = cidrsubnet(var.vpc_cidr, 8, 0)
#   availability_zone    = var.region

#   tags = {
#     Name = var.subnet_tags[0]
#   }
# }

# resource "aws_subnet" "app" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = cidrsubnet(var.vpc_cidr, 8, 1)
#   availability_zone    = var.region

#   tags = {
#     Name = var.subnet_tags[1]
#   }
# }

# resource "aws_subnet" "db" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = cidrsubnet(var.vpc_cidr, 8, 2)
#   availability_zone    = var.region

#   tags = {
#     Name = var.subnet_tags[2]
#   }
# }

# resource "aws_subnet" "mgmt" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = cidrsubnet(var.vpc_cidr, 8, 3)
#   availability_zone    = var.region
#   count = length(var.subnet_tags)

#   tags = {
#     Name = var.subnet_tags[3]
#   }
# }

