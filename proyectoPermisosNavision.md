# Creación de Perfiles y Permisos en Scripts de Powershell para los Diferentes Departamentos en Navision

## 1. Análisis de Requerimientos

- **Seguridad**
  - Implementar protección contra alteraciones para configuraciones de seguridad críticas.
  - Establecer reglas de reducción de superficie de ataque para controlar la ejecución de scripts.
  - Deshabilitar acceso de shell remoto como política de seguridad.
  - Utilizar modos Activo y Pasivo para bloquear o monitorear la ejecución de scripts según sea necesario.
- **Desarrollo**
  - [ ] Planificar la arquitectura del software
  - [ ] Diseñar la interfaz de usuario
  - [ ] Configurar el entorno de desarrollo
  - [ ] Crear la base de datos
    - [ ] Definir la estructura de la base de datos
    - [ ] Configurar las tablas y relaciones
  - [ ] Desarrollar las funcionalidades principales
  - [ ] Realizar pruebas de rendimiento
  - [ ] Corregir errores y realizar pruebas de calidad
  - [ ] Documentar el código
  - [ ] Preparar el despliegue del software

  <!---->

  - Utilizar Git como un Sistema de Control de Versiones Distribuido (DVCS).
    - [x] Utilizar Git
    - [x] Crear repositorio en Github

    <!---->

    - [ ] Crear repositorio adiccional GitLab

  <!---->

  - [ ] Mantener diferentes versiones de un archivo o conjunto de archivos.

  <!---->

  - [x] Rastrear y gestionar los cambios en el código de software.

  <!---->

  - [ ] Proteger contra sobreescritura accidental de cambios.
- **Departamentos**
  - Dirección General
  - Documentación
  - Almacén
  - Presupuestos
  - BIM
  - Obra
  - Administración
  - Contabilidad
  - Recursos Humanos
- **Permisos**
  - SUPER : Acceso a todos los recursos y configuraciones a nivel de organización 
  - Ninguno: Sin acceso.
  - Solo lectura: Acceso para ver pero no modificar.
  - Estándar: Permisos para realizar operaciones comunes sin cambios críticos.
  - Ejecución : Sin visibilidad, pero ejecución necesaria para realizar operaciones (Indirecto)
- [x] Identificar los diferentes departamentos en la organización #Departamentos
- [ ] Determinar los niveles de acceso necesarios para cada departamento #NivelesAcceso
- [ ] Definir los permisos específicos para cada nivel de acceso #Permisos
- [ ] Creación de control de versiones con Git #Desarrollo
- [ ] Seguridad de ejecución de Scripts, proteger contra modificaciones #Seguridad 

## 2. Diseño de Perfiles

- [ ] Crear un diseño básico de los perfiles de usuario para cada departamento #DiseñoPerfiles
  - Departamento de Facturación
  - Departamento de Administración
  - Departamento de IT
  - Departamento de RRHH
  - Departamento de Contabilidad
  - Departamento de Almacén
  - Departamento de Obra
  - Departamento de Presupuestos
  - Departamento de BIM
  - Departamento de Documentación
  - Gerencia
- [ ] Asignar los niveles de acceso correspondientes a cada perfil de usuario #AsignaciónAcceso

## 3. Implementación de Perfiles en Powershell

- [ ] Script de Powershell para implementar los perfiles de usuario #ScriptsPowershell
- [ ] Script de Powershell para limpiar permisos #ScriptsPowershell
- [ ] Script de Powershell para copiar permiso Usuario a Usuario #ScriptsPowershell
- [ ] Script de Powershell para listar objetos #ScriptsPowershell
- [ ] Script de Powershell para crear Usuario #ScriptsPowershell
- [ ] Script de Powershell para eliminar/desactivar Usuario #ScriptsPowershell
- [ ] Script de Powershell  para modificar Usuario #ScriptsPowershell
- [ ] Script de Powershell  para agregar/restringir acceso a una Page #ScriptsPowershell
- [ ] Script de Powershell  para agregar/restringir acceso a una Table #ScriptsPowershell
- [ ] Creación de sistema de Logs y Warnings  para revisar el funcionamiento delscript #AOC 
- [ ] Script de Powershell para agregar/eliminar empresa a Usuario #ScriptsPowershell 
- [ ] Script de Powershell módulo para Logs #ScriptsPowershell #Desarrollo 
- [ ] Script de Powershell para firmar digitalmente los scripts #Seguridad #ScriptsPowershell 

## 4. Pruebas y Ajustes

- [ ] Realizar pruebas para validar la correcta implementación de los perfiles y permisos #Pruebas
- [ ] Realizar los ajustes necesarios basados en los resultados de las pruebas #Ajustes
- [ ] Creación de usuario de Pruebas #Pruebas 
- [ ] Creación Listado completo de acceso a páginas #Ajustes 
- [ ] Creación Listado completo acceso a tablas #Ajustes 
- [ ] Creación de acceso a Tablas/Page según perfil #Ajustes
- [ ] Definir Conjunto de permisos según el perfil o rol #Ajustes 
- [ ] Responsabilidad Única, cada script debe encargarse de una única tarea #Desarrollo 
- [ ] Proteger las credenciales de acceso para ejecutar los scripts con permisos elevados #Seguridad 
- [ ] Firmar digitalmente los scripts para evitar su manipulación y modificación #Seguridad 

## 5. Documentación

- [ ] Crear documentación detallada sobre los perfiles y permisos implementados #Documentación
- [ ] Crear una guía de usuario para cada departamento sobre el uso de sus perfiles y permisos #GuíaUsuario
- [ ] Documentar dependencias y herramientas necesarias para la ejecución de scripts

## 6. Formación y Soporte

- [ ] Realizar sesiones de formación para cada departamento sobre el uso de sus perfiles y permisos #Formación
- [ ] Proporcionar soporte continuo para cualquier problema o consulta relacionada con los perfiles y permisos #Soporte
- [ ] Revisasr sistemas de Logs y Warnings

# 7. Mantenimiento y Control

- [ ] Inspección de equipos
  - Verificar estado de funcionamiento
  - Revisar niveles de fluidos
- [ ] Programación de mantenimiento preventivo
  - Planificar fechas para revisiones periódicas
  - Coordinar con el personal de mantenimiento
- [ ] Actualización de registros
  - Documentar las inspecciones realizadas
  - Registrar cualquier mantenimiento realizado
- [ ] Evaluación de riesgos
  - Identificar posibles riesgos en los equipos
  - Implementar medidas de control y seguridad
- [ ] Capacitación del personal
  - Brindar formación sobre el manejo adecuado de los equipos
  - Instruir sobre la detección de posibles problemas

# 8. Seguridad y Auditoría

- [ ] Revisar políticas de seguridad
  - Actualizar todas las contraseñas según la política de seguridad establecida
  - Revisar y ajustar los permisos de acceso de acuerdo con las responsabilidades del personal
- [ ] Realizar auditoría de seguridad
  - Identificar y documentar posibles vulnerabilidades en el sistema
  - Evaluar la efectividad de los protocolos de seguridad actuales
- [ ] Capacitación del personal en seguridad informática
  - Programar y coordinar sesiones de entrenamiento en seguridad informática
  - Proporcionar material educativo y recursos para el personal
- [ ] Implementar medidas de seguridad adicionales
  - Configurar e instalar firewalls y antivirus en todos los dispositivos
  - Establecer y documentar procedimientos de respaldo de datos de manera regular
- [ ] Alinear las medidas de seguridad con los objetivos del proyecto
  - Garantizar que las políticas de seguridad no impacten negativamente en la eficiencia operativa del proyecto
  - Evaluar y abordar los riesgos potenciales específicos para el proyecto en relación con la seguridad.

# Despliegue

- [ ] Preparar el entorno de producción
- [ ] Configurar servidores de aplicación
- [ ] Implementar la aplicación
- [ ] Realizar pruebas de despliegue
- [ ] Verificar disponibilidad post-despliegue
