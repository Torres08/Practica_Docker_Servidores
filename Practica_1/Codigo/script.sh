#!/bin/bash

# Comando para listar todos los contenedores (nombre y estado)
list_cmd="docker ps -a --format '{{.Names}}:{{.State}}'"

# Comando para iniciar un contenedor
start_cmd="docker start"

# Función para verificar y reintentar contenedores problemáticos
function check_and_retry_container {
    local container_name=$1
    local attempts=0
    local max_attempts=2
    local wait_time=5 # Tiempo de espera en segundos entre intentos

    while [ $attempts -lt $max_attempts ]; do
        ((attempts++))
        echo "Intentando iniciar $container_name, intento $attempts"
        $start_cmd $container_name > /dev/null

        sleep $wait_time # Esperar antes de verificar el estado

        # Verificar el estado después del intento de inicio
        local status=$(docker inspect --format '{{.State.Running}}' $container_name)
        if [ "$status" == "true" ]; then
            echo "$container_name iniciado exitosamente."
            return 0 # Éxito, el contenedor está corriendo
        fi
    done

    echo "Error: No se pudo iniciar $container_name después de $max_attempts intentos."
    return 1 # Fracaso después de reintentos
}

# Inicializar la variable para guardar contenedores con problemas persistentes
problem_containers=""

# Obtener y procesar la lista de contenedores antes de inicializar Docker Compose
echo "Listando contenedores antes de inicializar Docker Compose:"
eval $list_cmd

# Iniciar Docker Compose
echo "Inicializando Docker Compose..."
docker-compose up -d

# Esperar unos segundos para que los contenedores se inicien completamente
sleep 10

# Comprobar que todos los 7 contenedores se hayan ejecutado correctamente
echo "Comprobando el estado de los contenedores:"
for i in {1..7}; do
    container_name="codigo_web${i}_1"
    container_state=$(docker inspect --format '{{.State.Running}}' $container_name)
    if [ "$container_state" != "true" ]; then
        problem_containers+="$container_name "
    fi
done

# Notificar sobre contenedores con problemas
if [ -n "$problem_containers" ]; then
    echo "Error: Los siguientes contenedores no se han ejecutado correctamente: $problem_containers"
else
    echo "Todos los 7 contenedores se han ejecutado correctamente."
fi
