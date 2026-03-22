@echo off
echo ========================================
echo   WIL Portal - Starting Up
echo ========================================

python --version >nul 2>&1
if errorlevel 1 ( echo ERROR: Python not found. Download from https://python.org & pause & exit /b )
node --version >nul 2>&1
if errorlevel 1 ( echo ERROR: Node.js not found. Download from https://nodejs.org & pause & exit /b )

echo.
echo [1/4] Setting up Python virtual environment...
cd backend
if not exist "venv" ( python -m venv venv )
call venv\Scripts\activate
echo [2/4] Installing Python packages...
pip install -r requirements.txt -q
echo     Done.
echo [3/4] Starting Flask backend on http://localhost:5000 ...
start "WIL Portal - Backend" cmd /k "venv\Scripts\activate && python app.py"
cd ..

echo [4/4] Setting up and starting React frontend...
cd frontend
if not exist "node_modules" ( echo     Installing npm packages - first time only, takes ~1 min... & npm install )
start "WIL Portal - Frontend" cmd /k "npm run dev"
cd ..

echo.
echo ========================================
echo   WIL Portal is starting!
echo   Open: http://localhost:3000
echo.
echo   Admin login:
echo     Email:    admin@wilportal.ac.za
echo     Password: admin123
echo ========================================
timeout /t 5
start http://localhost:3000
pause
