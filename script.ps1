# Este script verifica se o hash de um arquivo é igual a um hash de referência.

# 1. Solicita ao usuário o hash de referência.
$hashDeReferencia = Read-Host "Digite o hash de referência para comparação (ex: f7ae8c...)"

# 2. Solicita o caminho do arquivo a ser verificado.
$caminhoDoArquivo = Read-Host "Digite o caminho completo do arquivo para verificar (ex: C:\Users\SeuUsuario\Downloads\arquivo.zip)"

# 3. Solicita o algoritmo de hash.
$algoritmo = Read-Host "Digite o algoritmo de hash (MD5, SHA1, SHA256, etc.)"

# Verifica se o arquivo existe antes de tentar gerar o hash.
if (Test-Path $caminhoDoArquivo) {
    # 4. Gera o hash do arquivo usando o algoritmo escolhido.
    Write-Host "Gerando o hash do seu arquivo..."
    $hashDoArquivo = (Get-FileHash -Path $caminhoDoArquivo -Algorithm $algoritmo).Hash
    
    # 5. Compara os dois hashes.
    Write-Host ""
    Write-Host "Hash de Referência: $($hashDeReferencia.ToUpper())"
    Write-Host "Hash do Arquivo:     $($hashDoArquivo.ToUpper())"
    Write-Host "----------------------------------------------------"

    if ($hashDoArquivo -eq $hashDeReferencia) {
        Write-Host "SUCESSO: Os hashes SÃO iguais. A integridade do arquivo foi verificada." -ForegroundColor Green
    } else {
        Write-Host "FALHA: Os hashes SÃO diferentes. O arquivo pode estar corrompido ou alterado." -ForegroundColor Red
    }
} else {
    Write-Host "ERRO: O arquivo especificado não foi encontrado. Verifique o caminho e tente novamente." -ForegroundColor Red
}