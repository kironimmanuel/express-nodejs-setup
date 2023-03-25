#!/bin/bash

# Download and install Node.js.
mkdir ~/Downloads/nodejs
cd ~/Downloads/nodejs
curl -o node.msi https://nodejs.org/dist/v14.16.0/node-v14.16.0-x64.msi
msiexec /i node.msi /quiet
cd ..
rm -r nodejs