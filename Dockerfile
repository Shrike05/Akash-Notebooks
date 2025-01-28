FROM python:3.13-slim

WORKDIR /app

# Install Jupyter Notebook and common GPU libraries
RUN pip install --no-cache-dir jupyter notebook

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start the Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
