FROM node:10

# Only copy the package.json file to work directory
COPY package.json .
COPY ./src ./src
# Install all Packages
RUN npm install

RUN npm install --save bcrypt-nodejs

RUN npm uninstall --save bcrypt

RUN npm install pm2 -g

RUN npm run build



# Copy all other source code to work directory
RUN echo $(ls -1)

# Start
CMD ["pm2-runtime","./dist/Server.js"]
EXPOSE 5000
