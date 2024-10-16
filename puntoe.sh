#!/bin/bash

echo "Punto E: Filtros Basicos"
echo "" > Filtro_Basico.txt

echo "Total de Memoria RAM:" >> Filtro_Basico.txt
grep "MemTotal" /proc/meminfo >> Filtro_Basico.txt

echo -e "\nFabricante del Chasis:" >> Filtro_Basico.txt
sudo dmidecode -t chassis | grep "Manufacturer" >> Filtro_Basico.txt

echo "Información guardada en Filtro_Basico.txt"
