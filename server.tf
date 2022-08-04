data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "minecraft_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_minecraft.id]
  user_data              = file("init-script.sh")
  tags = merge(local.tags, {
    Name = "Minecraft Bedrock Edition Server"
  })
}

resource "aws_security_group" "sg_minecraft" {
  name        = "minecraft-security-group"
  description = "Minecraft Bedrock Edition Server Security Group"

  ingress {
    description = "Minecraft server UDP port"
    from_port   = 19132
    to_port     = 19132
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Disallow all egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}
