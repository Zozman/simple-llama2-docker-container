#!/bin/bash
# Script to build and start the docker container
#
# Parameters
#
# $1 - MODEL_WEIGHT - What Llama 2 model weight to use

. ./shared.sh

check_supported_model_weight

echo "Starting Docker Container..."

# Perform docker build using the specified model weight
docker compose build --build-arg MODEL_WEIGHT=$MODEL_WEIGHT
# Start the container
docker compose up