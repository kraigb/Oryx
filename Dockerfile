FROM node:10.13-alpine
WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --silent
COPY . .

EXPOSE 3000
RUN npm run build
CMD npm run populatemongodb && npm start