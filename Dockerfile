# Start with the pytorch image so we have access to torchrun
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime
# What model weight we will be using
ARG MODEL_WEIGHT=Llama-2-7b-chat
# We save it as an environmental variable so we can derive paths inside the python app
ENV MODEL_WEIGHT=$MODEL_WEIGHT
WORKDIR /code
# Install additional python dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# Copy the llama python library into the container
COPY ./llama/llama /code/llama
# Copy our selected model's files
COPY ./$MODEL_WEIGHT /code/$MODEL_WEIGHT
# Copy the web server code into the container
COPY ./main.py /code/main.py
# Start the server
CMD ["torchrun", "main.py"]