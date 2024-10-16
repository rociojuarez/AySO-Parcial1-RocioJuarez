#!/bin/bash
echo "Punto B: Se muestra la estructura de discos con lsblk:"
sudo lsblk
DISK="/dev/sda"

echo "Desmontando las particiones del pendrive..."
sudo umount ${DISK}*

echo "Eliminando particiones existentes..."
sudo fdisk ${DISK} <<EOF
d
d
d
d
d
w
EOF

echo "Creando particiones..."
sudo fdisk ${DISK} <<EOF
n
p
1

+2G
n
p
2

+2G
n
p
3

+2G
n
e
4


n




w
EOF


echo "Formateando..."
sudo mkfs.ext4 ${DISK}1
sudo mkfs.ext4 ${DISK}2
sudo mkfs.ext4 ${DISK}3
sudo mkfs.ext4 ${DISK}4

echo "Montando particiones en /mnt..."
mkdir -p /mnt/part1 /mnt/part2 /mnt/part3 /mnt/part4

sudo mount ${DISK}1 /mnt/part1
sudo mount ${DISK}2 /mnt/part2
sudo mount ${DISK}3 /mnt/part3
sudo mount ${DISK}5 /mnt/part4

echo "Verificando el punto con lsblk:"
lsblk
