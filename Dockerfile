# Use a base image with Python and Node.js
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Install Playwright dependencies
RUN apt-get update && apt-get install -y \
    curl \
    libnss3 \
    libglib2.0-0 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libatspi2.0-0 \
    libgtk-3-0 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and Playwright
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN npm install -g playwright

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the test scripts
COPY . .

# Set environment variables (modify as needed)
ENV DISPLAY=:99
ENV PLAYWRIGHT_BROWSERS_PATH=/usr/lib/node_modules/playwright/browser-install

# Run the tests
CMD ["pytest", "-v", "tests/"]
