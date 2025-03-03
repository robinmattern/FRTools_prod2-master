## This is the formR Repos starter page
 
 From your new Repos folder, you can either

  - Option 1 in a browser:  

      1. Download this file, <a href="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs/set-repos">set-repos</a> (use: save link as...) 
      2. Save it as <code>set-repos</code> in a Repos folder (with no extension)  
      3. Run it with: <code>bash set-repos</code>      

  - Option 2 in a bash terminal: 

      - Copy this line of code: <code>curl -s http&#58;//aidocs4u.com/set-repos | bash</code>
      - Paste and run it in a terminal.  
       
  - Option 3 if the above link isn't available:

      - Copy this line of code: <code>curl -s https&#58;//raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs/set-repos | bash</code>
      - Paste and run it in a terminal.  
              
 After that, you can run any of these install commands from your Repos folder: 

  - <code>bash install frtools # first</code>
  - <code>bash install anyllm</code>
  - <code>bash install aidocs</code>
  
 To work on these projects, run any of these commands from your Repos folder:
   - Your own project  (use -d to doit)  

      1. <code>frt new repo MyProject_dev01 -d</code>   
      2. <code>cd MyProject_dev01; code MyProject_dev01.*</code>   
      3. <code>gitr add remote MyProject_dev01-bruce {GitHub_Account}</code>   
      4. <code>gitr mak remote MyProject_dev01-bruce</code>   
      5. Make changes to your code   
      6. Use VSCode to commit and sync your changes   
 

  - The AI Model Test project  (use -d to doit)

      1. <code>bash install aicoder</code>
      2. <code>gitr clone AI-Tests_dev01-robin</code>   
      3. <code>gitr clone AI-Tests_dev01-robin  '' dev01-bruce -d</code>   
      4. <code>cd AI-Tests_dev01-bruce; code Ai-Tests_dev01-bruce.*</code>   
      5. <code>gitr add remote AI-Tests_dev01-robin {GitHub_Account}</code>   
      6. <code>gitr mak remote AI-Tests_dev01-bruce</code>   
      7. <code>aic list models</code>   
      8. <code>ai2code save markdown {ANo} claude.md [{model}]</code>   
      9. <code>aic list scripts {ANo} [{model}]</code>   
     10. <code>aic save scripts {ANo} [{model}]</code>   
     11. Use VSCode to commit and sync you changes   


  - For your AI Model Final project  (use -d to doit)
      
      1. <code>gitr clone AI-Tests_dev01-robin '' final-bruce</code>
      2. <code>cd AI-Tests_dev01-bruce; code AI-Tests_dev01-bruce.*</code>
      3. <code>gitr add remote AI-Tests_final-bruce {GitHub_Account}</code>
      4. <code>gitr mak remote AI-Tests_final-bruce</code>
      5. Use BeyondCompare or WinMerge to copy apps to AI-Tests_final-bruce
      6. Use VSCode to test, commit and sync your final model results