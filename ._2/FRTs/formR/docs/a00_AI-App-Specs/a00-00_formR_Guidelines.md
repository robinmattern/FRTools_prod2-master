# formR Application Development Guidelines

## A. Introduction
A formR application is a web application that allows users to create and manage forms.

## B. formR Frameworks
App the allication code is written in JavaScript ES6 modules. The server side code is written in NodeJS and ExpressJS with code files having a .mjs extension. The client side code is written in HTML, CSS, and Javascript with code files having a .js extension. 

## C. formR directory Structure
The formR directory structure is as follows:
```
ProjectName_/stage-author
├── .vscode
├── .gitignore
├── client
|   ├── c01_first-app
|   |   ├── index.html
|   |   ├── index.css
|   |   ├── index.js
|   |   └── components
├── docs
|   └── a01_first-app
├── server
|   ├── s01_first-api
|   |   ├── server.mjs
|   |   └── components
|   ├── node_modules
|   └── package.json
├── README.md
```
## D. formR Modules and Components
 The client side components, if any, strictly use the Lit Web Components library retrieved from the lit.dev CDN. Do not 
 use React or JSX.  Structure the code for these separate components, services, and an index.html entry point in 
 one or more client app folders, e.g c01_first-app or c02_second-app located in the parent client folder. 

 For any services that require an API endpoint or key file, put that code in a server app folder, e.g. s01_first-api.
 Each API app should import it's own modules from a server.mjs entry point.  Put all third party modules (defined in
 package.json) in the parent server directory importable from the one or more server API apps and installed with NPM 
 install.  

## E. VSCode/Antigravity Git-Bash IDE
We are working in a Windows 11 PC or MacOS 14+ using a Git Bash terminal inside of VSCode.  
Use Linux forward slashes for all file paths. The VSCode terminal shell is Git Bash in both Windows and MacOS.  
Use the corresponding Git Bash command for all OS file operations and shell scripts. 
Specifically mkdir, mv and cp commands are the same in both envirnments, but don't use back-slashes.

## F. Coding Guidelines 
Here are some coding quidelines
- Put the `npm run` commands in a `package.json` file in the application folder with a name for the project-app. 
- For example, the command to start an app, would be: `cd ./server/s01_* && npm start`. 
- Any documents that are needed by any app should be stored in the `./data/sources` folder.
- Any data that is needed by any app should be stored in the `./data` folder.
- Put all paths, endpoint URLs or secret keys needed by a server app in a `.env` file in it's api folder.
- Put all paths, endpoint URLs or secret keys needed by a client app in a `.config.js` file in it's app folder.
- All node `console.log(`  ${aMsg}`)` and bash `echo "  ${aMsg}"` should have two leading spaces. 
