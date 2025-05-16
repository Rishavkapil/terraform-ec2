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
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "README.md"
    destination = "/tmp/README.md"
  }
  provisioner "local-exec" {
    command = "echo 'at create'"
  }
  provisioner "local-exec" {
    command = "env > env.txt"
    environment = {
      envname = "envvalue"
    }
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at destroy'"
  }
  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/ifconfig.output",
      "echo 'Hello Rishav' >/tmp/test.txt"
    ]
  }
  provisioner "remote-exec" {
    script = "./testscript.sh"
  }
}



