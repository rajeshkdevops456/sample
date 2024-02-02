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
