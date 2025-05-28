variable "vpc-cidr" {
  type= string
}


variable "public-subnets" {
    type = list(object({
      name = string
      cidr = string
      availability_zone = string 
    }))
}


variable "private-subnets" {
    type = list(object({
      name = string
      cidr = string
      availability_zone = string 
    }))
}

variable "backend-port" {
    type = number
}

variable "database-port" {
  type = number
}

variable "nat-gw-subnet-name" {
    type = string
  
}