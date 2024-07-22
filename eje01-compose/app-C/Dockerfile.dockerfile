#FROM diz2804/app-web:v1
#seleccionamos la imagen
FROM nginx

#creamos el directorio de trabajo
WORKDIR /var/www/html/app-web

#agregamos configuraciones
COPY  ./default.conf /etc/nginx/conf.d/

#instalamos programas
RUN apt-get update && apt-get install -y iputils-ping
