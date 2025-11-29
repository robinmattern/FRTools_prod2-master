---
description: This rule defines how to handle and display topic headers in conversations
alwaysApply: true
---

When user writes '## Topic:', display it and the text that follows it as a markdown heading in the VERY NEXT response, followed by '### {{modelName}}'. The topic heading should appear exactly once and not be repeated until a new topic is provided. Format:

## Topic: [User's Topic]
### {{modelName}}
[Response content]