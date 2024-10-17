#!/bin/bash

echo "Punto F: Filtros Avanzados"

echo "" > "Filtro_Avanzado.txt"

public_ip=$(curl -s ifconfig.me)
echo "Mi IP pública es: $public_ip" >> "Filtro_Avanzado.txt"

username=$(whoami)
echo "Mi usuario es: $username" >> "Filtro_Avanzado.txt"

hash=$(sudo grep "^$username:" /etc/shadow)
echo "El hash de mi usuario es: $hash" >> "Filtro_Avanzado.txt"

echo "Información guardada en Filtro_Avanzado.txt"
