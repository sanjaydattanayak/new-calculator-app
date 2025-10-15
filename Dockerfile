# Use Python 3.11 image
FROM python:3.14-slim
 
# Set working directory
WORKDIR /app
 
# Copy app files
COPY . .
 
# Run tests
RUN python -m unittest test.py
 
# Default command
CMD ["python", "calculator.py"]
 