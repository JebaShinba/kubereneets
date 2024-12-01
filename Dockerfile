FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Install Chrome browser
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && rm ./google-chrome-stable_current_amd64.deb

# Install ChromeDriver
RUN CHROME_VERSION=$(google-chrome --version | cut -d ' ' -f 3 | cut -d '.' -f 1) && \
    wget https://chromedriver.storage.googleapis.com/$CHROME_VERSION.0/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && mv chromedriver /usr/local/bin/ && rm chromedriver_linux64.zip

# Copy application
WORKDIR /app
COPY . .

# Install Python dependencies
RUN pip install selenium

# Run the test
CMD ["python", "selenium_test.py"]
