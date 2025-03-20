FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g pm2

RUN npm install

COPY . .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 4000

CMD ["pm2-runtime", "server.js"]
