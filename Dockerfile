FROM python:3.10

# Crear usuario que ejecuta la app
RUN adduser --disabled-password --gecos '' api-user

# Definir directorio de trabajo 
WORKDIR /opt/prediccionSalarios-api-abc

ENV PYTHONPATH=/opt/prediccionSalarios-api-abc

# Instalar dependencias
ADD ./prediccionSalarios-api-abc /opt/prediccionSalarios-api-abc/

RUN pip install --upgrade pip
RUN pip install -r /opt/prediccionSalarios-api-abc/requirements.txt

# Hacer el directorio de trabajo ejecutable 
RUN chmod +x /opt/prediccionSalarios-api-abc/run.sh
# Cambiar propiedad de la carpeta a api-user 
RUN chown -R api-user:api-user ./

USER api-user
# Puerto a exponer para la api 
EXPOSE 8001

# Comandos a ejecutar al correr el contenedor 
CMD ["bash", "./run.sh"]


