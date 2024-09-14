FROM python:3.10-slim

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright and its browsers
RUN pip install pytest-playwright && playwright install

# Copy project files
COPY . .

# Command to run tests
CMD ["pytest"]
