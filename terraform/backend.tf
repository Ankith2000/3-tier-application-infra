terraform {
  backend "s3" {
    bucket = "anki-bucket"
    key = "terraform.tfstate"
    region = "ap-southeast-2"
    use_lockfile = true
  }
}