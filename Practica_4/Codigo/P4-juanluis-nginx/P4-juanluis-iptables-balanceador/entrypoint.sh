#!/bin/bash
# Ejecuta el script de iptables
./juanluis-iptables-balanceador.sh

# Ejecutar tcpdump para capturar y registrar las solicitudes GET
tcpdump -i eth0 -n -A -s 0 'tcp dst port 80 and (tcp[((tcp[12] & 0xf0) >> 2):4] = 0x47455420)' >> /var/log/nginx_get_requests.log &


# Luego, ejecuta el comando principal del contenedor
exec "$@"