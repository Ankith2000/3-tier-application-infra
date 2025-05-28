variable "main-region" {
   type=string
}

variable "vpc-cidr" {
  type = string
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

variable "bastian-server-subnet-name" {
  type = string
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

variable "frontend-lb-subnets-names" {
  type = list(string)
}

variable "frontend-instances-subnets-names" {
  type = list(string)
}

variable "backend-lb-subnets-names" {
  type = list(string)
}

variable "backend-instances-subnets-names" {
  type = list(string)
}

variable "database-name" {
  type= string
}

variable "database-username" {
  type      = string
  sensitive = true
}

variable "database-password" {
  type      = string
  sensitive = true
}

variable "database-subnets-names" {
  type = list(string)
}

variable "backend-token-secret" {
  type = string
  sensitive = true
}