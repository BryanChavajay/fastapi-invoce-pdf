import pdfkit
from jinja2 import Environment, FileSystemLoader
import os
from fastapi import FastAPI
from fastapi.responses import FileResponse
from decouple import config as con

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/invoce")
def send_invoce():
    env = Environment(loader=FileSystemLoader("app"))
    template = env.get_template("template-factura.html")

    detalle_compra = [
        {
            "cantidad": 2,
            "producto": """ASUS FA506IHR-HN08 RYZEN 5 3GHZ 8GB 512GB SSD 15.6 W11H GTX1650
                4GB Garantia: 12 Mes(es)""",
            "precio_unitario": 6817.00,
            "descuento": 954.00,
            "sub_total": 12680,
        },
    ]

    template_vars = {
        "nit_comprador": "12345678-9",
        "nombre_comprador": "DOE,JOHN",
        "imagen_url": "'file:///"
        + os.getcwd().replace("\\", "/")
        + "/app/logo-empresa.jpg'",
        "detalle_compra": detalle_compra,
    }

    html_string = template.render(template_vars)

    path_wkhtmltopdf = con("WKHTMLTOPDF_PATH")
    config = pdfkit.configuration(wkhtmltopdf=path_wkhtmltopdf)

    ## Newly added options
    options = {
        "page-size": "Letter",
        "margin-top": "0.5in",
        "margin-right": "0.5in",
        "margin-bottom": "0.5in",
        "margin-left": "0.5in",
        "encoding": "UTF-8",
        "enable-local-file-access": None,
        "no-outline": None,
        "orientation": "Portrait",
        # "header-font-name": "Arial",
        # "header-font-size": 9,
        # "header-center": "Probando hacer facturas",
        "footer-font-name": "Arial",
        "footer-font-size": 9,
        # "footer-right": "Created on " + str(my_date),
        "footer-center": "Página [page] de [topage]",
        # "footer-left": "Created by: JohnDoe",
        "enable-toc-back-links": None,
        "images": True,
    }

    css_path = os.path.join(os.getcwd(), "app", "estilos.css")

    pdfkit.from_string(
        html_string, "factura.pdf", configuration=config, options=options, css=css_path
    )

    invoce_path = os.getcwd().replace("\\", "/") + "/factura.pdf"

    return FileResponse(invoce_path)
