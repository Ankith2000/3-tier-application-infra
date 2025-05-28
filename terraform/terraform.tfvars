main-region = "ap-south-1"

vpc-cidr = "10.0.0.0/16"

public-subnets = [ {
  name = "anki-subnet-1"
  cidr = "10.0.1.0/24"
  zone = "ap-south-1a"
} ,{
   name = "anki-subnet-2"
  cidr = "10.0.2.0/24"
  zone = "ap-south-1b"}
, {
   name = "anki-subnet-3"
  cidr = "10.0.3.0/24"
  zone = "ap-south-1b"}
]

private-subnets = [ {
  name = "anki-subnet-4"
  cidr = "10.0.4.0/24"
  zone = "ap-south-1a"
} ,{
   name = "anki-subnet-5"
  cidr = "10.0.5.0/24"
  zone = "ap-south-1b"}
, {
   name = "anki-subnet-6"
  cidr = "10.0.6.0/24"
  zone = "ap-south-1c"},
   {
  name = "anki-subnet-7"
  cidr = "10.0.7.0/24"
  zone = "ap-south-1a"
} ,{
   name = "anki-subnet-8"
  cidr = "10.0.8.0/24"
  zone = "ap-south-1b"}
, {
   name = "anki-subnet-9"
  cidr = "10.0.9.0/24"
  zone = "ap-south-1c"},  {name = "anki-subnet-10"
  cidr = "10.0.9.0/24"
  zone = "ap-south-1c"}
 ]

 bastian-server-subnet-name = "anki-subnet-1"
 backend-port = 3000
 database-port = 3306
 database-name = "todo-app"
 nat-gw-subnet-name = "anki-subnet-3"
 frontend-instances-subnets-names = [ "anki-subnet-1" , "anki-subnet-2", "anki-subnet-3"]
 frontend-lb-subnets-names = [ "anki-subnet-1" , "anki-subnet-2", "anki-subnet-3"]
 backend-instances-subnets-names = [ "anki-subnet-7" , "anki-subnet-8"]
 backend-lb-subnets-names = [ "anki-subnet-4", "anki-subnet-5", "anki-subnet-6" ]
 database-subnets-names = [ "anki-subnet-9", "anki-subnet-10" ]