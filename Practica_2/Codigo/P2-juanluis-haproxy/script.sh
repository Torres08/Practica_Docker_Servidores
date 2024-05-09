#!/bin/bash
# Escalado dinámico

# Contador máximo de contenedores web
max=1
times=0

# Definir el nombre del balanceador
balanceador="balanceador-haproxy-1"

cpu2=$(docker stats --no-stream --format "{{.Name}} {{.CPUPerc}}" | grep "balanceador" | awk '{print $2}' | sed 's/%//')
 
if (( $(echo "$cpu2 < 10 | bc -l) )); then
    echo "Cerrando contenedores web por poca carga..."
    docker ps -q --filter "name=web" | grep -v "$(docker ps -q --filter "name=${balanceador}")" | tail -n +2 | xargs -I {} docker stop {} >/dev/null 2>&1
fi

# Bucle principal
while true; do
    # Mostrar mensaje de comprobación
    echo "Realizando comprobación..."

    # Contadores web activos
    web=$(docker ps --format '{{.Names}}' --filter status=running | grep web)
    num_containers=$(echo "$web" | wc -w)
    
    # Monitorizar la CPU del balanceador
    cpu=$(docker stats --no-stream --format "{{.Name}} {{.CPUPerc}}" | grep "balanceador" | awk '{print $2}' | sed 's/%//')
    
    # Valor crítico para la CPU
    valor_critico_cpu=70

    # Mostrar información de la CPU
    echo "Uso de CPU: $cpu"
    echo "Valor Critico: 70"
    
    # Comprobar si la CPU es críticamente alta
    if (( $(echo "$cpu > $valor_critico_cpu" | bc -l) )); then
        echo "Necesito abrir un nuevo contenedor debido a la sobrecarga de la CPU..."
        # docker compose up -d web_3 
         #echo "docker-compose up -d web$((num_containers + 1))"
         #docker compose up -d web$((num_containers))

        if docker ps --format '{{.Names}}' | grep -q "web$num_containers"; then
            echo "El servicio web$num_containers ya está en ejecución. Aumentando la escala del servicio..."
            docker-compose up -d web=$((num_containers + 1))
        else
            echo "El servicio web$num_containers no está en ejecución. Iniciando un nuevo contenedor..."
            docker-compose up -d web$((num_containers + 0))
        fi 

        times=0
    fi

    # Incrementar el contador de comprobaciones
    times=$((times + 1))

    # Si se han realizado suficientes comprobaciones, salir del bucle
    if ((times >= 5)); then
        break
    fi

    # Esperar antes de realizar la siguiente comprobación
    sleep 10
done

echo "Escalado dinámico completado."







