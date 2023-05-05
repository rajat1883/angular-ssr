FROM node:18-alpine

RUN mkdir -p /app

WORKDIR /app

COPY ./package.json /app/

RUN npm install

COPY . /app

RUN node_modules/.bin/ng build --configuration production

RUN node_modules/.bin/ng run angular-ssr:server:production

EXPOSE 80

CMD ["node", "app/dist/angular-ssr/server/main.js"]