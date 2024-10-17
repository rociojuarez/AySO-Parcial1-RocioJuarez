#!/bin/bash

echo "Punto C: Creacion Usuarios"

echo "Creando grupos..."
sudo groupadd grupoprogramadores
sudo groupadd grupotester
sudo groupadd grupoanalistas
sudo groupadd grupodisenadores

echo "Creando usuarios..."
sudo useradd -m -s /bin/bash -c "Usuario programadores" -G grupoprogramadores programadores
sudo useradd -m -s /bin/bash -c "Usuario tester" -G grupotester tester
sudo useradd -m -s /bin/bash -c "Usuario analistas" -G grupoanalistas analistas
sudo useradd -m -s /bin/bash -c "Usuario disenadores" -G grupodisenadores disenadores

echo "Asignando permisos a carpetas..."
sudo chown programadores:grupoprogramadores ./Examenes-UTN/alumno_1
sudo chmod 750 ./Examenes-UTN/alumno_1

sudo chown tester:grupotester ./Examenes-UTN/alumno_2
sudo chmod 760 ./Examenes-UTN/alumno_2

sudo chown analistas:grupoanalistas ./Examenes-UTN/alumno_3
sudo chmod 700 ./Examenes-UTN/alumno_3

sudo chown disenadores:grupodisenadores ./Examenes-UTN/profesores
sudo chmod 775 ./Examenes-UTN/profesores

echo "creando archivo validar.txt"
carpetas=("alumno_1" "alumno_2" "alumno_3" "profesores")
nombres_usuarios=("programadores" "tester" "analistas" "disenadores")

ruta_archivo="./validar.txt"

echo "" > "$ruta_archivo"

for usuario in "${nombres_usuarios[@]}"; do
  if id "$usuario" &>/dev/null; then
    for carpeta in "${carpetas[@]}"; do
      if [ -d "./Examenes-UTN/$carpeta" ]; then
        whoami_output=$(sudo -u "$usuario" whoami)
        echo "$whoami_output en la carpeta $carpeta" >> "$ruta_archivo"
      else
        echo "La carpeta ./Examenes-UTN/$carpeta no existe." >> "$ruta_archivo"
      fi
    done
  else
    echo "El usuario $usuario no existe." >> "$ruta_archivo"
  fi
done

echo "Archivo $ruta_archivo creado con éxito."
