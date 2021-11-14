#!/bin/bash
echo "Instalando java" 
sudo apt-get update
sudo apt-get install default-jdk -y
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

echo "instalando apache2"
sudo apt-get apache2 -y

echo "instalando jmeter"
sudo mkdir archivos
sudo cd archivos
sudo wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.1.tgz
sudo wget https://www.apache.org/dist/jmeter/binaries/apache-jmeter-5.4.1.tgz.asc
sudo wget http://www.apache.org/dist/jmeter/KEYS
sudo gpg --import KEYS
sudo gpg --verify apache-jmeter-5.4.1.tgz.asc
sudo tar -xzvf apache-jmeter-5.4.1.tgz
sudo mv apache-jmeter-5.4.1 /usr/local/jmeter

echo "colocando todos los archivos de configuración"
sudo cd /var/www/html
sudo mkdir metricas
sudo cp /vagrant/index.html /var/www/html/index.html
sudo cd /usr/local/jmeter
sudo mkdir pruebas
sudo cd pruebas
sudo cp /vagrant/parcial1.jmx .
sudo cp /vagrant/apy.py .
sudo mkdir logs


