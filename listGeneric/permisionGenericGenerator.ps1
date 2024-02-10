param (
    [string]$conjunto,
    [string]$objeto,
    [string]$serverInstance,
    [string]$csvPath
)


# Define el archivo CSV y la instancia del servidor
# $csvPath = "./Page.csv"


# Lee el archivo CSV
$identificadores = Import-Csv $csvPath -Delimiter ';'

# Itera sobre cada página del CSV
foreach ($identificador in $identificadores) {
    # Asegúrate de que el ID de objeto no esté vacío y no sea '0' (Todos los objetos del tipo identificador)
    if ($identificador.'Id. objeto' -ne "" -and $identificador.'Id. objeto' -ne "0") {
        # Crea el permiso para la página actual
        New-NAVServerPermission -PermissionSetId $conjunto -ObjectType $objeto -ObjectId $identificador.'Id. objeto' -Execute 1 -Read 1 -Insert 1 -Modify 1 -Delete 1 -ServerInstance $serverInstance
    }
}
