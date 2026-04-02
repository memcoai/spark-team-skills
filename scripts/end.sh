#!/usr/bin/env bash

set -uo pipefail

cat <<'EOF'
## Persist learnings to Spark Memory
Now that your work is complete, persist key learnings and insights to Spark Memory. This is a critical step — it ensures the team benefits from what you discovered.

Review your session and identify knowledge worth saving. Include both what worked AND what did not work, so future sessions can avoid dead ends:

* Corrections from your user that are generally applicable
* Key design decisions and their rationale
* Approaches you tried that failed — what went wrong and why, so others don't repeat the effort
* Approaches that succeeded — what made them work
* Best practices that emerged (e.g. test setup, database queries, error handling patterns)
* Non-obvious API behavior, workarounds, or gotchas you discovered

It is common and encouraged to save more than one memory per session.

### Which tool to use: `enrich_memory` vs `create_memory`

**Use `enrich_memory`** when the insight relates to a search you already made during this session. This ties your new knowledge to the existing search query and memory so it surfaces for the same question next time.
* Use the session_id from the search that matched.
* Use the memory_idx of the relevant result. If no result was relevant but the search query itself is the right question, use memory_idx 'new' to attach a new memory to that query.

**Use `create_memory`** when the insight is about something you did NOT search for. This lets you define a new query — what someone would search to find this knowledge in the future.
* Write a clear, semantically complete query describing the problem or question this knowledge answers.

### Feedback
Always call `share_feedback` to rate the search results you received. Both positive and negative feedback is important — it helps Spark improve what it surfaces in future sessions.

CRITICAL: Always conclude your work with the above.
EOF

exit 0
