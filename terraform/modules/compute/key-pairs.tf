resource "tls_private_key" "instances-key-pair" {
    algorithm = "ED25519"
}

resource "local_file" "instances-private-key" {
  content = tls-private-key.instances-key-pair.private-key-openssh
  filename = "ssh-private-key"
  file_permission = "0600"
}

resource "local_file" "instances-public-key" {
  content = tls-private-key.instances-key-pair.public-key-openssh
  filename = "ssh-private-key.pub"
  file_permission = "0600"
}

resource "aws_key_pair" "name" {
  key_name = "ssh-public-key"
  public_key = tls_private_key.instances-key-pair.public-key-openssh
}