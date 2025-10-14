FROM python:3.13-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose the default FastAPI/Uvicorn port
EXPOSE 7860

# Start the FastAPI app (adjust if you use a different entrypoint)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]