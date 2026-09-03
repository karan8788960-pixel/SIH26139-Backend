import os
from datetime import timedelta

class Settings:
    DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://user:password@localhost:5432/quantummed")
    SECRET_KEY = os.getenv("SECRET_KEY", "your-secret-key-change-in-production")
    ALGORITHM = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES = 30
    API_TITLE = "QuantumMed - SIH26139"
    API_VERSION = "1.0.0"
    QISKIT_PROVIDER = os.getenv("QISKIT_PROVIDER", "simulator")
    NUM_QUBITS = 4
    MODEL_PATH = "./models"

settings = Settings()
