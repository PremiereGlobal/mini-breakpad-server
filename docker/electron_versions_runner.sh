#!/bin/bash
mkdir -p symbols && cd symbols
while IFS=" " read version directory; do
  curl -L -o darwin.x64.zip "https://github.com/electron/electron/releases/download/v$version/electron-v$version-darwin-x64-symbols.zip" && unzip darwin.x64.zip && rsync -a "$directory"/ ../../pool/symbols && rm -rf ./*
  curl -L -o win32.zip "https://github.com/electron/electron/releases/download/v$version/electron-v$version-win32-ia32-symbols.zip" && unzip win32.zip && rsync -a "$directory"/ ../../pool/symbols && rm -rf ./*
done < ../electron_versions.txt

