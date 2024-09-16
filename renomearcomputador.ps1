# Variáveis
$novoNomeComputador = "NovoNomePC"         # Substitua pelo nome desejado para o computador
$dominio = "seu.dominio.com"               # Substitua pelo seu domínio
$usuarioDominio = "dominio\usuario"        # Substitua pelo nome de usuário de domínio com permissões para ingressar no domínio
$senhaDominio = "senhaSeguraAqui"          # Substitua pela senha do usuário de domínio

# Renomear o computador
Rename-Computer -NewName $novoNomeComputador -Force -Restart

# Esperar o sistema reiniciar
Start-Sleep -Seconds 30

# Adicionar o computador ao domínio
$securePassword = ConvertTo-SecureString $senhaDominio -AsPlainText -Force
$credenciais = New-Object System.Management.Automation.PSCredential($usuarioDominio, $securePassword)

Add-Computer -DomainName $dominio -Credential $credenciais -Restart
