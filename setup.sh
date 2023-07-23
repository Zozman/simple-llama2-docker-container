#!/bin/bash
# Script to setup your local environment with everything you need to run Llama2 locally using Docker and a specified model weight
#
# Parameters
#
# $1 - MODEL_WEIGHT - What Llama 2 model weight to use

. ./shared.sh

# Validate inputs
check_supported_model_weight

echo "Setting Up Using The $MODEL_WEIGHT Model Weight..."

# Validate git lfs
echo "Checking For git lfs..."
if git lfs > /dev/null
then
    echo "git lfs Found!"
else
    echo "git lfs Not Found!"
    echo "Please install git lfs"
    exit 1;
fi

# See if we need to check out the llama library
if [ -d "llama" ] 
then
    echo "Llama repo found; skipping checking out"
else
    echo "Llama repo not found; checking out..."
    git clone git@github.com:facebookresearch/llama.git
    echo "Llama repo checked out!"
fi

# See if we need to download the requested model weight
if [ -d $MODEL_WEIGHT ]
then
    echo "Directory for $MODEL_WEIGHT model weight detected; skipping checking out"
else
    echo "Directory for $MODEL_WEIGHT model weight not detected; checking out model weight repo..."
    git lfs install
    git clone git@hf.co:meta-llama/$MODEL_WEIGHT
    echo "$MODEL_WEIGHT checked out!"
fi

echo "Setup complete!  Please run "./start.sh $MODEL_WEIGHT" to start your container!"