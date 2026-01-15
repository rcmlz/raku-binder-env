#!/bin/bash
source ~/start

echo "instruction taken from https://docs.ollama.com/linux"

curl -fsSL https://ollama.com/download/ollama-linux-amd64.tar.zst  | tar --zstd -xvf -

#running as local user:    
echo '/home/jovyan/bin/ollama serve &' >> ~/start
bin/ollama serve &

# pull small model
bin/ollama pull gemma3:270m
