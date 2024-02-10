param (
    [string]$configFile
)

Import-Module ".\logs.psm1" # Modulo para escritura de logs
Import-Module ".\parametroSetUser.psm1" # Modulo para parametros de usuario

# Aquí especificas el archivo de log para este script
$logFile = ".\logs\setUsers.log"

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
    $cambios = "Cambios para el usuario $($usuario.winUser): "

    if ($null -ne $usuario.state) {
        $parametros['State'] = $usuario.state
        $cambios += "State cambiado a '$($usuario.state)'. "
    }
    if ($null -ne $usuario.contactEmail) {
        $parametros['ContactEmail'] = $usuario.contactEmail
        $cambios += "ContactEmail cambiado a '$($usuario.contactEmail)'. "
    }
    if ($null -ne $usuario.company) {
        $parametros['Company'] = $usuario.company
        $cambios += "Company cambiado a '$($usuario.company)'. "
    }
    if ($null -ne $usuario.languageId) {
        $parametros['LanguageId'] = $usuario.languageId
        $cambios += "LanguageId cambiado a '$($usuario.languageId)'. "
    }
    if ($null -ne $usuario.expiryDate) {
        $parametros['ExpiryDate'] = $usuario.expiryDate
        $cambios += "ExpiryDate cambiado a '$($usuario.expiryDate)'. "
    }

    try {
        Set-NAVServerUser @parametros
        Write-Log -Message $cambios -LogFilePath $logFile
    } catch {
        Write-Log -Message "Error al crear usuario $($usuario.winUser): $_" -LogFilePath $logFile
        $errorDetails = $_
        Write-Log -Message "Error al crear usuario $($usuario.winUser): $errorDetails" -LogFilePath $logFile
        Write-Host "Error: $errorDetails"
    }
}
