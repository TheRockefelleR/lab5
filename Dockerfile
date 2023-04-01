# Etap pierwszy
# Wykorzystanie obrazu bazowego alpine
FROM node:alpine as etapPierwszy

# Okreslenie zmiennej odpowiadajacej za przypisanie wersji podczas budowy kontenera
ARG VERSION
ENV APP_VERSION=$VERSION

# Okreslenie katalogu roboczego kontenera
WORKDIR /app

# Przekopiowanie plikow json do kontenera
COPY package*.json ./

# Instalacja wszystkich wymaganych zaleznosci node
RUN npm install

# Doinstalowanie możliwości budowania aplikacji
RUN npm install --save-dev babel-cli

# Przekopiowanie plikow do kontenera
COPY . .

# Uruchomienie naszej aplikacji
# CMD ["npm", "start"]
# Zbudowanie naszej aplikacji
RUN npm run build


# Etap drugi
FROM nginx:latest

# Przekopiowanie zbudowanej strony
COPY --from=etapPierwszy /app/dist /usr/share/nginx/html/dist/

# Usuniecie starej konfiguracji nginx
RUN rm /etc/nginx/conf.d/default.conf

# Skopiowanie nowej konfiguracji ngnix
COPY default.conf /etc/nginx/conf.d/

# Nasłuchiwanie wewnetrzne na porcie 80
EXPOSE 80

# Sprawdzenie dzialania aplikacji
HEALTHCHECK --interval=10s --timeout=1s \
  CMD curl -f http://localhost:80/ || exit 1

# Uruchomienie nginx
ENTRYPOINT [ "nginx" ]
CMD ["-g", "daemon off;"]

