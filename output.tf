output "minecraft_instance_public_ip" {
  description = "Public IP address of the EC2 instance hosting Minecraft Bedrock Edition"
  value       = aws_instance.minecraft_server.public_ip
}

output "minecraft_instance_public_domain_name" {
  description = "Public DNS of the EC2 instance hosting Minecraft Bedrock Edition"
  value       = aws_instance.minecraft_server.public_dns
}
