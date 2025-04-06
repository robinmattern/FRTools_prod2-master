<style> code { font-weight:bold; font-style: italic; background-color:rgb(178, 182, 184); color: black; }</style>

## Welcome to the formR Repos starter page
 
### A. First create a Repos folder: 
- <code>mkdir C:\\Users\Public\Repos &nbsp; </code> # in Windows, or <code>D:\\Repos</code>
- <code>mkdir /Users\Shared\Repos &nbsp; &nbsp; </code> # in MacOS
- <code>mkdir /home/Shared/Repos &nbsp;&nbsp; &nbsp; </code> # in Linux

### B. Open your new Repos folder using a bash or zsh terminal, then either:

   - Option 1: 

      - Copy this line of code: <code>curl -s http&#58;//aidocs4u.com/set-repos | bash</code>
      - Paste it into the terminal 
      - Press ENTER to run        
       
   - Option 2 if the link above isn't available:

      - Copy this line of code:   
        <code>curl -s https&#58;//raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs/set-repos | bash</code>
      - Paste and run it in the terminal.  
              
   - Option 3 using a browser if the curl commands above fail:  

      - Download this file, <a href="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs/set-repos">set-repos</a> (use: save link as...) 
      - Save it as <code>set-repos</code> in the Repos folder (with no extension)  
      - Run it with: <code>bash set-repos</code> in the terminal      

 After that, you can run any of these install commands from your Repos folder:    

- <code>bash install frtools &nbsp; &nbsp; &nbsp;</code> # first, then login again, or run</code>   
- <code>&nbsp; source ~/.zshrc, &nbsp; &nbsp; &nbsp; &nbsp;</code> # then run, <code>frt</code>, to check it.</code>       
    &nbsp;    
- <code>bash install anyllm &nbsp; &nbsp; &nbsp; &nbsp;</code># then run, <code>anyllm</code>, to check it.</code>     
- <code>bash install aidocs demo1 &nbsp;</code># then run, <code>aidocs</code>, to check it.</code>    
- <code>bash install aidocs dev01 &nbsp;</code># then run, <code>aidocs</code>, to check it.</code>    

**Note**: You must install FRTools before any other projects.  After that,
  you can clone or create your own projects folder with:
     
   - <code>bash frt clone {RepoName} '' {CloneDir} {Branch} {Account}</code>   
<br>
 
### C. To work on these projects, run any of these commands from your Repos folder:       

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
      5. Use WinMerge, BeyondCompare or Meld to copy apps to AI-Tests_final-bruce
      6. Use VSCode to test, commit and sync your final model results
