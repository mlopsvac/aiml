FROM python:3.9-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends libpq-dev && \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip

# Copy dependencies
COPY ./requirements.txt /requirements.txt
RUN /py/bin/pip install --no-cache-dir -r /requirements.txt

# Copy application code
COPY ./app /app

# Set environment variables
ENV PATH="/py/bin:$PATH"

# Expose port
EXPOSE 8000

# Set non-root user for security
RUN adduser --disabled-password --no-create-home appuser
USER appuser

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
