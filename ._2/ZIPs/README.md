<!-- <script>document.redirect "http://92.112.184.206/set-repos.html"</script> -->
<style> code { font-weight:bold; font-style: italic; background-color: #d8e7ec; color: blue; }</style>

## Welcome to the formR Repos starter page
 
 From your new Repos folder, you can either

  - Option 1 in a browser  

      1. Download this file, <a href="http://92.112.184.206/set-repos">set-repos</a>  
      2. Save it as <code>set-repos</code> in a Repos folder   
      3. Run it with: <code>bash set-repos</code>      

  - Option 2 in a bash terminal  

      - Run it with: <code>curl -s http&#58;//92.112.184.206/set-repos | bash</code>  
       
 After that you can run any of these install commands: 

  - <code>bash install frtools # first</code>
  - <code>bash install aicoder</code>
  - <code>bash install anyllm</code>
  - <code>bash install aidocs</code>
  
 To work on these projects run any of these commands:
   - Your own project   

      1. <code>frt new repo MyProject_dev01 -d</code>   
      2. <code>cd MyProject_dev01; code MyProject_dev01.*</code>   
      3. <code>gitr add remote MyProject_dev01-bruce {GitHub_Account} -d</code>   
      4. <code>gitr mak remote MyProject_dev01-bruce -d</code>   
      5. Make changes to your code   
      6. Use VSCode to commit and sync you changes   
 
  - The AI Model Test project

      1. <code>gitr clone AI-Tests_dev01-robin -d</code>   
      2. <code>gitr clone AI-Tests_dev01-robin  '' dev01-bruce -d</code>   
      3. <code>cd AI-Tests_dev01-bruce; code Ai-Tests_dev01-bruce.*</code>   
      4. <code>gitr add remote AI-Tests_dev01-robin brucetroutman-gmail -d</code>   
      5. <code>gitr mak remote MyProject_dev01-bruce -d</code>   
      6. <code>bash makApps.sh # requires path to markdown files</code>   
      7. <code>./savMarkdown.sh c51 claude.md</code>   
      8. <code>aic list models</code>   
      9. <code>aic list scripts c51 c35sanm</code>   
     10. <code>aic list scripts c51 c35sanm</code>   
     11. Use VSCode to commit and sync you changes   
