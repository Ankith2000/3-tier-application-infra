variable "backend-token-secret" {
  type = string
  sensitive = true
}

variable "database-username-secret" {
  type = string
  sensitive = true
}

variable "database-password-secret" {
  type = string
  sensitive = true
}

variable "backend-port" {
  type = number
}

variable "database-port" {
  type = number
}
variable "database-name" {
  type = string
}