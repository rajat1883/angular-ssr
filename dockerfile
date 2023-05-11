# Stage 1: Build the Angular app
FROM node:18 as build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build:ssr

# Stage 2: Set up the server
FROM node:18 as serve
WORKDIR /app

COPY --from=build /app/dist ./dist

RUN npm install -g http-server

EXPOSE 8080

CMD [ "http-server", "-p", "8080", "dist/angular-ssr/browser" ]