# Estagio 1 - Será responsavel em construir nossa aplicação
FROM node:10.24.1-slim as node
WORKDIR /my-app
COPY my-app/package*.json /my-app/
RUN npm i npm@latest -g
RUN npm install
COPY ./my-app /my-app/
ARG env=prod
RUN npm run build

# Estagio 2 - Será responsavel por expor a aplicação
FROM nginx:1.13
COPY --from=node /my-app/dist/angular-nodejs-example /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

