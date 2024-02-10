$allowedHosts = @('ServidorNavision1', 'ServidorNavision2')
if ($env:COMPUTERNAME -notin $allowedHosts) {
    throw "Este script no puede ejecutarse en este host."
}


$horaPermitidaInicio = [TimeSpan]::Parse("08:00")
$horaPermitidaFin = [TimeSpan]::Parse("18:00")
$horaActual = [DateTime]::Now.TimeOfDay

if ($horaActual -lt $horaPermitidaInicio -or $horaActual -gt $horaPermitidaFin) {
    throw "Este script no puede ejecutarse fuera del horario laboral."
}
<#
En la primera parte del código, se define una lista de hosts permitidos ($allowedHosts). Luego, se verifica si el nombre del host actual (obtenido a través de la variable de entorno $env:COMPUTERNAME) está en la lista de hosts permitidos. Si el host actual no está en la lista, se lanza una excepción con el mensaje "Este script no puede ejecutarse en este host."

En la segunda parte del código, se definen las horas de inicio y fin durante las cuales el script está permitido para ejecutarse ($horaPermitidaInicio y $horaPermitidaFin). Estas horas se establecen en "08:00" y "18:00" respectivamente. Luego, se obtiene la hora actual ($horaActual).

Finalmente, se verifica si la hora actual está fuera del rango permitido. Si la hora actual es menor que la hora de inicio permitida o mayor que la hora de fin permitida, se lanza una excepción con el mensaje "Este script no puede ejecutarse fuera del horario laboral."

#>