# Establece la imagen base en Debian Buster slim
FROM debian:buster-slim

# Especifica el mantenedor de la imagen (obsoleto en Docker 1.13 y posteriores)
MAINTAINER José Manuel Soto Hidalgo <jmsoto@ugr.es>

# Actualiza los repositorios de apt-get y luego instala Apache
RUN apt-get update && apt-get install -y apache2

# Copia el archivo index.html desde el contexto de construcción al directorio del servidor web dentro del contenedor
COPY index.html /var/www/html/

# Define el comando predeterminado que se ejecutará al iniciar el contenedor
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
