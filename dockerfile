# Basis-Image
FROM nginx:latest

# Setze den Arbeitsverzeichnis auf das Nginx-Web-Root
WORKDIR /usr/share/nginx/html

# Kopiere den Inhalt des aktuellen Verzeichnisses in das Arbeitsverzeichnis
COPY . .

# Exponiere den Port 80
EXPOSE 80

# Starte den Nginx-Server
CMD ["nginx", "-g", "daemon off;"]
