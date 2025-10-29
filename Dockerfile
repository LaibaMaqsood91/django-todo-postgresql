# Stage 1: Builder
FROM python:3.11-slim AS builder
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app

RUN apt-get update && apt-get install -y build-essential libpq-dev gcc

COPY requirements.txt .
RUN pip install --upgrade pip && pip wheel --no-cache-dir -r requirements.txt -w /wheels

# Stage 2: Final image
FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY --from=builder /wheels /wheels
RUN pip install --no-cache /wheels/*

COPY . /app

RUN useradd -m appuser && chown -R appuser /app
USER appuser

EXPOSE 8000
CMD ["gunicorn", TodoProject.wsgi:application, "--bind", "0.0.0.0:8000"]
