module "network" {
  source = "./modules/network"
  vpc-cidr = var.vpc-cidr
  public-subnets =  var.public-subnets
  private-subnets = var.private-subnets
  nat-gw-subnet-name = var.nat-gw-subnet-name
  backend-port = var.backend-port
  database-port = var.database-port
}

module "compute" {
  source = "./modules/compute"
  vpc-id = module.network.vpc-id
  backend-port = var.backend-port
  database-hostname = module.database.database-hostname
  secrets-ssm-read-only-role-name = module.security.secrtes-ssm-read-only-role-name

  compute-workloads = {
    frontend-lb = {
       subnets-ids = [for subnet-name, subnet-id in module.network.public-subnets-ids : subnet-id if contains(var.frontend-lb-subnets-names, subnet-name)]
      sg-id       = module.network.security-groups-ids["frontend-load-balancer-sg"]
    }

     frontend-instances = {
       subnets-ids = [for subnet-name, subnet-id in module.network.private-subnet-ids : subnet-id if contains(var.frontend-instances-subnets-names, subnet-name)]
      sg-id       = module.network.security-groups-ids["frontend-instances-sg"]
    }

     backend-lb = {
       subnets-ids = [for subnet-name, subnet-id in module.network.private-subnet-ids : subnet-id if contains(var.backend-lb-subnets-names, subnet-name)]
      sg-id       = module.network.security-groups-ids["backend-load-balancer-sg"]
    }

     backend-instances = {
       subnets-ids = [for subnet-name, subnet-id in module.network.private-subnet-ids : subnet-id if contains(var.backend-instances-subnets-names, subnet-name)]
      sg-id       = module.network.security-groups-ids["backend-instances-sg"]
    }

    bastian-server ={ subnets-ids = [for subnet-name, subnet-id in module.network.public-subnet-ids : subnet-id if contains(var.bastian-server-subnets-names, subnet-name)]
      sg-id       = module.network.security-groups-ids["bastian-server-sg"]
    }
  }
}

module "database" {
    source = "./modules/storage"
    database-name = var.database-name
    database-password = var.database-password
    database-username = var.database-name
    database-sg-id = module.network.security-groups-ids["rds-instances-sg"]
    database-subnets-ids = [for subnet-name, subnet-id in module.network.public-subnet-ids : subnet-id if contains(var.database-subnets-names, subnet-name)]
}


module "security" {
    source = "./modules/security"
    backend-token-secret = var.backend-token-secret
     backend-port = var.backend-port
     database-name = var.database-name
     database-port = var.database-port
     database-username-secret = var.database-username
     database-password-secret = var.database-password
}