param (
    [string]$configFile
)

Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFile = ".\logs\removeUser.log"

# Archivo de configuracion
$config = Get-Content -Path $configFile | ConvertFrom-Json

# Nombre de usuario
$usuarios = $config.usuarios

#Nombre de la instancia de NAV
$instancia = $config.instancia

Write-Log -Message "`n +-+-+-+-+-+-+-+`n |N|i|s|c|o|d|e|`n +-+-+-+-+-+-+-+" -LogFilePath $logFile
foreach ($usuario in $usuarios) {
    try {
        Remove-NAVServerUser -ServerInstance $instancia -UserName $usuario
        Write-Log -Message "Usuario $usuario eliminado" -LogFilePath $logFile
    } catch {
        $excepcion = $_.Exception
        Write-Host "Se produjo un error: $excepcion"
        Write-Log -Message "Se produjo un error: $excepcion" -LogFilePath $logFile
    }
}


