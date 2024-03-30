#!/bin/bash

# Limpiando caché y temporales
echo "Limpiando caché y temporales..."
apt-get clean
apt-get autoclean
apt-get autoremove -y

# Actualizar paquetes del sistema
echo "Actualizando paquetes del sistema..."
apt-get update
apt-get upgrade -y

service apache2 status

echo "Tareas de mantenimiento completadas dentro del contenedor."