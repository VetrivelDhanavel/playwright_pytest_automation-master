# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Install system dependencies (you may need to add more if your tests require them)
RUN apt-get update && apt-get install -y \
    libnss3 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libdrm2 \
    libgbm1 \
    libatspi2.0-0 \
    libgtk-3-0

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright dependencies
RUN pip install playwright

# Install browser dependencies
RUN playwright install

# Copy your project files to the container
COPY . /app

# Command to run your tests (modify this as needed)
CMD ["pytest", "test_search.py"]

