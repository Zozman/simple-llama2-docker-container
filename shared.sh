#!/bin/bash
# Shared functions used by other scripts

MODEL_WEIGHT=${1:-Llama-2-7b-chat}

# Ensures that we are trying to run an actual Llama2 model weight we can download
check_supported_model_weight () {
    if [ $MODEL_WEIGHT != "Llama-2-7b" ] && [ $MODEL_WEIGHT != "Llama-2-7b-chat" ] && [ $MODEL_WEIGHT != "Llama-2-13b" ] && [ $MODEL_WEIGHT != "Llama-2-13b-chat" ] && [ $MODEL_WEIGHT != "Llama-2-70b" ] && [ $MODEL_WEIGHT != "Llama-2-70b-chat" ]
    then
        echo "Model weight $MODEL_WEIGHT is not supported by this script."
        echo "Supported models are:"
        echo "     Llama-2-7b"
        echo "     Llama-2-7b-chat"
        echo "     Llama-2-13b"
        echo "     Llama-2-13b-chat"
        echo "     Llama-2-70b"
        echo "     Llama-2-70b-chat"
        exit 1
    fi
}