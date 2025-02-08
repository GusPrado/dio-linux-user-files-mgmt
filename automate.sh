#!/bin/bash

echo "Creating new directories..."
mkdir /public && mkdir /adm && mkdir /ven && mkdir /sec

echo "Creating new groups..."

groupadd GRP_AD && groupadd GRP_VEN && groupadd GRP_SEC

echo "Creating new users and add to their groups..."
useradd -g GRP_ADM -d /adm -m -s /bin/bash carlos -p $(openssl passwd -crypt Senha123) && useradd -g GRP_ADM -d /ven -m -s /bin/bash maria -p $(openssl passwd -crypt Senha123) && useradd -g GRP_SEC -d /sec -m -s /bin/bash joao -p $(openssl passwd -crypt Senha123)

useradd -g GRP_VEN -d /ven -m -s /bin/bash debora -p $(openssl passwd -crypt Senha123) && useradd -g GRP_VEN -d /ven -m -s /bin/bash sebastiana -p $(openssl passwd -crypt Senha123) && useradd -g GRP_SEC -d /sec -m -s /bin/bash roberto -p $(openssl passwd -crypt Senha123)

useradd -g GRP_SEC -d /sec -m -s /bin/bash josefina -p $(openssl passwd -crypt Senha123) && useradd -g GRP_SEC -d /sec -m -s /bin/bash amanda -p $(openssl passwd -crypt Senha123) && useradd -g GRP_SEC -d /sec -m -s /bin/bash rogerio -p $(openssl passwd -crypt Senha123)

echo "Adding root owner to directories..."
chown root:GRP_ADM /adm && chown root:GRP_VEN /ven && chown root:GRP_SEC /sec

echo "Changing public directory permissions"
chmod 777 /public

echo "Changing user directories permissions"
chmod 770 /adm && chmod 770 /ven && chmod 770 /sec

echo "Finished!"
