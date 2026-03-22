#!/bin/bash
echo "========================================"
echo "  WIL Portal - Starting Up"
echo "========================================"

command -v python3 &>/dev/null || { echo "ERROR: Python 3 not found. Install from https://python.org"; exit 1; }
command -v node &>/dev/null || { echo "ERROR: Node.js not found. Install from https://nodejs.org"; exit 1; }

echo ""
echo "[1/4] Setting up Python virtual environment..."
cd backend
[ ! -d "venv" ] && python3 -m venv venv
source venv/bin/activate

echo "[2/4] Installing Python packages..."
pip install -r requirements.txt -q
echo "    Done."

echo "[3/4] Starting Flask backend on http://localhost:5000 ..."
python3 app.py &
BACKEND_PID=$!
cd ..

echo "[4/4] Setting up React frontend..."
cd frontend
[ ! -d "node_modules" ] && npm install
echo "    Starting dev server on http://localhost:3000 ..."
npm run dev &
FRONTEND_PID=$!
cd ..

echo ""
echo "========================================"
echo "  WIL Portal is running!"
echo "  Open: http://localhost:3000"
echo ""
echo "  Admin login:"
echo "    Email:    admin@wilportal.ac.za"
echo "    Password: admin123"
echo "========================================"
echo ""
echo "Press Ctrl+C to stop."
trap "kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit" INT TERM
wait
