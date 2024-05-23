# Partimos de la imagen preparada
FROM surnet/alpine-python-wkhtmltopdf:3.12.2-0.12.6-small

ENV WKHTMLTOPDF_PATH=/bin/wkhtmltopdf

# Creamos un directorio de trabajo
WORKDIR /code

# Copiamos requirements en la carpeta de trabjo
COPY ./requirements.txt /code/requirements.txt

# Instalamos las dependencias de python
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copiamos el codigo en el directorio
COPY ./app /code/app

# Exponemos un puerto para currer la aplicacion
EXPOSE 80

# Levantamos el servidor
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]