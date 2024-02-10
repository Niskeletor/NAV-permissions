function Build-UserParameters {
    param (
        [Parameter(Mandatory = $true)]
        $usuario,

        [Parameter(Mandatory = $true)]
        $config
    )


    # Implementación por splatting, para que se pueda construir los parametros necesarios
    $parametros = @{
        WindowsAccount = $usuario.winUser
        Fullname = $usuario.fullNameUser
        ServerInstance = $config.instancia
        Force = $true
    }

    $cambios = "Cambios para el usuario $($usuario.winUser): "

    # ... lógica para añadir parámetros y cambios ...

    
    if ($null -ne $usuario.state) {
        $parametros['State'] = $usuario.state
        $cambios += "State cambiado a '$($usuario.state)'. "
    }
    if ($null -ne $usuario.contactEmail) {
        $parametros['ContactEmail'] = $usuario.contactEmail
        $cambios += "ContactEmail cambiado a '$($usuario.contactEmail)'. "
    }
    if ($null -ne $usuario.company) {
        $parametros['Company'] = $usuario.company
        $cambios += "Company cambiado a '$($usuario.company)'. "
    }
    if ($null -ne $usuario.languageId) {
        $parametros['LanguageId'] = $usuario.languageId
        $cambios += "LanguageId cambiado a '$($usuario.languageId)'. "
    }
    if ($null -ne $usuario.expiryDate) {
        $parametros['ExpiryDate'] = $usuario.expiryDate
        $cambios += "ExpiryDate cambiado a '$($usuario.expiryDate)'. "
    }

    return $parametros, $cambios # Devuelve un array con los dos valores, parametros para el splatting y cambios para el log
}
