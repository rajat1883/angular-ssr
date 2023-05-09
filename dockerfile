# Stage 1: Build the Angular app
FROM node:18 as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build:ssr

EXPOSE 8080

ENTRYPOINT ["npm", "run", "serve:ssr"]