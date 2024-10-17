#!/bin/bash

echo "Punto D: Estructuras asimetricas"

mkdir -p Estructura_Asimetrica/correo
mkdir -p Estructura_Asimetrica/clientes

for i in {1..50}; do
  touch Estructura_Asimetrica/correo/cartas_$i
  touch Estructura_Asimetrica/clientes/cartas_$i
done

for i in {1..10}; do
  touch Estructura_Asimetrica/correo/carteros_$i
done

tree Estructura_Asimetrica
