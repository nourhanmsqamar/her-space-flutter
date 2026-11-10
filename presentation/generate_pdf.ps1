# ==============================================================================
# Her Space — Academic Presentation PDF Generator
# ==============================================================================
# This script reads presentation/config.json and generates the 16:9 landscape
# presentation PDF (Her_Space_Project_Presentation.pdf) using headless Chrome/Edge.
# ==============================================================================

[CmdletBinding()]
param(
    [string]$OutputFile = "Her_Space_Project_Presentation.pdf"
)

$ErrorActionPreference = "Stop"

# 1. Resolve paths
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $scriptDir) { $scriptDir = (Get-Location).Path }
$configPath = Join-Path $scriptDir "config.json"
$htmlPath = Join-Path $scriptDir "index.html"
$outPdfPath = Join-Path $scriptDir $OutputFile

Write-Host "--------------------------------------------------" -ForegroundColor Magenta
Write-Host " Her Space — Presentation PDF Generator" -ForegroundColor Magenta
Write-Host "--------------------------------------------------" -ForegroundColor Magenta

# 2. Read config.json
if (-not (Test-Path $configPath)) {
    Write-Error "Config file not found at: $configPath"
    exit 1
}

$config = Get-Content $configPath -Raw | ConvertFrom-Json
$repoUrl = $config.repositoryUrl
Write-Host "Project Name  : $($config.projectName)" -ForegroundColor Cyan
Write-Host "Repository URL: $repoUrl" -ForegroundColor Cyan

# 3. Synchronize repository URL in index.html if needed
$htmlContent = Get-Content $htmlPath -Raw -Encoding UTF8
$pattern = 'id="repo-url-display">([^<]*)<(?:span|div)>'
if ($htmlContent -match 'id="repo-url-display">([^<]*)<') {
    $currentUrlInHtml = $matches[1]
    if ($currentUrlInHtml -ne $repoUrl) {
        Write-Host "Updating repository URL in index.html to: $repoUrl" -ForegroundColor Yellow
        $newHtml = $htmlContent -replace 'id="repo-url-display">([^<]*)<', "id=`"repo-url-display`">$repoUrl<"
        Set-Content -Path $htmlPath -Value $newHtml -Encoding UTF8
    }
}

# 4. Locate Chrome or Edge
$browserExe = $null
$possiblePaths = @(
    "C:\Program Files\Google\Chrome\Application\chrome.exe",
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
    (Join-Path $env:LOCALAPPDATA "Google\Chrome\Application\chrome.exe"),
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Microsoft\Edge\Application\msedge.exe"
)

foreach ($path in $possiblePaths) {
    if ($path -and (Test-Path $path)) {
        $browserExe = $path
        break
    }
}

if (-not $browserExe) {
    Write-Error "Neither Google Chrome nor Microsoft Edge was found on this system."
    exit 1
}

Write-Host "Using browser : $browserExe" -ForegroundColor Green

# 5. Build file URI for index.html
$htmlUri = "file:///" + $htmlPath.Replace("\", "/")

# 6. Execute headless browser print-to-pdf
Write-Host "Generating PDF to: $outPdfPath ..." -ForegroundColor Yellow

$chromeArgs = @(
    "--headless=new",
    "--disable-gpu",
    "--no-pdf-header-footer",
    "--run-all-compositor-stages-before-draw",
    "--print-to-pdf=`"$outPdfPath`"",
    "`"$htmlUri`""
)

$process = Start-Process -FilePath $browserExe -ArgumentList $chromeArgs -Wait -PassThru -NoNewWindow

if (Test-Path $outPdfPath) {
    $fileSize = (Get-Item $outPdfPath).Length
    $fileSizeKb = [math]::Round($fileSize / 1KB, 1)
    Write-Host "✓ PDF successfully generated!" -ForegroundColor Green
    Write-Host "  File : $outPdfPath" -ForegroundColor Green
    Write-Host "  Size : $fileSizeKb KB" -ForegroundColor Green
} else {
    Write-Error "PDF generation failed. Output file was not created."
    exit 1
}

