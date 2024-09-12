FROM python:3.9-slim

# Ensure certificates are installed
RUN apt-get update && apt-get install -y ca-certificates

# Install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r /usr/src/app/requirements.txt

# Copy files required for the app to run
COPY . /usr/src/app/
WORKDIR /usr/src/app/

# Command to run the application
CMD ["python", "app.py"]
