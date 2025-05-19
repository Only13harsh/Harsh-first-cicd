FROM python:3.10  # Explicit Python version

WORKDIR /data

# Install system dependencies (distutils is included in Python 3.10)
RUN apt-get update && apt-get install -y python3-distutils

COPY . .

# Install Django
RUN pip install django==3.2

# Run migrations
RUN python manage.py migrate

# Expose port and start server
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
