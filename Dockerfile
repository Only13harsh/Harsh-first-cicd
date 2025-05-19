FROM python:3.10  # Explicitly use Python 3.10

WORKDIR /data

# Install system dependencies (distutils is included in Python 3.10)
RUN apt-get update && apt-get install -y python3-distutils

COPY . .

# Install Django and dependencies
RUN pip install django==3.2

# Run migrations
RUN python manage.py migrate

EXPOSE 8000
