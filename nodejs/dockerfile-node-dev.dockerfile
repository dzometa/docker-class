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



