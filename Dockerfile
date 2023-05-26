FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY run.py .
COPY configuration.yml .

EXPOSE 8080

CMD ["python", "run.py"]