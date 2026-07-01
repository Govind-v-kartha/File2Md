# File2Md

Welcome to **File2Md**! This tool effortlessly converts PDFs into clean, semantic Markdown using a powerful Neural Engine, all running **completely offline** on your local machine.

## Features
- Extracted Markdown is clean and readable.
- Figures, text, and tables are preserved perfectly.
- **Privacy First**: Everything runs offline. Your PDFs never leave your machine.

## Getting Started

### 1. Download
You can download the standalone executable directly from the terminal or command prompt!

**Windows (PowerShell):**
```powershell
Invoke-WebRequest -Uri "https://github.com/Govind-v-kartha/File2Md/raw/main/pdf2md.exe" -OutFile "pdf2md.exe"
```

**Linux / Mac (Terminal):**
*(Note: Currently the executable is compiled for Windows, but the script can be run identically)*
```bash
curl -L -o pdf2md.exe https://github.com/Govind-v-kartha/File2Md/raw/main/pdf2md.exe
```

Alternatively, you can clone the repository to get the installation scripts:
```bash
git clone https://github.com/Govind-v-kartha/File2Md.git
cd File2Md
```

### 2. Initialize the Neural Engine
Before your first run, you need to download the required Neural Engine weights.
- **Windows**: Double-click `install.bat`
- **Mac/Linux**: Run `bash install.sh`

### 3. Run the Tool
You do **not** need Python installed! Just run the standalone executable:

```bash
./pdf2md.exe
```
(Without any arguments, the tool opens a friendly interactive menu to help you select a PDF.)

## Advanced Usage
You can run it directly from the command line:

```bash
./pdf2md.exe report.pdf --mode full --output-dir ./results
```

**Modes:**
- `full` (default): Extracts everything (text, images, descriptions).
- `description`: Text and image descriptions, no images saved.
- `image`: Text and saved images, no AI descriptions.

Enjoy your privacy-first PDF to Markdown converter!
