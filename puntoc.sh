#!/bin/bash

echo "Punto C: Creacion Usuarios"

echo "Creando grupos..."
sudo groupadd grupodevops
sudo groupadd grupodevelopers
sudo groupadd grupotesters

echo "Creando usuarios..."
sudo useradd -m -s /bin/bash -c "Usuario developer1" -G grupodevops,grupodevelopers developer1
sudo useradd -m -s /bin/bash -c "Usuario tester1" -G grupotesters tester1
sudo useradd -m -s /bin/bash -c "Usuario devops1" -G grupodevops,grupodevelopers devops1
sudo useradd -m -s /bin/bash -c "Usuario devops2" -G grupodevops devops2

echo "Asignando permisos a carpetas..."
sudo chown developer1:grupodevelopers ./Examenes-UTN/alumno_1
sudo chmod 750 ./Examenes-UTN/alumno_1

sudo chown tester1:grupotesters ./Examenes-UTN/alumno_2
sudo chmod 760 ./Examenes-UTN/alumno_2

sudo chown devops1:grupodevops ./Examenes-UTN/alumno_3
sudo chmod 700 ./Examenes-UTN/alumno_3

sudo chown devops2:grupodevops ./Examenes-UTN/profesores
sudo chmod 775 ./Examenes-UTN/profesores

echo "creando archivo validar.txt"
carpetas=("alumno_1" "alumno_2" "alumno_3" "profesores")
nombres_usuarios=("developer1" "tester1" "devops1" "devops2")

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
