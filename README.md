# DESPLEGAR API CON FASTAPI JUNTO CON WKHTMLTOPDF

## Inicio

Bienvenido 👋

Te preguntarás de que va este repositorio, básicamente se trata de un ejercicio donde se crean PDFs con python mediante la incorporación de la herramienta WKHTMLTOPDF. Los PDFs se sirve mediante una api creada con el framework Fastapi.

Este ejercicio, sirve como ejemplo de como crear PDFs con python así como diferentes métodos para el despliegue. Tomalo como un ejemplo de despliegues, **recuerda que esto es un ejemplo, por lo que hay mejoras que se pueden hacer**

## Métodos de instalación

1. Instalación en windows

   - Descarga WKTMLTOPDF,
     ve a la página oficial de https://wkhtmltopdf.org/index.html y descarga el instador para windows

   - Ejecuta el instalador de WKTMLTOPDF (recomiendo no cambiar la ruta de instalación por defecto)

   - Clona el repositorio

   ```
   git clone https://github.com/BryanChavajay/fastapi-invoce-pdf.git
   ```

   - Navega hacía la carpeta del proyecto

   ```bash
    cd fastapi-invoce-pdf
   ```

   - (Opcional) Crea un entorno virtual

   ```bash
    python -m venv venv
    venv\Scripts\activate
   ```

   - Instala las librerias que utilizá el proyecto

   ```bash
    pip install -r requirements.txt
   ```

   - Crea una variable de entorno o bien un archivo .env con la siguiente variable **WKHTMLTOPDF_PATH=C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe** sino cambiaste la ruta por defecto de instalación esta debería servir, sino, busca la carpeta donde se instaló y cambia la ruta

   - Arranca el servidor

   ```bash
    uvicorn app.main:app --reload --port 8081
   ```

   - Si todo salio bien, deberías poder generar una factura en la siguiente ruta: http://localhost:8081/invoce

2. Despliegue con Docker

   Esta opción es la que más recomiendo si decides desplegar tu aplicación con docker, esta basada en una imagen de la comunidad que esta bastante optimizada. El código lo encuentras en el archivo Dockerfile.

   - Clona el repositorio

   ```
   git clone https://github.com/BryanChavajay/fastapi-invoce-pdf.git
   ```

   - Navega hacía la carpeta del proyecto

   ```bash
    cd fastapi-invoce-pdf
   ```

   - Construye la imagen

   ```bash
   docker build -t miImagenPythonPDF .
   ```

   - Despliega la imagen

   ```bash
   docker run -d --name fastapi-facturas -p 8081:8081 miImagenPythonPDF
   ```

   - Si todo salio bien, deberías poder generar una factura en la siguiente ruta: http://localhost:8081/invoce

3. Despliegue con Docker

   Esta opción es un poco más complicada que la anterior, ya que partimos de la imagen base de Ubuntu 22.04 y vamos instalando de forma manual lo que necesitamos.

   - Clona el repositorio

   ```
   git clone https://github.com/BryanChavajay/fastapi-invoce-pdf.git
   ```

   - Navega hacía la carpeta del proyecto

   ```bash
    cd fastapi-invoce-pdf
   ```

   - Remplaza el contenido del archivo Dockerfile por el del archivo 02-Dockerfile.txt
   - Construye la imagen

   ```bash
   docker build -t miImagenPythonPDF .
   ```

   - Despliega la imagen

   ```bash
   docker run -d --name fastapi-facturas -p 8081:8081 miImagenPythonPDF
   ```

   - Si todo salio bien, deberías poder generar una factura en la siguiente ruta: http://localhost:8081/invoce

NOTA: **Esto es solamente un ejemplo, puede complementarse el Dockerfile con otras configuraciones, toma esto solo como una base**

1. Despliegue con Docker

   Esta opción es la más complicada de todas, partimos de la imagen base de Ubuntu 22.04 pero en vez de instalar WKHTMLTOPDF desde los repositorios oficiales de Ubuntu, descargamos e instalamos el archivo .deb de forma manual.

   - Clona el repositorio

   ```
    git clone https://github.com/BryanChavajay/fastapi-invoce-pdf.git
   ```

   - Navega hacía la carpeta del proyecto

   ```bash
    cd fastapi-invoce-pdf
   ```

   - Remplaza el contenido del archivo Dockerfile por el del archivo 03-Dockerfile.txt
   - Construye la imagen

   ```bash
   docker build -t miImagenPythonPDF .
   ```

   - Despliega la imagen

   ```bash
   docker run -d --name fastapi-facturas -p 8081:8081 miImagenPythonPDF
   ```

   - Si todo salio bien, deberías poder generar una factura en la siguiente ruta: http://localhost:8081/invoce

NOTA: **Esto es solamente un ejemplo, puede complementarse el Dockerfile con otras configuraciones, toma esto solo como una base**

## Comentarios finales

Esto es solamente un ejemplo, antes de salir a producción revisa cuidadosamente su cumple con los parámetros que debes cumplir.

Suerte en tus despliegues 🫡.
