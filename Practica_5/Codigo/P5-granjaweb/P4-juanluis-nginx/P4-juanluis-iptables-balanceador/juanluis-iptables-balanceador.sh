# 1. Limitación de la tasa de conexiones nuevas por IP para evitar la
# saturación de los recursos del servidor.
iptables -A INPUT -p tcp --syn -m connlimit --connlimit-above 3 -j REJECT
iptables -A INPUT -p tcp --syn -m limit --limit 3/s --limit-burst 6 -j ACCEPT

# 2. Uso de módulos como recent para detectar y bloquear rápidamente el
# tráco anómalo y prevenir inundaciones de IPs.
iptables -A INPUT -p tcp --dport 80 -m recent --name badguy --rcheck --seconds 60 --hitcount 3 -j REJECT
iptables -A INPUT -p tcp --dport 80 -m recent --name badguy --remove
iptables -A INPUT -p tcp --dport 80 -m recent --name badguy --set -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -m recent --name badguy_https --rcheck --seconds 60 --hitcount 10 -j REJECT
iptables -A INPUT -p tcp --dport 443 -m recent --name badguy_https --remove
iptables -A INPUT -p tcp --dport 443 -m recent --name badguy_https --set -j ACCEPT

# 3. Protección Contra Ataques de Fragmentación.
# 3.1 Bloquear fragmentos de paquetes que no son el primer fragmento
iptables -A INPUT -f -j DROP

# 3.2 Verificar el tamaño mínimo de fragmentos permitidos
iptables -A INPUT -p tcp -f --fragment -m length --length 40:65535 -j ACCEPT


