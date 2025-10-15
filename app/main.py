from fastapi import FastAPI
import os

app = FastAPI()


@app.get("/healthz")
def health():
    return {"status": "ok"}


@app.get("/")
def root():
    return {
        "app": "pyapp",
        "env": os.getenv("APP_ENV", "dev"),
        "message": os.getenv("APP_MESSAGE", "Hello from AKS!"),
    }


