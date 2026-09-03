from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import os
from config import settings

app = FastAPI(
    title=settings.API_TITLE,
    version=settings.API_VERSION,
    description="Quantum-Powered Healthcare Prediction Platform"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {
        "message": "QuantumMed - SIH26139 Backend",
        "version": "1.0.0",
        "docs": "/docs",
        "redoc": "/redoc"
    }

@app.get("/health")
async def health_check():
    return {"status": "healthy", "service": "QuantumMed Backend"}

@app.post("/api/v1/auth/login")
async def login(email: str, password: str):
    return {"access_token": "demo_token_123", "token_type": "bearer", "user_role": "doctor"}

@app.get("/api/v1/analytics/dashboard")
async def get_dashboard():
    return {
        "total_patients": 1234,
        "high_risk_cases": 47,
        "total_predictions": 2891,
        "model_accuracy": 94.2,
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
