$service = "Zabbix Agent 2"

Write-Host "=== Restart uslugi ==="
Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 5
Start-Service -Name $service

Write-Host "=== Ustawianie akcji odzyskiwania ==="
# 5 minut = 300000 ms
sc.exe failure "$service" reset= 86400 actions= restart/300000/restart/300000/restart/300000
sc.exe failureflag "$service" 1

Write-Host "Gotowe"
