# Script: Executar sfc /scannow usando PowerShell
Write-Host "Executando verificação de integridade do sistema com sfc /scannow..." -ForegroundColor Green

# Executa o comando sfc /scannow
$sfcProcess = Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -NoNewWindow -PassThru

# Verifica o código de saída do comando
if ($sfcProcess.ExitCode -eq 0) {
    Write-Host "Verificação do sistema concluída com sucesso. Nenhuma violação de integridade encontrada." -ForegroundColor Green
} elseif ($sfcProcess.ExitCode -eq 1) {
    Write-Host "A verificação do sistema encontrou arquivos corrompidos e os reparou." -ForegroundColor Yellow
} elseif ($sfcProcess.ExitCode -eq 2) {
    Write-Host "A verificação do sistema encontrou arquivos corrompidos, mas não conseguiu repará-los." -ForegroundColor Red
} else {
    Write-Host "Houve um erro ao executar a verificação do sistema. Código de erro: $($sfcProcess.ExitCode)" -ForegroundColor Red
}

# Pausa para o usuário visualizar o resultado antes de fechar o script
Read-Host -Prompt "Pressione Enter para sair"
