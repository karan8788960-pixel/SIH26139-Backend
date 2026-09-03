#!/bin/bash

echo ""
echo "========================================"
echo "  🚀 QuantumMed Backend - Start Script"
echo "  SIH26139 - Healthcare Prediction"
echo "========================================"
echo ""

# Check Python installation
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 not found! Please install Python 3.9+"
    echo "   Download from: https://www.python.org"
    exit 1
fi

echo "✓ Python found: $(python3 --version)"
echo ""

# Check if venv exists
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate venv
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Check if requirements installed
if ! pip show fastapi &> /dev/null; then
    echo "📥 Installing dependencies (this may take 2-3 minutes)..."
    pip install -r requirements.txt
else
    echo "✓ Dependencies already installed"
fi

echo ""
echo "🟠 Starting Backend Server..."
echo ""
echo "📍 Backend API available at: http://localhost:8000"
echo "📍 API Docs (Swagger) at:    http://localhost:8000/docs"
echo "📍 API Docs (ReDoc) at:      http://localhost:8000/redoc"
echo "📍 Press Ctrl+C to stop the server"
echo ""

# Open in browser
if command -v open &> /dev/null; then
    open http://localhost:8000/docs
elif command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:8000/docs
fi

# Start backend
python3 main.py
