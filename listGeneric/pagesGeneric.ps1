# Define el archivo CSV y la instancia del servidor
$csvPath = "./Page.csv"
$serverInstance = "instance"

# Lee el archivo CSV
$pages = Import-Csv $csvPath -Delimiter ';'

# Itera sobre cada página del CSV
foreach ($page in $pages) {
    # Asegúrate de que el ID de objeto no esté vacío y no sea '0' (Todos los objetos del tipo Page)
    if ($page.'Id. objeto' -ne "" -and $page.'Id. objeto' -ne "0") {
        # Crea el permiso para la página actual
        New-NAVServerPermission -PermissionSetId '02-TEST' -ObjectType Page -ObjectId $page.'Id. objeto' -Execute 1 -ServerInstance $serverInstance
    }
}
