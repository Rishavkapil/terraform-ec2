# Creating EC2 instance

resource "aws_instance" "web" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "stage-tf-rishav-ec2"
  }
  user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
echo "Hi Rishav " >/var/www/html/index.nginx-debian.html
EOF
}



