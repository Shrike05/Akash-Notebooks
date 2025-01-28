# Use an official CUDA-enabled base image
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install Jupyter and other necessary packages
RUN python3 -m pip install jupyterlab

# Install PyTorch with CUDA support (optional, but recommended for GPU compatibility)
RUN python3 -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Set up Jupyter configuration
RUN mkdir /notebooks
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Expose the port Jupyter will run on
EXPOSE 8888

# Set the working directory
WORKDIR /notebooks

# Run Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]