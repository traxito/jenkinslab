#!/bin/bash
echo 'creando entorno virtual'
virtualenv --python=python3 entornovirtual
source entornovirtual/bin/activate
pip install -r requirements.txt
echo 'instalando requirements'
python src/main.py &
echo 'ejecutando aplicación'
cd src && pytest test_main.py && cd ..
echo 'creando docker image'
docker build -t jenkinsdockertest:latest .
echo 'subiendo imagen docker hub'
docker tag jenkinsdockertest:latest traxito/jenkinsdockertest:latest
docker push traxito/jenkinsdockertest:latest
