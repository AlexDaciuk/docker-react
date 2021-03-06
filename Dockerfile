FROM node:alpine
WORKDIR /srv/app
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build 

#################################

FROM nginx:latest 
EXPOSE 80
COPY --from=0 /srv/app/build /usr/share/nginx/html



