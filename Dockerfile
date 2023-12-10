
# Build Environment: Playwright
FROM mcr.microsoft.com/playwright/python:v1.21.0-focal

EXPOSE 8000

WORKDIR /fastanalytics

COPY /requirements.txt /fastanalytics/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /fastanalytics/requirements.txt

RUN playwright install
RUN playwright install-deps
RUN apt-get update && apt-get upgrade -y



# Install Allure for reporting
RUN pip install allure-pytest

# Install Playwright dependencies
RUN playwright install-deps

# Run the tests
CMD ["xvfb-run", "pytest", "-v", "automation/tests"]
## Add python script to Docker
#COPY index.py /
#
## Run Python script
#CMD [ "python", "index.py" ]
#
#FROM python:3.10.7
#
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PLAYWRIGHT_BROWSERS_PATH=/app/ms-playwright
## Turns off buffering for easier container logging
#ENV PYTHONUNBUFFERED=1
##..... whatever else you need
#RUN pip install playwright
## install manually all the missing libraries
#RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
#RUN PLAYWRIGHT_BROWSERS_PATH=/app/ms-playwright python -m playwright install --with-deps chromium