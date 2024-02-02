provider "aws" {
    access_key = "AKIAUE7N7LU2CMBGEMYA"
    secret_key = "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"
    region = "ap-south-1"
}

resource "aws_instance" "rajesh_instance" {
    ami = "ami-0ded8326293d3201b"
    instance_type = "t2.micro"

    tags = {
        Name = "RK-Instance"
    }
    
}

resource "aws_ec2_instance_state" "test" {
  inorostance_id = aws_instance.rajesh_instance.id
  state       = "stopped"
}

resource "aws_instance" "ip-machine" {
  # Creates four identical aws ec2 instances
  count = 4     
  
  # All four instances will have the same ami and instance_type
  ami = lookup(var.ec2_ami,var.region) 
  instance_type = "t2.micro" 
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "my-machine-${count.index}"
  }
}
