
# General Guidlines
1. Follow the Coding Guidelines in this file: docs/a00_AI-App-Specs/a00-01_Coding-Guidelines.md

# Project Workspace Structure
1. Follow the formR Directory Structure in this file: docs/a00_AI-App-Specs/a00-00_formR_Guidelines.md

# Architect Protocol
Whenever I ask you to "create a plan" or reference a `Request.md` in `docs/plans/`:
1. **Act as the Project Architect**: Focus on system design before code.
2. **Output PLAN.md**:  You must identify the core goal and provide at appropriate implementation alternatives, if any with a final recommendation.
                        End with a description of each major task along with code samples. 
3. **Output TASKS.md**: Use H3 headers for major tasks with the task number and title.
                        Format each subtask with [ ] X.Y subtask number followed by its title"
4. **Context**: Do not suggest cloud-native services if the `Request.md` specifies local Git Bash execution.