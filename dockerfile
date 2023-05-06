FROM node:18-alpine

RUN mkdir -p /app

WORKDIR /app

COPY ./package.json /app/

RUN npm install

COPY . /app

RUN node_modules/.bin/ng build --configuration production

RUN node_modules/.bin/ng run angular-ssr:server:production

CMD ["node", "dist/angular-ssr/server/main.js"]