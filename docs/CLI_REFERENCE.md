# CLI reference

Complete command reference for the `mesh` CLI.

## Global flags

| Flag | Description |
|------|-------------|
| `-v, --verbose` | Enable debug-level logging |
| `-q, --quiet` | Suppress all output except errors |
| `--version` | Print version and exit |

---

## Core commands

### `mesh init`

Scaffold a new `steermesh.toml` in the current directory.

```bash
mesh init
```

### `mesh validate [manifest]`

Validate a steermesh.toml without writing any files.

```bash
mesh validate
mesh validate path/to/custom.toml
```

### `mesh lint [manifest]`

Check steermesh.toml for common mistakes beyond schema validation: unset env vars, missing backend refs, empty rules, duplicate IDs.

```bash
mesh lint
mesh lint -m custom.toml
```

### `mesh compile [manifest]`

Compile steermesh.toml to target formats.

```bash
mesh compile                          # all configured targets
mesh compile --target kiro            # only kiro
mesh compile --target cursor          # only cursor
mesh compile --target coda            # only coda
mesh compile --target claude          # only claude
mesh compile --target ollama          # only ollama
mesh compile --target agentsmd        # only AGENTS.md
mesh compile --legacy-paths           # write directly to tool locations (skip .mesh/compiled/)
```

**Supported targets:** kiro, ollama, agentsmd, coda, cursor, claude

### `mesh place`

Place compiled artifacts where AI tools expect them (via symlink or copy).

```bash
mesh place                            # place all from lock.json
mesh place --target kiro              # place only kiro
mesh place --mode copy                # copy instead of symlink
mesh place --force                    # back up existing files to .bak
```

### `mesh clean`

Remove placed projections tracked in `.mesh/placed.json`.

```bash
mesh clean
```

### `mesh diff`

Preview what compile + place would change without writing.

```bash
mesh diff                             # diff all targets
mesh diff --target kiro               # diff only kiro
```

### `mesh watch`

Watch steermesh.toml for changes and recompile automatically.

```bash
mesh watch                            # recompile all targets on save
mesh watch --target kiro              # only recompile kiro
mesh watch --place                    # recompile + place on save
```

---

## Chat commands

### `mesh chat`

Start an interactive chat session.

```bash
mesh chat                             # pick backend interactively
mesh chat --backend agent             # agentic mode (supervised)
mesh chat --backend agent-auto        # agentic mode (autonomous)
mesh chat --backend openai            # simple chat (no tools)
mesh chat --backend brain             # orchestrator (routes to best)
mesh chat --agent orchestrator        # meshpad agent with delegation
mesh chat --agent claude-coder        # spawn Claude Code as agent
mesh chat --profile reviewer          # overlay a profile on the backend
mesh chat --team dev                  # apply a team config
mesh chat --pack dev                  # load a pack's default agent
mesh chat --no-mouse                  # disable mouse (terminal selection)
mesh chat --no-alt-screen             # preserve scrollback
```

### `mesh prompt <message>`

Send a single message and print the response (non-interactive).

```bash
mesh prompt "explain this error"
mesh prompt "what's in src/" --backend agent-readonly
```

### `mesh voice`

Start a voice-driven agentic session (local STT + TTS).

```bash
mesh voice                                  # defaults
mesh voice --backend agent --brain local    # custom backends
mesh voice --wake-word "hey mesh"           # always-on mode
mesh voice --tts-engine piper              # neural TTS
```

---

## Backend management

### `mesh backends`

List all backends and orchestrators defined in the manifest.

```bash
mesh backends
mesh backends -m custom.toml
```

### `mesh doctor`

Check all configured backends for reachability and auth.

```bash
mesh doctor                           # check only
mesh doctor --place                   # check + detect tools + compile + place
```

### `mesh ollama <subcommand>`

Manage local Ollama models.

```bash
mesh ollama ls                        # list installed models
mesh ollama ps                        # show models loaded in memory
mesh ollama pull llama3.2:3b          # download a model
mesh ollama rm llama3.2:3b            # remove a model
mesh ollama show llama3.2:3b          # show model details
mesh ollama sync                      # pull all models from manifest
mesh ollama prune                     # remove models not in manifest
```

### `mesh dashboard`

Interactive TUI dashboard — backend health, models, orchestrators.

```bash
mesh dashboard
```

---

## Agent management

### `mesh agents list`

List all agents defined in steermesh.toml.

```bash
mesh agents list
```

### `mesh agents show <id>`

Show details for a single agent.

```bash
mesh agents show claude-coder
```

### `mesh agents doctor`

Check that all ACP provider binaries are reachable.

```bash
mesh agents doctor
```

---

## Meshpad management

### `mesh pad status`

Show active meshpad, team, and agent/skill counts.

```bash
mesh pad status
```

### `mesh pad add <git-url-or-path>`

Add a meshpad from a git repo or local directory. Auto-detects whether the argument is a URL or a path.

```bash
# From a remote git repository
mesh pad add https://github.com/SteerMesh/meshpad
mesh pad add git@github.com:org/pad.git --name team
mesh pad add https://github.com/SteerMesh/meshpad --ref v1.0.0
mesh pad add https://github.com/SteerMesh/meshpad --ref latest

# From a local directory
mesh pad add ~/Workspace/my-meshpad --name mypad
mesh pad add . --name local
```

Validates the structure before registering (must have `meshpad.toml` or `agents/` directory).

### `mesh pad update [name]`

Pull latest changes for a registered meshpad.

```bash
mesh pad update                       # update active pad
mesh pad update steermesh             # update specific pad
mesh pad update --all                 # update all pads
mesh pad update --ref latest          # switch to latest release
mesh pad update --ref v2.0.0          # switch to specific tag
```

### `mesh pad switch <name>`

Switch the active meshpad (updates `~/.meshpad` symlink).

```bash
mesh pad switch team
```

### `mesh pad installed`

List all registered meshpads (* = active).

```bash
mesh pad installed
```

### `mesh pad remove <name>`

Unregister a meshpad.

```bash
mesh pad remove team
mesh pad remove team --delete         # also delete from disk
```

### `mesh pad list [agents|skills|packs|teams]`

List pad contents.

```bash
mesh pad list                         # all categories
mesh pad list agents                  # only agents
mesh pad list skills                  # only skills
```

### `mesh pad validate`

Lint all pad files and check backend refs against steermesh.toml.

```bash
mesh pad validate
```

### `mesh pad sync`

Pull latest changes from the pad's remote (simple git pull).

```bash
mesh pad sync
```

### `mesh pad use <team>`

Activate a team for the current project.

```bash
mesh pad use solo
```

### `mesh pad new <type> <id>`

Scaffold a new agent, skill, pack, or team.

```bash
mesh pad new agent my-agent
mesh pad new skill my-skill
mesh pad new pack my-pack
mesh pad new team my-team
```

---

## Memory management

### `mesh memory stats`

Show engram memory statistics.

```bash
mesh memory stats
```

### `mesh memory search <query>`

Search observations.

```bash
mesh memory search "auth pattern"
```

### `mesh memory prune`

Remove old auto-saved observations.

```bash
mesh memory prune --days 30           # soft-delete older than 30 days
mesh memory prune --days 90 --hard    # permanently delete
```

### `mesh memory decay`

Apply time-based relevance decay to boosted observations.

```bash
mesh memory decay                     # default: 0.95 factor
mesh memory decay --factor 0.9        # stronger decay
```

---

## Other commands

### `mesh serve`

Start a MCP stdio server exposing chat and prompt tools.

```bash
mesh serve
mesh serve --manifest custom.toml
```

### `mesh materialize`

Resolve MCP servers for an agent as JSON.

```bash
mesh materialize --agent claude-coder
```

### `mesh import steer-runtime <path>`

Import agents and steering from a steer-runtime source tree.

```bash
mesh import steer-runtime ~/path/to/steer-runtime
mesh import steer-runtime ~/path --write
mesh import steer-runtime ~/path --dry-run
```

---

## TUI keybindings (inside mesh chat)

| Key | Action |
|-----|--------|
| Enter | Send message (or allow permission) |
| Shift+Enter | Insert newline |
| Esc | Cancel streaming / dismiss autocomplete |
| Tab / Shift+Tab | Navigate autocomplete |
| Ctrl+C | Quit |
| Ctrl+L | Clear conversation |
| Ctrl+G | Toggle subagent monitor panel |
| Ctrl+D | Toggle delegation flow view |
| `y` | Allow tool permission |
| `a` | Allow all (same tool, this session) |
| `n` | Deny tool permission |

## Slash commands (inside mesh chat)

| Command | Description |
|---------|-------------|
| `/help` | List available commands |
| `/context` | Show context window token usage |
| `/clear` | Clear conversation |
| `/new` | Clear history and start fresh |
| `/exit`, `/quit` | Quit |
| `/remember <text>` | Save a note to memory |
| `/recall <query>` | Search memory |
| `/forget <id>` | Soft-delete a memory |
| `/tools` | List active tools and last usage |
| `/compact` | Collapse tool history to save context |
| `/metrics` | Session stats (duration, tokens, API calls) |
| `/model <name>` | Switch model mid-session |
| `/agent` | Open agent picker |
| `/switch` | Open backend picker |
| `/save <name>` | Save session snapshot |
| `/resume <name>` | Restore a saved session |
| `/export` | Export conversation as Markdown |
| `/copy-session` | Copy full conversation to clipboard |
| `/copy-last` | Copy last assistant response |
| `/ollama ls\|ps\|pull\|rm` | Manage Ollama models inline |
| `/strategy <name>` | Change orchestrator strategy |
| `/workers` | Show orchestrator worker pool |
| `/stats` | Show per-backend latency metrics |
