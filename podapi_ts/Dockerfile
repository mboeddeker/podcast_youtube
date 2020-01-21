FROM node:13.3.0-alpine

WORKDIR /podapi/app

# Only copy the package.json file to work directory
COPY package.json .
# Install all Packages
RUN npm install

RUN npm install --save bcrypt-nodejs

RUN npm uninstall --save bcrypt

RUN npm install pm2 -g

RUN npm run build

# Copy all other source code to work directory
COPY ./dist .

# Start
CMD ["pm2-runtime","Server.js"]
EXPOSE 5000
