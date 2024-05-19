# Partimos de la imagen de UBUNTU 22.04
FROM ubuntu:22.04

# Actualizamos los repositorios e instalamos Python
# RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC
RUN apt-get update
RUN apt-get upgrade -y

# Download and install wkhtmltopdf
RUN apt-get install -y python3 python3-pip wkhtmltopdf

# RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb
# RUN gdebi --n wkhtmltox_0.12.6.1-2.jammy_amd64.deb
# # ENTRYPOINT ["wkhtmltopdf"]

# # Show the extended help
# # CMD ["-h"]

# # Ejecuta "which wkhtmltopdf" y guarda la ruta en una variable de entorno
# RUN WKHTMLTOPDF_PATH=$(which wkhtmltopdf) && \
#     echo "export WKHTMLTOPDF_PATH=$WKHTMLTOPDF_PATH" >> /etc/profile

# # Activa la variable de entorno en el perfil
# RUN echo "source /etc/profile" >> ~/.bashrc

# # Reinicia el shell
# RUN exec bash

ENV WKHTMLTOPDF_PATH_ENV=/usr/bin/wkhtmltopdf

# Creamos un directorio de trabajo
WORKDIR /code

# Copiamos requirements en la carpeta de trabjo
COPY ./requirements.txt /code/requirements.txt

# Instalamos las dependencias de python
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copiamos el codigo en el directorio
COPY ./app /code/app

# Exponemos un puerto para currer la aplicacion
EXPOSE 8080

# Levantamos el servidor
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]