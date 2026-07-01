@echo off
cd /d "%~dp0"
echo ===================================================
echo     pdf2md Installer
echo ===================================================
echo.

if "%1"=="--skip-pip" (
    echo [1/4] Skipping Python dependencies ^(already running^)...
    echo.
) else (
    echo [1/4] Installing Python dependencies...
    pip install . -q
    if %ERRORLEVEL% NEQ 0 (
        echo [ERROR] Failed to install Python dependencies. Please ensure Python is installed.
        exit /b %ERRORLEVEL%
    )
    echo.
)

echo [2/4] Installing Core OCR Engine...
winget install UB-Mannheim.TesseractOCR --silent --accept-source-agreements --accept-package-agreements >nul 2>&1
echo.

echo [3/4] Installing Neural Processing Engine...
winget install Ollama.Ollama --silent --accept-source-agreements --accept-package-agreements >nul 2>&1

:: Start the neural engine in the background if it's not already running
start /b ollama serve >nul 2>&1
timeout /t 3 /nobreak >nul
echo.

echo [4/4] Handing over to application for Neural Model download...
echo.

echo ===================================================
echo     Installation Complete! 
echo ===================================================
echo You can now use the 'pdf2md' command anywhere.
pause
