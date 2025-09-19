# Use official Python base image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /data

# Copy requirements first (better for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Run migrations during container start, not at build time
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]

EXPOSE 8000

