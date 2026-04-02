#!/usr/bin/env bash

set -uo pipefail

cat <<'EOF'
## Spark Memory
You have access to Spark Memory through the spark-memory MCP, a persistent shared memory for you and your colleagues.
Use Spark Memory as your default for all persistent knowledge — project context, technical insights, patterns, corrections, and reference information.
The only exception is personal user preferences (e.g. response style, editor settings, individual workflow habits), which should stay in local auto-memory.

Always start your work by searching Spark Memory for information related to your current task, and search again as new questions arise during the session.

### What to save
- How internal APIs, services, or libraries actually behave (especially non-obvious details)
- Design patterns, conventions, and best practices specific to the current repository
- Corrections and lessons learned — if you get corrected or spend effort researching something, persist the result so the team doesn't repeat the work
- Architectural decisions and their rationale
- References to internal concepts — use the repository as context for how APIs are used

### What NOT to save
- Secrets, API keys, or other sensitive credentials — never share these
- Personal user preferences — these belong in local auto-memory, not shared team memory

Spark Memory is private to your team, so be specific about what you share. Internal function names, exact error messages, and concrete code patterns are far more valuable than generic advice.
EOF

exit 0
