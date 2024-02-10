
param (
    [string]$configFile
)

Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFileForPermisos = ".\logs\setConjuntoPermisosUsers.log"

# Archivo de configuracion
$config = Get-Content -Path $configFile | ConvertFrom-Json

# Instancia de NAV
$instancia = $config.instancia
# Nombre de usuario
$usuarios = $config.usuarios

Write-Log -Message "Inicio" -LogFilePath $logFileForPermisos
Write-Log -Message "`n +-+-+-+-+-+-+-+`n |N|i|s|c|o|d|e|`n +-+-+-+-+-+-+-+" -LogFilePath $logFileForPermisos

Write-Host "la Instancia  es $instancia"
foreach ($usuario in $usuarios) {

    $empresas = $usuario.empresas
    $conjuntos = $usuario.permisos
    $winUser = $usuario.winUser
    #Write-Host " El usuario es $($usuario.winUser)"
    #Write-Host " El usuario es $winUser"

    foreach ($empresa in $empresas) {
        #Write-Host "La empresa es $($empresa)"

        # The Access Control already exists
        
        foreach ($conjunto in $conjuntos) {
            #Write-Host "El conjunto es $conjunto (permisos)"
            
            try {
                New-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $winUser -PermissionSetId $conjunto -CompanyName $empresa
              # Verifica si hay errores no terminales inmediatamente después del comando
              if ($Error[0] -and $Error[0].Exception.Message -match "The Aggregate Permission Set does not exist") {
                Write-Log -Message "El conjunto de permisos $conjunto no existe y no se pudo asignar al usuario $winUser en la empresa $empresa" -LogFilePath $logFileForPermisos
                $Error.Clear() # Limpia el error
            } elseif ($Error[0] -and $Error[0].Exception.Message -match "The Access Control already exists") {
                Write-Log -Message "El conjunto de permisos $conjunto YA existe y no se pudo asignar al usuario $winUser en la empresa $empresa" -LogFilePath $logFileForPermisos
                $Error.Clear() # Limpia el error                    
            } else {
                Write-Log -Message "Se asignó el conjunto $conjunto al usuario $winUser en la empresa $empresa" -LogFilePath $logFileForPermisos
            }
        }
            catch {
                Write-Log -Message "No se asigno el conjunto $conjunto al usuario $winUser en la empresa $empresa" -LogFilePath $logFileForPermisos
            }
             
        }
    }
    
}