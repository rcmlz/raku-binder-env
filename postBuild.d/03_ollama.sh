#!/bin/bash
source ~/start

echo "instruction taken from https://docs.ollama.com/linux"

curl -fsSL https://ollama.com/download/ollama-linux-amd64.tar.zst | sudo tar x -C /usr
    
echo "adding Ollama as a startup service"
useradd -r -s /bin/false -U -m -d /usr/share/ollama ollama
usermod -a -G ollama $(whoami)

cp ./ollama.service /etc/systemd/system/ollama.service

systemctl daemon-reload
systemctl enable ollama

echo "start Ollama and verify it is running:"
systemctl start ollama
systemctl status ollama
