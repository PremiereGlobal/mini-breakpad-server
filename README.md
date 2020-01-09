# mini-breakpad-server

Minimum collecting server for crash reports sent by
[google-breakpad](https://code.google.com/p/google-breakpad/).


## Features

* No requirement for setting up databases or web servers.
* Collecting crash reports with minidump files.
* Simple web interface for viewing translated crash reports.

## Run

* `npm install .`
* `grunt`
* Put your breakpad symbols under `pool/symbols/`
* `node lib/app.js`

## Building with Docker
```
docker build -t premiereglobal/mini-breakpad-server:dev .
```

## Maintaining Symbol Files

The mini-breakpad-server supports having multiple symbol files in the symbols directory for different electron versions. Use `electron_versions.txt` to list the versions and the name of the symbols directory that we want to extract into the app/pool/symbols directory.

To add new versions, simply add a new line with the version and name of symbols directory separated by a space.
