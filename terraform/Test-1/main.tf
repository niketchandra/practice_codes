provider "aws" {
    region = "us-east-2"
}

locals {
  timestamp = "${timestamp()}"
  timestamp_sanitized = "${replace("${local.timestamp}", "/[-| |T|Z|:]/", "")}"
}

output "timestamp" {
  value = "${local.timestamp_sanitized}"

}

resource "aws_instance" "testTerraformInstance" {
    ami = "ami-00399ec92321828f5"
    instance_type = "t2.micro"
    availability_zone = "us-east-2c"
    key_name = "iac-test-niket"
    tags = {
      "owner" = "niket"
      "environment" = "dev"
      "Name" = "Codexiar_ ${local.timestamp_sanitized}"
    }
  
}

/* Create AMI 
resource "aws_ami_from_instance" "ami_create" {
  name = "Codexiar_${local.timestamp_sanitized}"
  source_instance_id = aws_instance.testTerraformInstance.id
  tags = {
    "Name" = "Codexiar_ ${local.timestamp_sanitized}"
    "DateTime" = "${local.timestamp}"

  }
}
*/
/*
resource "aws_instance" "windowsm1" {
    ami = "ami-0b697c4ae566cad55"
    instance_type = "t2.micro"
    tags = {
      "use for" = "active directory"
      "owner" = "niket"
      "Name" = "WindowsS2k19"
    }
  
}

 /* Create Volume Disk 
resource "aws_ebs_volume" "data_disk" {
  availability_zone = "us-east-2c"
  size = 40
  tags = {
    "Name" = "Data Disk"
    "owner" = "Niket"
  }
  
}
*/
/*Attch Volume to Instance*/
/*
resource "aws_volume_attachment" "eb_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.data_disk.id
  instance_id = aws_instance.testTerraformInstance.id
  
}
*/
