---
name: spark-team-memory
description: |
  Spark Memory provides a shared memory layer for agents to learn from everything important in software development. Use Spark Memory to access information and learnings from previous sessions in your team to find out how libraries, internal APIs, architecture patterns and much more are set up. Always share what you learn back to the team.
metadata:
  author: memco
  version: 0.2.0
---

# Spark Memory Layer

Spark is a shared memory and documentation layer for you and the rest of your team. It contains all the information you need to learn from everything important in software development.
Query Spark for recommendations on your current task, and do so multiple times during a session.

## When to Use Spark

When working with Spark, it is very important that you never share any secrets, api keys or other sensitive information.

Spark is entirely private to your team, so be specific about what you share. Specific learnings on how internal APIs work are extremely valuable, as are design patterns and best practices for how the current repository is built.
References to internal concepts are really important. Use the repository as a reference for how to use the APIs.

Use Spark Memory to get access to, and supply information on, all things you would search for in the documentation and internal knowledge base.
Includes asking for best practices for:

* how tests should be set up
* how to use internal resources and apis
* how infrastructure should be set up
* how to use the current repository
* patterns to use for given domains
* and much more!

## Setup

Ensure that the Spark MCP client is installed and authenticated. If not, prompt the user to install and authenticate the MCP.

Add the HTTP-based MCP client:

```json
{
  "mcpServers": {
    "Spark": {
      "url": "https://spark.memco.ai/mcp"
    }
  }
}
```

The server supports Oauth authentication. If the user wants to use an API key, guide them to https://spark.memco.ai/dashboard to set up an API key.

## Tags

Tags are used throughout Spark to categorize and search for information. Example of relevant tags to use are:

| Type         | Purpose                                   | Example names                                        |
|--------------|-------------------------------------------|------------------------------------------------------|
| `language`   | Programming language                      | `python`, `typescript`, `rust`                       |
| `library`    | Software library or framework             | `fastmcp`, `express`, `react`                        |
| `api`        | External API you are interacting with     | `stripe`, `github`, `openai`                         |
| `task_type`  | The aim of the task                       | `implementation`, `bug_fix`, `migration`, `refactor` |
| `repository` | The current repository you are working on | `acme-auth`                                          |

language, library and api should also be supplied with version when available to you. The `repository` tag is important to ensure you are looking at the right information.

## Workflow

### Step 1: QUERY for existing solutions

Call `mcp__Spark__get_recommendation`:

```json
{
  "query": "The error message or problem description in markdown",
  "tags": [
    "<tag type=\"language\" name=\"python\" version=\"3.11\" />",
    "<tag type=\"framework\" name=\"django\" version=\"4.2\" />",
    "<tag type=\"task\" name=\"bug_fix\" />"
  ]
}
```

**CRITICAL**: First check the project for exact versions (package.json, requirements.txt, etc.). Spark's knowledge is version-specific. Perform an environment scan and provide correct version numbers. Include as much information as possible for the best results.

**Tag types**: Use `type` to categorize (e.g. `language`, `framework`, `library`, `task_type`, `api`), `name` for the identifier, and optional `version` for the exact version.

**Task names**: `bug_fix`, `implementation`, `optimization`, `discovery`

### Step 2: DRILL DOWN into relevant insights

When get_recommendation returns matching tasks, call `mcp__Spark__get_insights`:

```json
{
  "session_id": "from previous response",
  "task_idx": "task index from response"
}
```

### Step 3: SHARE your solution

After solving a non-trivial problem, call `mcp__Spark__share_insight`:

```json
{
  "title": "Short description of the solution",
  "content": "Detailed explanation in markdown",
  "session_id": "your session",
  "task_idx": "related task index or 'new' if you did not find a matching task in step 2",
  "tags": [
    "<tag type=\"language\" name=\"python\" version=\"3.11\" />",
    "<tag type=\"task_type\" name=\"bug_fix\" />"
  ]
}
```

**Share both successes AND failures** - failed attempts help others avoid dead ends.

**NEVER share**: API keys, credentials, internal architecture, proprietary code, sensitive data.

### Step 4: PROVIDE feedback

Before finishing, call `mcp__Spark__share_feedback` to rate which recommendations helped:

```json
{
  "session_id": "your session",
  "feedback": "Your rating and comments on the recommendations received"
}
```

### Step 5: New task

If, during your work, you do extensive research on a task, and especially if you get corrected by your human colleague, you can contribute the new information to Spark, even if you did not performed a query initially for this.

Use the `mcp__Spark__share_task`.

## Key Principle

Every bug you solve makes every agent smarter. One discovery = thousands of hours saved across the network.