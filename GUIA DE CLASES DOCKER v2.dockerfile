key 
https://drive.google.com/drive/folders/1IdhffYyk4EGfR0fahAWiWxqmzk67k8wL?usp=sharing
#--------------Installar Docker Debian---------------------
    https://docs.docker.com/engine/install/debian/

sudo service docker start
sudo docker run hello-world
#primer contenedor 
docker run  --name test -d -p 81:5000 training/webapp python app.py

#hacer una nginx con alpin
#---- creando la pagina web
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenido a Alpine</title>
</head>
<body>
    <h1>¡Hola, mundo!</h1>
    <p>Esta es una página web servida desde un contenedor Docker con Alpine Linux y nginx.</p>
</body>
</html>
publicar este sitio mv 
https://github.com/julianjp18/template-free-html5-bootstrap
#-------------------creando el conedor  e ingresando --------

    docker run -it --name mi-servidor-web-nginx nginx


    exit
    docker cp index.html mi-servidor-web-nginx:/usr/share/nginx/html/index.html

    docker commit mi-servidor-web-nginx mi-servidor-web-nginx:con-nginx

    docker stop mi-servidor-web-nginx
    docker rm mi-servidor-web-nginx

    docker run -d -p 8080:80 mi-servidor-web-nginx:nginx     nginx -g 'daemon off;'

#----------CREAR IMAGEN DE CONTENEDOR CORRIENDO---------------

    hacer commint para crer una imagen 

docker commit -m "Seagrego un nano " -a "Zometa" id_contenedor   ususariohub/nombre_contenedor:version
#---------------USO DE VOLUMEN-----------------------------------
    #-----volumen tipo host

    docker run --name MyApp-B  -ti -d -p 8081:80 -v ./app:/var/www/primeiro-site/  diz2804/debian-conf-nginx:v3

    #---- volumen mandejados por docker----

    docker volume create mi_volumen
    docker run -d -v mi_volumen:/usr/share/nginx/html/ --name mi_contenedor nginx
    #borrar bolumen ----------------
    docker volume rm mi_volumen 
#creando una red/--Bridge (puente): La red predeterminada para contenedores en un host único.
Bridge (puente): La red predeterminada para contenedores en un host único.
Host: El contenedor comparte la pila de red del host.
None: Desactiva completamente la red para el contenedor.


docker network create --subnet=192.168.10.0/24 private_bridge
docker run -d --name mi_contenedorA --network private_bridge --ip 192.168.10.11 -p 8087:80 nginx 
docker run -d --name mi_contenedorB--network private_bridge --ip 192.168.10.12 -p 8088:80 nginx 

instalar herramienta para hacer ping  apt-get update && install iputils-ping

#----conectando dos contenedores
                             red            contenedor
docker network connect  private2-network mi_contenedorA

#creando contenedor BD

docker run -d --name servidor_mysql --network red_wp -e MYSQL_DATABASE=bd_wp -e MYSQL_USER=user_wp -e MYSQL_PASSWORD=asdasd -e MYSQL_ROOT_PASSWORD=asdasd mariadb

#Creando un contenedor web
docker run -d --name servidor_wp --network red_wp -e WORDPRESS_DB_HOST=servidor_mysql -e WORDPRESS_DB_USER=user_wp -e WORDPRESS_DB_PASSWORD=asdasd -e WORDPRESS_DB_NAME=bd_wp -p 80:80  wordpress




#-----------------------docker file node ejecutar entorno dev
# Usar una imagen base oficial de Node.js
FROM node:14

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo package.json y package-lock.json
COPY package*.json ./

# Instalar las dependencias de la aplicación
RUN npm install

# Copiar el código fuente de la aplicación
COPY . .

# Instalar nodemon globalmente
RUN npm install -g nodemon

# Exponer el puerto en el que la aplicación va a ejecutarse
EXPOSE 8080

# Comando para ejecutar la aplicación en modo desarrollo
CMD ["sh", "-c", "npm install && nodemon index.js"]

#//////////////////////////////////////////////buildear

docker build -t  node-dev .

#/////////////////////////////////ejecutar
docker run   --restart unless-stopped -p 8080:8080 -v $(pwd):/app  node-dev


#/////////////////////descargar fuente
https://github.com/dzometa/nodejs.git




#///////////////instalar docker-compose
https://docs.docker.com/compose/install/standalone/

















https://docs.aws.amazon.com/es_es/serverless-application-model/latest/developerguide/install-docker.html

comandos para eliminar en Docker 
https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes-es

publicar un sitio 



hacer commint para crer una imagen 

docker commit -m "Seagrego un nano " -a "Zometa" id_contenedor   ususariohub/nombre_contenedor:version


FROM training/webapp

MAINTAINER David Zometa 

RUN install 

#--- subir imagen a docker hub 

se tagea la imagen 
docker tag nodejs-webapp 0gis0/nodejs-webapp:v1
---se hace el push con la imagen taggeada
docker push 0gis0/nodejs-webapp:v1


#DOCKERFILE
# Usa la imagen base de Alpine
FROM alpine:latest

# Instala Nginx
RUN apk --no-cache add nginx

# Copia los archivos de la aplicación al directorio de Nginx
COPY myapp /usr/share/nginx/html

# Copia el archivo de configuración de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Expone el puerto 80
EXPOSE 80

# Comando para ejecutar Nginx en el primer plano
CMD ["nginx", "-g", "daemon off;"]


#----------------------NNGINX.CONF-------------------------
    events {}

http {
    server {
        listen 80;
        server_name localhost;

        location / {
            root /usr/share/nginx/html;
            index index.html;
        }
    }
}



#---------------------estructura de archivos debería verse así:--------
    /path/to/project
│
├── Dockerfile
├── nginx.conf
└── myapp
    ├── index.html
    └── (otros archivos de tu aplicación)


#-----------------------INDEX.HTML---------------------------------
    <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido al curso de Docker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <h1>Hola Mundo</h1>
    <p>Bienvenido al curso de Docker</p>
</body>
</html>

#----------------------CONSTRUIR IMAGEN------------------------

    docker build -t my-nginx-app .

#----------------------EJECUTAR CONTENEDOR------------------------

    docker run -p 8080:80 my-nginx-app
#-----------------TAG AL CONTENDOR ---------------------------------

    docker build -t my-nginx-app:v1.0 .
#-------OTRA FORMA DE HACER EL TAG------------------------------
    docker tag myapp-nginx diz2804/myapp-nginx:v1


#---------------TRABAJANDO VOLUMEN-----------------------------
  
mkdir ~/container_logs

docker run -d -v ~/container_logs:/var/log/nginx -p 81:80 -ti nginx 


