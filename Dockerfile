# 1. Use the official lightweight Python image
FROM python:3.14-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Set environment variable to unbuffered output
ENV PYTHONUNBUFFERED=1

# 4. Copy dependency files first (brings caching benefits)
COPY pyproject.toml README.md ./

# 5. Install dependencies from pyproject.toml
RUN pip install --no-cache-dir .

# 6. Copy the rest of your application code
COPY . .

# 7. Command to run your script
CMD ["python", "-u", "main.py"]
