provider "aws"  {
  region = var.region

}

resource "aws_security_group" "my_sg" {
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # All traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}


resource "aws_instance" "my_instance" {
    count = var.instance_count
    ami = var.ami_id
    instance_type = var.itype
    key_name = var.key
    security_groups = [aws_security_group.my_sg.name]

    tags = {
      #Name = var.iname
      Name = "${var.iname}-${count.index + 1}"
    }
  
}