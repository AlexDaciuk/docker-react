FROM node:alpine AS builder 
WORKDIR /srv/app
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build 

#################################

FROM nginx:latest 
EXPOSE 80
COPY --from=builder /srv/app/build /usr/share/nginx/html



