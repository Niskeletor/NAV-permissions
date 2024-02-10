param (
    [string]$configFile
)

Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFileForPermisos = ".\logs\copyUserAccess.log"

# Archivo de configuracion
$config = Get-Content -Path $configFile | ConvertFrom-Json

#Usuario de Referencia
$usuarioReferencia = $config.usuarioReferencia

# Nombre de usuario
$usuarios = $config.usuarios

# Instancia de NAV
$instancia = $config.instancia

Write-Log -Message "Inicio" -LogFilePath $logFileForPermisos
Write-Log -Message "`n +-+-+-+-+-+-+-+`n |N|i|s|c|o|d|e|`n +-+-+-+-+-+-+-+" -LogFilePath $logFileForPermisos

$permisosDeUsuario = Get-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $usuarioReferencia
$empresasDelUsuario = $permisosDeUsuario | Select-Object -ExpandProperty CompanyName -Unique

foreach ($usuario in $usuarios) {

foreach ($empresa in $empresasDelUsuario) {
    $permisos = $permisosDeUsuario | Where-Object { $_.CompanyName -eq $empresa }

    foreach ($permiso in $permisos) {
        try {
            
            New-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $usuario -PermissionSetId $permiso.PermissionSetId -CompanyName $empresa  -ErrorAction Stop  
            
            Write-Log -Message "Permiso $permiso.PermissionSetId asignado para $usuario en $empresa" -LogFilePath $logFileForPermisos
            Write-Log -Message "Permiso $($permiso.PermissionSetId) asignado para $usuario en $empresa" -LogFilePath $logFileForPermisos
        }
        catch {
            $excepcion = $_.Exception
           # Write-Log -Message "Error al asignar permiso $permiso.PermissionSetId para $usuario en $empresa" -LogFilePath $logFileForPermisos
            Write-Log -Message "Error al asignar permiso $($permiso.PermissionSetId) para $usuario en $empresa : $excepcion" -LogFilePath $logFileForPermisos
        }
        
    }
}

}
