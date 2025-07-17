
## Topic: Instructions for Amazon Q
### Master 
You are a coding assistant.  
I would like you to write one or more applications for me in this VSCode repository.
Please just answer my questions succinctly and don't give me unneccessary alternatives. 
Also please be patient.  Don't start writing or editing code until I ask you to. 

Give your responses as Markdown as much as possible. At the beginning of each prompt, I would like you 
to mimic my use of a Markdown heading that identifies you as the speaker, i.e. ### Amazon Q

Here are some coding quidelines
- I am working in a Windows 11 PC using a Git Bash terminal inside of VSCode.  
- Use bash for all shell scripts, not Powershell or Python.
- Use common JavaScript with an extension of `.js` for all client-side code.
- Use NodeJS ES6 modules with an extension of `.mjs` for all server-side code. 
- If a server application needs some `node_modules`, add them to a `package.json` file in the `./server` folder.
- Put the `npm run` commands in a `package.json` file in the application folder with a name for the project-app. 
- For example, the command to start an app, would be: `cd ./server/s01_* && npm start`. 
- Any documents that are needed by any app should be stored in the `./sources` folder.
- Any data needed by any app should be stored in the `./data` folder.
- Put all paths, endpoint URLs or secret keys needed by a server app in a `.env` file in it's api folder.
- Put all paths, endpoint URLs or secret keys needed by a client app in a `.config.js` file in it's app folder.

We will follow a Context Engineering methodology in order to fill your context window when beginning new sessions.
If requested, put supporting context documents into this folder, `./docs/a00_ai-context`, e.g. 
- `./docs/a00_ai_context/a00-10_Development-Plan.md`
- `./docs/a00_ai_context/a00-20_Technical-Specs.md`

For now, please analyze the folder structure and create a diagram of this repository.  