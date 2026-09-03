@echo off
echo.
echo ========================================
echo   🚀 QuantumMed Backend - Start Script
echo   SIH26139 - Healthcare Prediction
echo ========================================
echo.

REM Check Python installation
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python not found! Please install Python 3.9+
    echo    Download from: https://www.python.org
    pause
    exit /b 1
)

echo ✓ Python found
echo.

REM Check if venv exists
if not exist "venv" (
    echo 📦 Creating virtual environment...
    python -m venv venv
)

REM Activate venv
echo 🔧 Activating virtual environment...
call venv\Scripts\activate.bat

REM Check if requirements installed
if not exist "venv\Lib\site-packages\fastapi" (
    echo 📥 Installing dependencies (this may take 2-3 minutes)...
    pip install -r requirements.txt
) else (
    echo ✓ Dependencies already installed
)

echo.
echo 🟠 Starting Backend Server...
echo.
echo 📍 Backend API available at: http://localhost:8000
echo 📍 API Docs (Swagger) at:    http://localhost:8000/docs
echo 📍 API Docs (ReDoc) at:      http://localhost:8000/redoc
echo 📍 Press Ctrl+C to stop the server
echo.

REM Start backend
start http://localhost:8000/docs
timeout /t 2 /nobreak
python main.py

pause
