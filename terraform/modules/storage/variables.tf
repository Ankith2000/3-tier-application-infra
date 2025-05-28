variable "database-subnets-ids" {
    type= list(string)
}

variable "database-name"{
    type = string
}

variable "database-username" {
    type = string
    sensitive = true
  
}

variable "database-password" {
  type = string
  sensitive = true
}

variable "database-sg-id" {
  type = string
}

