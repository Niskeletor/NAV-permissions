Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFileForPermisos = ".\logs\deleteAccess.log"

#<consultar datos.conf>

Write-Log -Message "Inicio" -LogFilePath $logFileForPermisos
Write-Log -Message "`n +-+-+-+-+-+-+-+`n |N|i|s|c|o|d|e|`n +-+-+-+-+-+-+-+" -LogFilePath $logFileForPermisos
foreach ($usuario in $usuarios) {

$permisosDeUsuario = Get-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $usuario

$empresasDelUsuario = $permisosDeUsuario | Select-Object -ExpandProperty CompanyName -Unique

foreach ($empresa in $empresasDelUsuario) {
    $permisos = $permisosDeUsuario | Where-Object { $_.CompanyName -eq $empresa }

    foreach ($permiso in $permisos) {
        try {
            Remove-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $usuario -PermissionSetId $permiso.PermissionSetId -CompanyName $empresa -Confirm:$false -Force   
            Write-Log -Message "Permiso $permiso.PermissionSetId eliminado para $usuario en $empresa" -LogFilePath $logFileForPermisos
        }
        catch {
            Write-Log -Message "$_.Exception | Out-String" -LogFilePath $logFileForPermisos
        }
        
    }
}

}
