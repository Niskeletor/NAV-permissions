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
    try {

        
        New-NAVServerUser -WindowsAccount $usuario.winUser -Fullname $usuario.fullNameUser -state $usuario.state -ServerInstance $instancia -ContactEmail $usuario.contactEmail -Company $usuario.company -LanguageId $usuario.languageId -ExpiryDate $usuario.expiryDate -Force
        Write-Log -Message "Usuario $usuario.winUser creado" -LogFilePath $logFile
        
    } catch {
        $excepcion = $_.Exception
        Write-Host "Se produjo un error: $excepcion"
        Write-Log -Message "Se produjo un error: $excepcion" -LogFilePath $logFile
    }
}#forearch




