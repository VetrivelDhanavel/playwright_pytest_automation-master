FROM debian:latest

RUN apt-get update && apt-get install -y libasound2

# Install dependencies
RUN apt-get update && apt-get install -y libxcb-shm0 libx11-xcb1 libx11-6 libxcb1 libxext6 libxrandr2 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxi6 libgtk-3-0 libpangocairo-1.0-0 libpango-1.0-0 libcairo-gobject2 libcairo2 libgdk-pixbuf-2.0-0 libasound2 libfreetype6 libfontconfig1 libdbus-1-3

# Install Python and pip
RUN apt-get install -y python3 python3-pip

RUN apt-get update && apt-get install -y python3-requests

RUN apt-get update && apt-get install -y python3-venv

RUN python3 -m venv /venv

ENV PATH="/venv/bin:$PATH"

WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install pytest-playwright && playwright install

# Copy project files
COPY . .

# Command to run tests
CMD ["pytest"]