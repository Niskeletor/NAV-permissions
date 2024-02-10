param (
    [string]$configFile
)

Import-Module ".\logs.psm1" # Modulo para escritura de logs

# Aquí especificas el archivo de log para este script
$logFileForPermisos = ".\logs\permisosSuper.log"

#<consultar datos.conf>
# Archivo de configuracion
$config = Get-Content -Path $configFile | ConvertFrom-Json

# Nombre de usuario
$usuarios = $config.usuarios

#Nombre de la instancia de NAV
$instancia = $config.instancia

# Empresas
$empresas = $config.empresas


Write-Log -Message "Inicio" -LogFilePath $logFileForPermisos
Write-Log -Message "`n +-+-+-+-+-+-+-+`n |N|i|s|c|o|d|e|`n +-+-+-+-+-+-+-+" -LogFilePath $logFileForPermisos
foreach ($usuario in $usuarios) {
# Iterar sobre cada empresa y asignar el permiso SUPER
foreach ($empresa in $empresas) {
    try {
        New-NAVServerUserPermissionSet -ServerInstance $instancia -UserName $usuario -PermissionSetId 'SUPER' -CompanyName $empresa  -ErrorAction Stop
        Write-Log -Message "Permiso SUPER asignado para $usuario en $empresa" -LogFilePath $logFileForPermisos

    }
    catch {

        if ($_ -match "The Access Control already exists") {
            Write-Host "El permiso 'SUPER' ya existe para $usuario en $empresa"
            Write-Output "El permiso 'SUPER' ya existe para $usuario en $empresa"
            Write-Warning "El permiso 'SUPER' ya existe para $usuario en $empresa"
            Write-Log -Message "El permiso 'SUPER' ya existe para $usuario en $empresa" -LogFilePath $logFileForPermisos
            
        }else{
            Write-Output "Error al asignar permiso SUPER a $usuario en $empresa"
            Write-Log -Message "Error al asignar permiso SUPER a $usuario en $empresa" -LogFilePath $logFileForPermisos
        }
        
    }
}
}

