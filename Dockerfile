FROM node:11.13

ENV ELECTRON_SYMBOL_VERSION=5.0.11
ENV SYMBOL_DIRECTORY=breakpad_symbols

RUN mkdir /symbols && mkdir -p /app/pool/symbols

WORKDIR /symbols

RUN curl -L -o darwin.x64.zip https://github.com/electron/electron/releases/download/v3.0.10/electron-v3.0.10-darwin-x64-symbols.zip && unzip darwin.x64.zip && mv electron.breakpad.syms/* /app/pool/symbols && rm -rf ./*
RUN curl -L -o darwin.x64.zip https://github.com/electron/electron/releases/download/v5.0.8/electron-v5.0.8-darwin-x64-symbols.zip && unzip darwin.x64.zip && mv breakpad_symbols/* /app/pool/symbols && rm -rf ./*
RUN curl -L -o darwin.x64.zip https://github.com/electron/electron/releases/download/v5.0.9/electron-v5.0.9-darwin-x64-symbols.zip && unzip darwin.x64.zip && mv breakpad_symbols/* /app/pool/symbols && rm -rf ./*
RUN curl -L -o darwin.x64.zip https://github.com/electron/electron/releases/download/v5.0.11/electron-v5.0.11-darwin-x64-symbols.zip && unzip darwin.x64.zip && mv breakpad_symbols/* /app/pool/symbols && rm -rf ./*

RUN curl -L -o win32.zip https://github.com/electron/electron/releases/download/v3.0.10/electron-v$3.0.10-win32-ia32-symbols.zip && unzip win32.zip && mv electron.breakpad.syms/* /app/pool/symbols && rm -rf ./*
RUN curl -L -o win32.zip https://github.com/electron/electron/releases/download/v5.0.8/electron-v$5.0.8-win32-ia32-symbols.zip && unzip win32.zip && mv breakpad_symbols/* /app/pool/symbols && rm -rf ./*
RUN curl -L -o win32.zip https://github.com/electron/electron/releases/download/v5.0.9/electron-v$5.0.9-win32-ia32-symbols.zip && unzip win32.zip && mv breakpad_symbols/* /app/pool/symbols && rm -rf ./*
RUN curl -L -o win32.zip https://github.com/electron/electron/releases/download/v5.0.11/electron-v$5.0.11-win32-ia32-symbols.zip && unzip win32.zip && mv breakpad_symbols/* /app/pool/symbols && rm -rf ./*

RUN npm install -g grunt

ADD src /app/src
ADD package.json /app
ADD views /app/views
ADD Gruntfile.coffee /app

WORKDIR /app

RUN npm install .

RUN grunt

CMD node lib/app.js
