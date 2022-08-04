#!/bin/bash
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
docker run --name minecraft -d -e EULA=TRUE -e SERVER_NAME=Bessenay -e GAMEMODE=survival -e DIFFICULTY=hard -e LEVEL_NAME=Bessenay -e ONLINE_MODE=false -e ALLOW_CHEATS=false -p 19132:19132/udp itzg/minecraft-bedrock-server
