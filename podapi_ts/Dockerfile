FROM node:10

WORKDIR /podapi/app
# Only copy the package.json file to work directory
COPY . .
# Install all Packages
RUN npm install

RUN npm install --save bcrypt-nodejs

RUN npm uninstall --save bcrypt

RUN npm install pm2 -g

RUN npm install typescript -g

RUN tsc

# Copy all other source code to work directory


# Start
CMD ["pm2-runtime","./dist/Server.js"]
EXPOSE 5000
