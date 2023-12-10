FROM mcr.microsoft.com/playwright/python:v1.40.0-jammy

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install --upgrade pip setuptools
RUN pip install -r requirements.txt
RUN pip install allure-pytest
RUN pip install pytest pytest-html
RUN pip install -e .

CMD ["pytest"]
