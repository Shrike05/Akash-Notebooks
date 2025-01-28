FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir \
    notebook==7.0.9

WORKDIR /notebook

# Expose port and run Notebook
EXPOSE 8888
CMD ["jupyter", "notebook", \
    "--ip=0.0.0.0", \
    "--port=8888", \
    "--no-browser", \
    "--NotebookApp.token=''", \
    "--NotebookApp.password=''"]