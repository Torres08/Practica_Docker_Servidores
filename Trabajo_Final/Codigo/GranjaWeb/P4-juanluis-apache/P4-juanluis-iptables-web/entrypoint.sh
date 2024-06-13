#!/bin/bash
# Ejecuta el script de iptables
./juanluis-iptables-web.sh
# Luego, ejecuta el comando principal del contenedor
exec "$@"