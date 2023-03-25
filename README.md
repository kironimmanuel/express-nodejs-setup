# Express Nodejs Quick Setup

This is a script that automates the process of creating a new Express.js project, installing necessary packages, and setting up configuration files. The script also starts a development server using nodemon for the created project.

### Usage

1. Download or clone this repository to your local machine.

2. Open a terminal or command prompt and navigate to the directory where the script is located.

3. Run the script using the following command: `./setup.bat`
   \*Note that need to make the shell script executable before you can run it. To do this, you can run the command `chmod +x setup.sh`

\*The script will check if Node.js is installed, install it if necessary, and then proceed to create a new Node.js project.

Following packages will be installed:

```sh
"express"
"eslint"
"prettier"
"eslint-config-airbnb-base"
"eslint-plugin-import"
"eslint-config-prettier"
"eslint-plugin-prettier"
```

Following config files will be generated:
`.eslintrc.json`
`.prettierrc.json`
The content of these files is set by default to work with the installed packages.

Finally the development server will start using `nodemon`
