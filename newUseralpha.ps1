param (
    [string]$configFile
)

Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFile = ".\logs\newUsers.log"

# Archivo de configuracion
$config = Get-Content -Path $configFile | ConvertFrom-Json


Write-Log -Message "`n +-+-+-+-+-+-+-+`n |N|i|s|c|o|d|e|`n +-+-+-+-+-+-+-+" -LogFilePath $logFile


foreach ($usuario in $config.usuarios) {
    $parametros = @{
        WindowsAccount = $usuario.winUser
        Fullname = $usuario.fullNameUser
        ServerInstance = $config.instancia
        Force = $true
    }

    if ($null -ne $usuario.state) { $parametros['State'] = $usuario.state }
    if ($null -ne $usuario.contactEmail) { $parametros['ContactEmail'] = $usuario.contactEmail }
    if ($null -ne $usuario.company) { $parametros['Company'] = $usuario.company }
    if ($null -ne $usuario.languageId) { $parametros['LanguageId'] = $usuario.languageId }
    if ($null -ne $usuario.expiryDate) { $parametros['ExpiryDate'] = $usuario.expiryDate }

    try {
        New-NAVServerUser @parametros
        Write-Log -Message "Usuario $($usuario.winUser) creado" -LogFilePath $logFile
    } catch {
        Write-Log -Message "Error al crear usuario $($usuario.winUser): $_" -LogFilePath $logFile
        $errorDetails = $_
        Write-Log -Message "Error al crear usuario $($usuario.winUser): $errorDetails" -LogFilePath $logFile
        Write-Host "Error: $errorDetails"
    }
}
