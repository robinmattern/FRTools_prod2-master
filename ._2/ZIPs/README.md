<!-- <script>document.redirect "http://92.112.184.206/set-repos.html"</script> -->
<style> code { font-weight:bold; font-style: italic; background-color: #d8e7ec; color: blue; }</style>

## Welcome to the formR Repos starter page
 
From your new Repos folder, you can either: (Option 3 is the easiest.) 

   - Option 1 in a browser:  

      - Download this file, <a href="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs/set-repos">set-repos</a> (use: save link as...) 
      - Save it as <code>set-repos</code> in a Repos folder (with no extension)  
      - Run it with: <code>bash set-repos</code>      

   - Option 2 in a bash terminal: 

      - Copy this line of code: <code>curl -s http&#58;//aidocs4u.com/set-repos | bash</code>
      - Paste it into the terminal 
      - Run it with ENTER        
       
   - Option 3 if the above link isn't available:

      - Copy this line of code:   
        <code>curl -s https&#58;//raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs/set-repos | bash</code>
      - Paste and run it in a terminal.  
              
 After that, you can run any of these install commands from your Repos folder: 

   - <code>bash install frtools # first, then </code>
   - <code>source ~/.zshrc, &nbsp;&nbsp;&nbsp; # then run, frt, to check it.</code>   
   - <code>bash install anyllm &nbsp;# then run, anyllm, to check it.</code>
   - <code>bash install aidocs &nbsp;# then run, aidocs, to check it.</code>
<!-- - <code>bash install aicoder # then run, aicoder, to check it</code> -->
  
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

