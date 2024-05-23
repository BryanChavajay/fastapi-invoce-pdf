# Descargamos la imagen base de ubuntu
FROM ubuntu:22.04

# Información del mantenedor de la imagen
LABEL maintainer="bchavajaydev@gmail.com"
LABEL version="1.0"
LABEL description="Este es un repositorio para desplegar \
aplicaciones Python junto a WKHTMLTOPDF."

# Desabilitamos los mensajes durante la instalacion
ARG DEBIAN_FRONTEND=noninteractive

# Actualizamos el repositorio de software de Ubuntu
RUN apt update

# Instalamos paquetes desde los repositorios de ubuntu
RUN apt install -y python3 python3-pip wkhtmltopdf && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

# Variable de entorno con la direccion de wkhtmltopdf
ENV WKHTMLTOPDF_PATH=/usr/bin/wkhtmltopdf

# Creamos un directorio de trabajo
WORKDIR /code

# Copiamos requirements en la carpeta de trabjo
COPY ./requirements.txt /code/requirements.txt

# Instalamos las dependencias de python
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copiamos el codigo en el directorio
COPY ./app /code/app

# Exponemos un puerto para correr la aplicacion
EXPOSE 8081

# Levantamos el servidor
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8081"]