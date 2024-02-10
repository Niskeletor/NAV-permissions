param (
    [string]$configFile
)

Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFile = ".\logs\stateUser.log"

# Archivo de configuracion
$config = Get-Content -Path $configFile | ConvertFrom-Json

# Nombre de usuario
$usuarios = $config.usuarios

#Nombre de la instancia de NAV
$instancia = $config.instancia

#Estado del usuario
$estado = $config.estado

Write-Log -Message "`n +-+-+-+-+-+-+-+`n |N|i|s|c|o|d|e|`n +-+-+-+-+-+-+-+" -LogFilePath $logFile
foreach ($usuario in $usuarios) {
    try {
        Set-NAVServerUser -ServerInstance $instancia -UserName $usuario -State $estado
        if ($estado -eq "Enabled") {
            Write-Log -Message "Usuario $usuario activado" -LogFilePath $logFile
        }else{
            Write-Log -Message "Usuario $usuario desactivado" -LogFilePath $logFile

        }
    } catch {
        $excepcion = $_.Exception
        Write-Host "Se produjo un error: $excepcion"
        Write-Log -Message "Se produjo un error: $excepcion" -LogFilePath $logFile
    }
}


