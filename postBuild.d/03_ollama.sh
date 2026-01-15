#!/bin/bash
source ~/start

echo "instruction taken from https://docs.ollama.com/linux"

curl -fsSL https://ollama.com/download/ollama-linux-amd64.tar.zst | sudo tar x -C .

#running as local user:    
#ollama serve