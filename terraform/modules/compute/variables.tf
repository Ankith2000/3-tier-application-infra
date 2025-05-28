variable "vpc-id" {
  type = string
}

variable "compute-workloads" {
  type = object({
    frontend-lb = object({
      subnets-ids = list(string)
      sg-id = string 
    })

 frontend-instances = object({
      subnets-ids = list(string)
      sg-id = string 
    })

     backend-lb = object({
      subnets-ids = list(string)
      sg-id = string 
    })

     backend-instances = object({
      subnets-ids = list(string)
      sg-id = string 
    })

     bastian-server = object({
      subnets-id = string
      sg-id = string 
    })
  })
}

variable "secrets-ssm-read-only-role-name" {
  type = string
}

variable "database-hostname" {
  type = string
}

variable "backend-port" {
  type = string
  
}
