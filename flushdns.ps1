# Script: Flush DNS Cache using PowerShell
Write-Host "Limpando o cache DNS..." -ForegroundColor Green

# Executa o comando ipconfig /flushdns
ipconfig /flushdns

# Verifica se o comando foi executado com sucesso
if ($LASTEXITCODE -eq 0) {
    Write-Host "Cache DNS limpo com sucesso!" -ForegroundColor Green
} else {
    Write-Host "Falha ao limpar o cache DNS. Código de erro: $LASTEXITCODE" -ForegroundColor Red
}

# Pausa para o usuário visualizar o resultado antes de fechar o script
Read-Host -Prompt "Pressione Enter para sair"
