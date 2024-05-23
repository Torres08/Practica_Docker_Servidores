#!/bin/bash

# deneagamos todo el trafico
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# manejamos el trafico de red entrante basado en el estado de las conexiones
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# manejamos el trafico de red saliente basado en el estado de las conexiones
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# manejamos el trafico de red de la misma máquina
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# manejamos el trafico HTTP y HTTPS permitiendo el trafico TCP entrante al 
# puerto 80 y 443
iptables -A INPUT -p tcp -s 192.168.10.50 --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.10.50 --dport 443 -j ACCEPT