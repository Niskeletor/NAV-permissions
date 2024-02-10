

# Archivo de configuracion
$config = Get-Content -Path ".\permisos2.json" | ConvertFrom-Json


$usuarios = $config.usuarios
$instancia = $config.instancia
$usuario1 = $config.usuarios[0].winUser
$empresasUser1 = $config.usuarios[0].empresas
$pasiero = $config.usuarios[1].pasuelo
Write-Host "INSTANCIA: $instancia"
Write-Host "Usuario 1 : $usuario1"
Write-Host "Empresas: $empresasUser1"
Write-Host "Pasuelo: $pasiero"
Write-Host "Usuarios: $usuarios"

foreach ($usuario in $usuarios) {
    $winUser = $usuario.winUser
    $empresas = $usuario.empresas 
    $permisos = $usuario.permisos 
    $pasuelo = $usuario.pasuelo

    Write-Host "Usuario: $winUser"
    Write-Host "Empresas: $empresas"
    Write-Host "Permisos: $permisos"
    if ($pasuelo) {
        Write-Host "Pasuelo: $pasuelo"
    }
    Write-Host "-------------------"
}
