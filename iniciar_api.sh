#!/bin/bash

cd ~/api-tomadas

source .venv/bin/activate

export API_KEY="SUA CHAVE AQUI"
export HA_URL="SUA CHAVE AQUI"
export HA_TOKEN="SUA CHAVE AQUI"

uvicorn api_tomada:app --host 0.0.0.0 --port 8000