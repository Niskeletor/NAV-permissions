


##### Revision primer script

$instancia = 'navision'
foreach ($usuario in $usuarios) {
    foreach ($empresa in $empresas) {
        try {
            # Obtener los permisos actuales del usuario
            $permisosActuales = Get-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $usuario -ErrorAction SilentlyContinue

            # Verificar si el permiso 'SUPER' ya existe
            $permisoYaExiste = $permisosActuales | Where-Object { $_.PermissionSetId -eq 'SUPER' -and $_.CompanyName -eq $empresa }

            if ($permisoYaExiste) {
                throw "El permiso 'SUPER' ya existe para $usuario en $empresa"
            }

            # Si el permiso no existe, intentar crearlo
            New-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $usuario -PermissionSetId 'SUPER' -CompanyName $empresa -ErrorAction Stop
        }
        catch {
            Write-Output "Error (o aviso): $_"
        }
    }
}
