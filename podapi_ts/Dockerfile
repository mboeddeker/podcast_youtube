FROM node:13.3.0-alpine

WORKDIR /podapi/app

# Only copy the package.json file to work directory
COPY package.json .
# Install all Packages
RUN npm install

# Copy all other source code to work directory
ADD . /podapi/app
# TypeScript
RUN ./node_modules/.bin/tsc

# Start
CMD [ "node", "dist/Server.js" ]
EXPOSE 5000