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

    $parametros, $cambios = Build-UserParameters -usuario $usuario -config $config

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
