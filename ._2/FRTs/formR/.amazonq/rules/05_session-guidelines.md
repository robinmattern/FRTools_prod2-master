# Claude Rules

## Topic Header Display
- Type: Always
- Created: 2025-07-30
- Last Modified: 2025-07-30

### Rule Definition
When user writes '## Topic: whatever', display it as a markdown heading at the top of the very next response only. Each topic heading is used exactly once and not repeated until a new topic is provided.

### Description
This rule should be applied whenever a user starts a message with '## Topic:' to ensure consistent topic header formatting across all conversations.

## Session Documentation Management
- Type: Always
- Created: 2025-07-30
- Last Modified: 2025-07-30

### Rule Definition
For session markdown documentation:
1. When user requests to "save session", "export session", or similar:
   - Prompt user for:
     * Username (if not already provided)
     * Title for the session (brief descriptive text)
   - Save current conversation state to 'docs/sessions/fr[YMMDD].[nn]-[type]_[title].md'
   - [YMMDD] = Year (single digit) + Month + Day (e.g., 50730 for July 30, 2025)
   - [nn] = Two-digit session number with leading zero (01, 02, etc.)
   - [type] = 'chat' or 'agent' based on session type
   - [title] = User-provided descriptive text (spaces replaced with hyphens)
   Example: 'fr50730.01-agent_rule-testing.md'
   
2. Format content as:
   ```markdown
   # AI Assistant Session fr[YMMDD].[nn]-[type]_[title]
   
   ## Session Information
   - Date: [Current Date/Time]
   - Type: [Chat/Agent]
   - Topic: [Current Topic]
   - Username: [User-provided name]
   
   ## Conversation
   [Full conversation with proper headers and formatting using provided Username]
   
   ## Session Summary
   - Start Time: [Session Start]
   - End Time: [Session End]
   - Key Topics Covered: [List]
   - Tools Used: [List if Agent session]
   ```
3. Cross-reference between chat/agent sessions if they are related using:
   - See also: [Related session filename]

### Description
This rule defines when and how to save session documentation, including handling both chat and agent sessions, with specific filename format fr[YMMDD].[nn]-[type]_[title].md and custom username support

## Session Save Command
- Type: Always
- Created: 2025-07-30
- Last Modified: 2025-07-30

### Rule Definition
When user types any of these commands:
1. '/save-session'
2. '/export-session'
3. '/save'
Respond by:
1. Prompting for required variables:
   - "Please provide your preferred username (default is 'Human'):"
   - "Please provide a brief title for this session:"
2. Then execute the Session Documentation Management rule with provided values

### Description
This rule defines the commands that trigger session saving and how to collect required information from the user.

## Git Bash Environment Standards
- Type: Always
- Created: 2025-07-30
- Last Modified: 2025-07-30

### Rule Definition
When working with files and commands:
1. Use Git Bash compatible commands (Unix-style)
2. Always use forward slashes (/) in paths, never backslashes
3. For paths that might contain spaces, use appropriate quotes or escaping
4. Use Git Bash compatible commands for:
   - Directory operations: ls, cd, pwd, mkdir
   - File operations: touch, rm, mv, cp
   - Text operations: cat, grep, echo
   - Git operations: git commands work natively
5. For Windows-specific operations that require cmd.exe, explicitly note it
6. Use proper line endings (LF) in scripts

### Description
This rule ensures all commands and file paths are compatible with Git Bash on Windows, using Unix-style commands and forward slashes in paths.

## Rules Storage Format
- Type: Always
- Created: 2025-07-30
- Last Modified: 2025-07-30

### Rule Definition
For managing rules:
1. Store all rules in a single file: 'docs/rules/rules.md'
2. Format each rule as:
   ```markdown
   ## [Rule Name]
   - Type: [Always/Auto/Agent/Manual]
   - Created: [Date]
   - Last Modified: [Date]
   
   ### Rule Definition
   [Rule content]
   
   ### Description
   [Rule description]
   ```
3. Additional individual rule files are treated as deprecated
4. When duplicate rules exist, the version in rules.md takes precedence

### Description
This rule establishes that all rules should be consolidated in a single rules.md file for better maintenance and clarity, with a specific format for each rule entry.