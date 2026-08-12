# Meshpad guide

A meshpad is a portable collection of AI agent definitions, skills, steering rules, and hooks. It's how you define and distribute reusable agent configurations for mesh.

## Structure

```text
meshpad/
├── meshpad.toml          ← manifest (name, version, paths)
├── agents/
│   ├── orchestrator/
│   │   ├── agent.toml    ← agent config (backend, tools, trust, subagents)
│   │   └── prompt.md     ← system prompt
│   ├── coder/
│   │   ├── agent.toml
│   │   └── prompt.md
│   └── reviewer/
│       ├── agent.toml
│       └── prompt.md
├── skills/
│   ├── go-patterns.md    ← reusable knowledge injected into agents
│   └── security-review.md
├── steering/
│   ├── architecture.md   ← project-wide rules (injected via hooks)
│   └── conventions.md
├── hooks/
│   ├── git-context.sh    ← agentSpawn hook (injects git info)
│   └── guard-writes.sh   ← preToolUse hook (blocks writes to vendor/)
├── teams/
│   └── solo.toml         ← team config (extends, default_agent, overrides)
└── packs/
    └── dev.toml          ← pack (bundles agents + skills for a workflow)
```

## Manifest (meshpad.toml)

```toml
[meshpad]
name        = "my-pad"
version     = "1.0.0"
description = "My AI agent configuration"

[meshpad.mesh]
min_version = "0.1.0"
steermesh   = "steermesh.toml"    # companion manifest for backend refs

[meshpad.distribution]
type   = "git"
remote = "https://github.com/my-org/meshpad"
branch = "main"

[meshpad.paths]
agents   = "agents"
skills   = "skills"
steering = "steering"
hooks    = "hooks"
teams    = "teams"
```

## Agent definition (agents/<id>/agent.toml)

```toml
[agent]
id          = "coder"
description = "Expert software engineer"
prompt      = "prompt.md"              # relative to this agent's directory
backend     = "agent"                  # [[backend]].id in steermesh.toml
welcome     = "Coder ready."

[agent.tools]
enabled = ["read_file", "write_file", "run_shell", "list_dir", "delegate"]

[agent.tools.settings]
write_file = { blocked_paths = ["vendor/**", "*.generated.go"] }

[agent.trust]
level = "supervised"                   # "autonomous" | "supervised" | "strict"

[agent.skills]
use = ["go-patterns", "security-review"]

[agent.subagents]
can_delegate = ["reviewer"]            # which agents this one can call via delegate

[agent.context_budget]
identity  = 0.15
skills    = 0.10
resources = 0.10
steering  = 0.10
history   = 0.55

[[agent.hooks.agentSpawn]]
command     = "../../hooks/git-context.sh"
description = "Inject git branch and recent commits"

[[agent.hooks.preToolUse]]
matcher     = "write_file"
command     = "../../hooks/guard-writes.sh"
description = "Block writes to vendor/ and generated files"

[[agent.resources]]
path = "../../steering/architecture.md"
when = "always"
```

## Skills (skills/<id>.md)

Skills are markdown files injected into an agent's system prompt when `use = ["skill-id"]` is configured.

```markdown
---
id: go-patterns
description: Go coding patterns and idioms
tags: [go, patterns]
---

## Table-driven tests

Always use t.Run with subtests...
```

## Teams (teams/<id>.toml)

Teams define shared configurations with optional inheritance.

```toml
[team]
id            = "backend-team"
description   = "Backend engineering team"
extends       = "base"                 # inherits from teams/base.toml
pack          = "dev"
default_agent = "orchestrator"

[[team.projects]]
id   = "api-service"
path = "~/Workspace/api-service"

[team.overrides.coder]
skills  = ["go-patterns", "api-design"]
trust   = "autonomous"
```

## Hooks

### agentSpawn hooks

Run when an agent session starts. Output is injected into the system prompt.

```bash
#!/bin/bash
# hooks/git-context.sh
echo "## Git Context"
echo "Branch: $(git branch --show-current)"
echo "Recent commits:"
git log --oneline -5
```

### preToolUse hooks

Run before a tool executes. Non-zero exit = tool call blocked.

```bash
#!/bin/bash
# hooks/guard-writes.sh — blocks writes to vendor/
PATH_ARG="$1"
if echo "$PATH_ARG" | grep -q "^vendor/"; then
  echo "BLOCKED: cannot write to vendor/" >&2
  exit 1
fi
```

## Installation and distribution

```bash
# Add from a git repository (clones + validates)
mesh pad add https://github.com/SteerMesh/meshpad
mesh pad add git@github.com:org/pad.git --name team --ref v1.0.0

# Add a local directory
mesh pad add ~/Workspace/my-pad --name mypad

# Update to latest
mesh pad update
mesh pad update --ref latest

# Switch default pad (for when agent IDs overlap)
mesh pad installed                    # list all (* = default)
mesh pad switch team

# Scaffold new components
mesh pad new agent my-agent
mesh pad new skill my-skill
mesh pad new team my-team
```

## Resolution order

mesh finds the active meshpad by checking (first match wins):

1. `--pad /path` flag
2. `.meshpad/` in the current working directory
3. `MESHPAD_HOME` environment variable
4. `~/.meshpad` (symlink managed by `mesh pad switch`)

## Using agents

```bash
# Start an agent session
mesh chat --agent orchestrator
mesh chat --agent coder
mesh chat --agent claude-coder

# The orchestrator delegates to sub-agents via the delegate tool:
#   delegate(backend="coder", prompt="implement...", session="feature-x")
```

## Spawning CLI tools as agents

External CLI tools (Claude Code, Cursor, Codex) can be used as agents. They're defined as `[[acp_provider]]` in steermesh.toml and referenced by agents:

```toml
# In steermesh.toml:
[[acp_provider]]
id      = "claude-cli-provider"
command = "claude"
args    = ["-p", "--permission-mode", "auto", "--output-format", "text"]

# In meshpad agents/<id>/agent.toml:
[agent]
backend = "claude-code"   # type=claude-cli backend in steermesh.toml
```

The agent doesn't need mesh tools — the CLI tool brings its own (file access, shell, search). mesh spawns it as a subprocess and collects the output.
