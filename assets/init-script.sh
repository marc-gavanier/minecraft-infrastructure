#!/bin/bash
adduser minecraft
mkdir /opt/minecraft/
mkdir /opt/minecraft/server/
wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.11.01.zip -P /opt/minecraft/server
unzip /opt/minecraft/server/bedrock-server-1.19.11.01.zip -d /opt/minecraft/server/
rm /opt/minecraft/server/bedrock-server-1.19.11.01.zip
chmod +x /opt/minecraft/server/bedrock_server
wget https://raw.githubusercontent.com/marc-gavanier/minecraft-infrastructure/main/assets/minecraft.service -P /etc/systemd/system
chmod 664 /etc/systemd/system/minecraft.service
systemctl enable minecraft
systemctl start minecraft
