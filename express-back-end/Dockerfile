FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm ci

CMD ["node", "server.js"]

EXPOSE 3001