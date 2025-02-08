FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends libpq-dev && \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip

# Copy dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set environment variables
ENV PATH="/py/bin:$PATH"

# Expose port
EXPOSE 8080

# Set non-root user for security
RUN adduser --disabled-password --no-create-home appuser
USER appuser

CMD ["python", "app.py"]
