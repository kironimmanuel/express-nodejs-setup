#!/bin/bash

if [ -d "$PROGRAMFILES/nodejs" ]; then
  echo "Node.js is already installed."
else
  echo "Installing Node.js..."
  ./install_nodejs.sh
fi

echo "Installing Node.js packages..."
npm install --global nodemon
npm install --global eslint
npm install --global prettier

base_dir="$HOME/projects"
project_name="new_express_project"
project_dir="$base_dir/$project_name"

if [ ! -d "$project_dir" ]; then
  echo "Creating project directory..."
  mkdir "$project_dir"
else
  echo "Project directory already exists. Creating new directory with number appended to the name..."
  count=1
  while true; do
    new_dir="$base_dir/$project_name ($count)"
    if [ ! -d "$new_dir" ]; then
      project_dir="$new_dir"
      mkdir "$project_dir"
      break
    else
      count=$((count+1))
    fi
  done
fi

echo "Project directory created at $project_dir"
cd "$project_dir"

echo "Initializing Node.js project..."
npm init --yes

echo "Installing project dependencies..."
npm install --save express
npm install --save-dev eslint eslint-config-airbnb-base eslint-plugin-import prettier eslint-config-prettier eslint-plugin-prettier

echo "Creating ESLint and Prettier configuration files..."
echo '{ "extends": "airbnb-base", "rules": {} }' > .eslintrc.json
echo '{ "singleQuote": true, "semi": false }' > .prettierrc.json

echo "Creating sample Node.js file..."
cat > index.js << EOF
const express = require('express');
const app = express();
app.get('/', function(req, res) { res.send('Hello, world'); });
function onListen() {
  console.log('Server listening on port 3000...');
}
app.listen(3000, onListen);
EOF

echo "Starting development server..."
nodemon index.js
