#!/bin/bash
source ~/start

echo "instruction taken from https://docs.ollama.com/linux"

curl -fsSL https://ollama.com/download/ollama-linux-amd64.tar.zst | sudo tar x -C /usr
    
echo "adding Ollama as a startup service"
sudo useradd -r -s /bin/false -U -m -d /usr/share/ollama ollama
sudo usermod -a -G ollama $(whoami)

sudo cp ./ollama.service /etc/systemd/system/ollama.service

sudo systemctl daemon-reload
sudo systemctl enable ollama

echo "start Ollama and verify it is running:"
sudo systemctl start ollama
sudo systemctl status ollama
