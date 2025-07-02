# Use Python official image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better Docker layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY main.py .
COPY src/ ./src/

# Create .env file placeholder (you should mount your actual .env file)
RUN touch .env

# Expose the port FastAPI runs on
EXPOSE 8000

# Run the FastAPI application
CMD ["python", "main.py"]