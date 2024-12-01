FROM python:3.10-slim

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    libx11-xcb1 \
    libxcomposite1 \
    libxrandr2 \
    libxi6 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    xdg-utils && \
    rm -rf /var/lib/apt/lists/*

# Add Google Chrome repository and install Chrome browser
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Install ChromeDriver
RUN CHROME_VERSION=$(google-chrome --version | cut -d ' ' -f 3 | cut -d '.' -f 1) && \
    wget https://chromedriver.storage.googleapis.com/$CHROME_VERSION.0/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && mv chromedriver /usr/local/bin/ && rm chromedriver_linux64.zip

# Set working directory and copy application code
WORKDIR /app
COPY . .

# Install Python dependencies
RUN pip install selenium

# Run the Selenium test
CMD ["python", "selenium_test.py"]
