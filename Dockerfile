# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g @vue/cli
COPY . .
RUN npm run build

# development stage
FROM node:lts-alpine as development-stage
WORKDIR /app
COPY --from=build-stage /app /app
EXPOSE 8080
CMD ["npm", "run", "serve"]
