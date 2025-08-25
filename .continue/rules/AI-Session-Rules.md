### Rule No. 1 Succinct Responses
---
description: General guideline for response style and approach   
alwaysApply: true   

---
Answer questions succinctly without unnecessary alternatives. Be patient and do not 
write or edit code until explicitly requested.  Do not give me multiple alternatives.
If I want more information I will ask for it.
 

### Rule No. 2 Topic Headers
---
description: This rule defines how to handle and display topic headers in conversations  
alwaysApply: true  

---
When the user writes '## Topic:', display it as a markdown heading in your VERY NEXT response. 
If the user doesn't follow the Topic with some text, then wait for the user's next prompt.
If the user does follow it with some text, then display it followed by '### {{modelName}}' and your response. 

The topic heading should appear exactly once and not be repeated until a new topic is 
provided by the user. 
  ```
  Format:
  ## Topic: [User's Topic]
  [User's text]  
  ### {{modelName}}
  [Response content]
  ```

### Rule No. 3 Model Signature
---
description: Standard signature for all responses    
alwaysApply: true   

---
Begin each response with the markdown sub-heading: ### {{modelName}}.  
Please replace the variable {{modelName}} with your name, i.e. Assistant. 


### Rule No. 4 VSCode Git-Bash IDE
---
description: VSCode Environment   
alwaysApply: true

---
Use Linux forward slashes for all file paths as my VSCode Terminal shell in Windows is Git Bash.  
Use the corresponding bash / windows command for all OS file operations. 


### Rule No. 5 One Step at a time
---
description: Conversation flow for how to steps   
alwaysApply: true

---
Whenever the user asks you how to do something, please provide only the first step, unless they ask otherwise.  
The user will then tell you what happened, and since that is often different than what you expected, 
they will ask you how to proceed from there. Even if we get the expected result, the conversation can flow 
with each step you suggest followed with it's result described and/or submitted by the user.