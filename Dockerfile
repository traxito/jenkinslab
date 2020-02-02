FROM ubuntu:19.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python-pip python -y
#creem un directori on deixar els arxius de la app
RUN mkdir /opt/app
#copiem els axius al directori creat
COPY pruebapython/main.py /opt/app
#Copiem i executem els requeriments del arxiu requirements
COPY requirements.txt /opt/app
RUN pip install -r /opt/app/requirements.txt

#executem l'arxiu python
ENTRYPOINT "python /opt/app/main.py"
