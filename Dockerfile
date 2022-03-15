FROM node:16-alpine as builder
WORKDIR '/data/frontend'
COPY --chown=node:node package.json .
RUN npm install
COPY . .
RUN npm run build .

FROM nginx
COPY --from=builder /data/frontend/build /usr/share/nginx/html
