FROM node:11.13

RUN apt-get -y clean && apt-get -y update && apt-get install -y rsync
RUN npm install -g grunt

RUN mkdir -p /app/pool/symbols

ADD src /app/src
ADD package.json /app
ADD views /app/views
ADD Gruntfile.coffee /app
ADD electron_versions_runner.sh /app
ADD electron_versions.txt /app

WORKDIR /app

RUN ./electron_versions_runner.sh

RUN npm install .

RUN grunt

CMD node lib/app.js
