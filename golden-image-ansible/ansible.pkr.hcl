packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "rhel9_ansible" {
  ami_name      = "golden-image-ansible"
  instance_type = "t3.small"
  region        = "us-east-1"
  source_ami    = "ami-0220d79f3f480ecf5"
  ssh_username = "ec2-user"
  ssh_password = "DevOps321"
}

build {
  name    = "golden-image-ansible"
  sources = [
    "source.amazon-ebs.rhel9_ansible"
  ]
}
