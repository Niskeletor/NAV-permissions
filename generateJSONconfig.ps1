$configData = @{
    usuarioReferencia = "domain\masteruser" # Usuario de referencia para copiar los permisos
    usuarios          = @('domain\user1', 'domain\user2')
    instancia         = 'grupotabigal'
    empresas          = @('Company1, Company2, Comany3' )
}

$configJson = $configData | ConvertTo-Json
Set-Content -Path ".\config.json" -Value $configJson
