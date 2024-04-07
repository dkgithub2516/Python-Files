# Dockerfile

# Use Python image as the base image
FROM python:3.8-slim

# Set working directory inside the container
WORKDIR /app

# Copy the Python application into the container
COPY sort.py .

# Command to run the Python application
CMD ["python", "sort.py"]
