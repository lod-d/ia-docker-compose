# Utilise l'image de base Nginx
FROM nginx:latest

# Copie les fichiers de l'application dans le répertoire Nginx
COPY ./dist/ /usr/share/nginx/html

# Copie le fichier de configuration Nginx personnalisé
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose le port 80 pour Nginx
EXPOSE 80

