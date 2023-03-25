@echo off

if exist "%ProgramFiles%\nodejs" (
    echo Node.js is already installed.
) else (
    echo Installing Node.js...
    call install_nodejs.bat
)

echo Installing Node.js packages...
call npm install --global nodemon
call npm install --global eslint
call npm install --global prettier

@REM echo Creating project directory...
@REM call mkdir %USERPROFILE%\projects\new_nodejs_project
@REM call cd %USERPROFILE%\projects\new_nodejs_project

setlocal EnableDelayedExpansion

set "base_dir=%USERPROFILE%\projects"
set "project_name=new_express_project"
set "project_dir=%base_dir%\%project_name%"

if not exist "%project_dir%" (
  echo Creating project directory...
  call mkdir "%project_dir%"
) else (
  echo Project directory already exists. Creating new directory with number appended to the name...
  set "count=1"
  :loop
    set "new_dir=%base_dir%\%project_name% (!count!)"
  if not exist "!new_dir!" (
    set "project_dir=!new_dir!"
    call mkdir "!project_dir!"
    goto endloop
  ) else (
    set /a "count+=1"
    goto loop
  )
)

:endloop
echo Project directory created at %project_dir%
cd "%project_dir%"

echo Initializing Node.js project...
call npm init --yes

echo Installing project dependencies...
call npm install --save express
call npm install --save-dev eslint eslint-config-airbnb-base eslint-plugin-import prettier eslint-config-prettier eslint-plugin-prettier

echo Creating ESLint and Prettier configuration files...
echo { "extends": "airbnb-base", "rules": {} } > .eslintrc.json
echo { "singleQuote": true, "semi": false } > .prettierrc.json

echo Creating sample Node.js file...
echo const express = require('express'); > index.js
echo const app = express(); >> index.js
echo app.get('/', function(req, res) { res.send('Hello, world'); }); >> index.js
echo function onListen() { >> index.js
echo   console.log('Server listening on port 3000...'); >> index.js
echo } >> index.js
echo app.listen(3000, onListen); >> index.js

echo Starting development server...
call nodemon index.js