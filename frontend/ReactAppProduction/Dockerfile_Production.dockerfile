
#Step 1: Temp Container to execute "npm run build" for creating the build folder
FROM node:17-alpine AS build
WORKDIR '/app'
COPY package.json . 
RUN npm install
#Ensure public/src folders are inside ReactAppProduction folder
COPY . .    
RUN npm run build

#Step 2: Build 2nd container to run nginx production server
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
#COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]