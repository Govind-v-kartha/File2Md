#!/bin/bash
cd "$(dirname "$0")"

echo "==================================================="
echo "    pdf2md Installer"
echo "==================================================="
echo ""

if [ "$1" = "--skip-pip" ]; then
    echo "[1/4] Skipping Python dependencies (already running)..."
    echo ""
else
    echo "[1/4] Installing Python dependencies..."
    pip install . -q
    if [ $? -ne 0 ]; then
        echo "[ERROR] Failed to install Python dependencies. Please ensure Python is installed."
        exit 1
    fi
    echo ""
fi

echo "[2/4] Checking Core OCR Engine (Tesseract)..."
if ! command -v tesseract &> /dev/null; then
    echo "Tesseract not found. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install tesseract > /dev/null 2>&1
    elif command -v apt-get &> /dev/null; then
        sudo apt-get update > /dev/null 2>&1
        sudo apt-get install -y tesseract-ocr > /dev/null 2>&1
    fi
else
    echo "Tesseract is already installed."
fi
echo ""

echo "[3/4] Checking Neural Processing Engine..."
if ! command -v ollama &> /dev/null; then
    echo "Neural engine not found. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ollama > /dev/null 2>&1
    else
        curl -fsSL https://ollama.com/install.sh | sh > /dev/null 2>&1
    fi
fi

# Start the neural engine in the background if it's not already running
if ! curl -s http://localhost:11434/ > /dev/null; then
    ollama serve > /dev/null 2>&1 &
    sleep 3
fi
echo ""

echo "[4/4] Handing over to application for Neural Model download..."
echo ""

echo "==================================================="
echo "    Installation Complete! "
echo "==================================================="
echo "You can now use the 'pdf2md' command anywhere."
