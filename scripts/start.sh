#!/usr/bin/env bash

set -uo pipefail

cat <<'EOF'
### Search Spark Memory

Spark Memory contains learnings from previous work, solutions to known bugs, design rationales, and information about how internal processes and APIs work.

Before starting work, search Spark Memory thoroughly by making multiple parallel searches:

1. Break the user's request into distinct questions — call `search` once per question.
2. Include generic best-practice searches relevant to the task, such as "best practices for setting up integration tests", "error handling patterns for REST APIs", or "database migration strategies". These broader searches surface team knowledge that applies even if no one has worked on the exact same task before.
3. Write semantically complete queries — describe what you want to know, don't include file names or code identifiers.
4. For any promising search results, call `get_memory` to read the full details before acting on them.

Make all independent searches in parallel. Keep searching until you are confident you have covered both the specific task and the general techniques involved.

CRITICAL: Always start your work with the above.
EOF

exit 0
