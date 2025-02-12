#Step 1: Temp Container to execute "npm run build" for creating the build folder
FROM node:17-alpine
WORKDIR '/app'
COPY package.json . 

RUN npm install
COPY . . 
RUN npm run build

EXPOSE 3000
EXPOSE 8080

CMD ["npm", "run", "start"]