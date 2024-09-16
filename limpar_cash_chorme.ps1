# Script: Limpar cache do Google Chrome usando PowerShell
Write-Host "Limpando o cache do Google Chrome..." -ForegroundColor Green

# Define o caminho para o cache do Chrome
$chromeCachePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache"

# Verifica se o diretório de cache existe
if (Test-Path -Path $chromeCachePath) {
    try {
        # Remove todos os arquivos e pastas no diretório de cache
        Remove-Item "$chromeCachePath\*" -Recurse -Force
        Write-Host "Cache do Chrome limpo com sucesso!" -ForegroundColor Green
    } catch {
        Write-Host "Falha ao limpar o cache do Chrome. Erro: $_" -ForegroundColor Red
    }
} else {
    Write-Host "O caminho do cache do Chrome não foi encontrado. Verifique se o Chrome está instalado." -ForegroundColor Yellow
}

# Pausa para o usuário visualizar o resultado antes de fechar o script
Read-Host -Prompt "Pressione Enter para sair"
