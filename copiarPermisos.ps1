Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFileForPermisos = ".\logs\copyUserAccess.log"

$usuarioReferencia = "dominio\usuarioReferencia"

# Nombre de usuario
$usuarios = @('dominio\Usuario', 'dominio\Usuario', 'dominio\Usuario')

# Instancia de NAV
$instancia = 'instaciaNavision'

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
        }
        catch {
            
            Write-Log -Message "Error al asignar permiso $permiso.PermissionSetId para $usuario en $empresa" -LogFilePath $logFileForPermisos
        }
        
    }
}

}
