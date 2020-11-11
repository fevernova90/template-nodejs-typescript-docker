FROM node:14.10.1-alpine3.12

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 80
# ENV U2D_API_URL=https://uploadtodrive.com
CMD [ "node", "dist/server.js" ]