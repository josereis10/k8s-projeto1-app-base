#!/bin/bash

echo "Criando as imagens............."

docker build -t josereis10/projeto-backend:1.0 backend/.
docker build -t josereis10/projeto-database:1.0 database/.

echo "Realiazando push das imagens........."

docker push josereis10/projeto-backend:1.0
docker push josereis10/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments......."

kubectl apply -f ./deployment.yml
