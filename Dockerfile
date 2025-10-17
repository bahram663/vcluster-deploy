# --- Build stage ---
FROM python:3.12-slim AS build
WORKDIR /src
COPY app/requirements.txt .
RUN pip install --upgrade pip && pip wheel --no-cache-dir --no-deps -r requirements.txt -w /wheels
COPY app/ /src/app

# --- Run stage ---
FROM python:3.12-slim
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY --from=build /wheels /wheels
RUN pip install --no-cache /wheels/*
COPY --from=build /src/app /app
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
