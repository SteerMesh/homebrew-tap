# MeshNet — Decentralized AI Agent Compute Network

> Peer-to-peer network for sharing AI backends across machines. Earn credits by lending your compute, spend credits by using the network.

## Vision

Every developer's machine has idle AI capacity — local Ollama models, CLI tools (Claude Code, Cursor), API keys. MeshNet connects them into a shared resource pool where an orchestrator on any node can transparently delegate tasks to the best available backend on any peer, with blockchain-style accounting to ensure fair participation.

## Architecture overview

```text
┌─────────────────────────────────────────────────────────────────┐
│                         MeshNet Protocol                         │
│                                                                 │
│  ┌───────────┐     delegate      ┌───────────┐                 │
│  │  Node A   │ ───────────────►  │  Node B   │                 │
│  │ consumer  │ ◄─────────────── │ provider  │                 │
│  │           │    result+proof   │           │                 │
│  └─────┬─────┘                   └─────┬─────┘                 │
│        │                               │                       │
│        │    ┌──────────────────────┐    │                       │
│        └───►│  Distributed Ledger  │◄───┘                       │
│   -credits  │  (signed receipts)   │  +credits                  │
│             └──────────────────────┘                            │
└─────────────────────────────────────────────────────────────────┘
```

## Core concepts

### Node
A machine running the `meshnet` daemon. Has:
- **Identity**: ed25519 keypair (persistent, generated once)
- **Capabilities**: list of backends it can serve (model names, types, context windows)
- **Reputation**: score 0-100 based on reliability, quality, latency
- **Balance**: FLUX credit balance (earned - spent)

### Task
A unit of work delegated across the network:
- Prompt + context → routed to best node → streamed response
- Each task generates a signed receipt settling credits

### Receipt
An immutable record of work performed:
- Signed by both consumer and provider
- Witnessed by 1+ peers
- Forms an append-only chain per node

### Reputation
Dynamic score computed from:
- Uptime reliability (30%)
- Task completion rate (25%)
- Response quality via assay scoring (20%)
- Latency performance (15%)
- Credit balance health (10%)

---

## Protocol specification

### 1. Node identity

```
~/.meshnet/
├── identity.json      ← {node_id, public_key, private_key, created_at}
├── peers.json         ← known peers + last seen
├── ledger/            ← signed receipt chain
│   ├── receipts.jsonl ← append-only receipt log
│   └── balances.json  ← current credit balances
└── config.toml        ← daemon configuration
```

Identity format:
```json
{
  "node_id": "meshnet_a1b2c3d4",
  "display_name": "macbook-pro",
  "public_key": "ed25519:base64...",
  "private_key": "ed25519:base64...(encrypted)",
  "created_at": "2026-08-11T18:00:00Z"
}
```

### 2. Discovery protocol

**Phase 1: Static peers (Tailscale/LAN)**
```toml
# ~/.meshnet/config.toml
[discovery]
mode = "static"  # or "mdns", "tailscale", "bootstrap"
peers = [
  "100.81.145.19:9876",   # ar8 via tailscale
  "192.168.1.50:9876",    # mac studio on LAN
]
```

**Phase 2: mDNS (zero-config LAN)**
- Service type: `_meshnet._tcp.local.`
- TXT record: `node_id=X,caps=ollama/deepseek:70b,score=85`

**Phase 3: Bootstrap nodes (internet-wide)**
- Known bootstrap nodes that maintain a peer registry
- New nodes contact bootstrap → get peer list → connect directly to peers

### 3. Heartbeat protocol

Every 30 seconds, nodes exchange:
```json
{
  "type": "heartbeat",
  "node_id": "meshnet_a1b2c3d4",
  "timestamp": "2026-08-11T18:00:30Z",
  "capabilities": [
    {"id": "deepseek:70b", "type": "ollama", "ctx": 32768, "load": 0.2},
    {"id": "claude-code", "type": "cli", "available": true}
  ],
  "reputation": 92,
  "balance": 147.3,
  "uptime_hours": 1240
}
```

### 4. Task delegation protocol

**Request:**
```json
{
  "type": "task_request",
  "id": "task_abc123",
  "from": "meshnet_a1b2c3d4",
  "capabilities_needed": ["code", "reasoning"],
  "min_reputation": 70,
  "max_cost": 10,
  "prompt": "Review this Go function for correctness...",
  "context": "...",
  "stream": true,
  "timeout_ms": 60000,
  "signature": "ed25519:base64..."
}
```

**Response (streamed):**
```json
{"type": "task_chunk", "id": "task_abc123", "chunk": "The function has..."}
{"type": "task_chunk", "id": "task_abc123", "chunk": " a potential race..."}
{"type": "task_done", "id": "task_abc123", "tokens_in": 1200, "tokens_out": 450, "model": "deepseek:70b", "elapsed_ms": 3200, "proof": "sha256:abc..."}
```

### 5. Settlement protocol

After task completion:
```json
{
  "type": "receipt",
  "id": "rcpt_xyz789",
  "task_id": "task_abc123",
  "from": "meshnet_a1b2c3d4",
  "to": "meshnet_e5f6g7h8",
  "amount": 4.5,
  "reason": "completion:deepseek:70b:1650tok",
  "proof": "sha256:abc...",
  "quality_rating": 4,
  "timestamp": "2026-08-11T18:01:03Z",
  "from_signature": "ed25519:...",
  "to_signature": "ed25519:...",
  "witnesses": ["meshnet_i9j0k1l2"]
}
```

---

## Credit economics

### Earning rates

| Action | Credits earned |
|--------|:--------------:|
| Completion (per 1K tokens generated) | +1.0 |
| Tool execution (file/shell) | +2.0 |
| Image generation | +5.0 |
| Video generation | +20.0 |
| Online + available (per hour) | +0.1 |
| Fast TTFT bonus (< 2s) | +0.5 |
| High quality bonus (rating 5/5) | +1.0 |

### Spending rates

| Action | Credits spent |
|--------|:-------------:|
| Consume completion (per 1K tokens) | -1.0 |
| Consume tool execution | -2.0 |
| Consume image generation | -5.0 |
| Consume video generation | -20.0 |
| Priority routing request | -0.5 extra |

### Reputation multiplier

| Score | Earning multiplier |
|:-----:|:------------------:|
| 90-100 | 1.5x |
| 75-89 | 1.2x |
| 50-74 | 1.0x |
| 25-49 | 0.7x |
| 0-24 | 0.5x (probation) |

### Bootstrap

New nodes receive **100 FLUX** initial grant. This allows ~100 delegations before they must start contributing back.

---

## Implementation plan

### Phase 1: Foundation (days 1-3)

**Files:**
- `cmd/meshnet/main.go` — CLI entry point (init, serve, status, balance)
- `internal/node/identity.go` — ed25519 keypair generation + persistence
- `internal/node/config.go` — config.toml loading
- `internal/node/capabilities.go` — detect local backends (reuse mesh's autodetect)

**Deliverables:**
- `meshnet init` — generate identity
- `meshnet status` — show node info
- Node can describe its own capabilities

### Phase 2: Discovery (days 3-5)

**Files:**
- `internal/discovery/static.go` — hardcoded peer list
- `internal/discovery/mdns.go` — mDNS broadcast + listen
- `internal/discovery/tailscale.go` — Tailscale peer detection
- `internal/discovery/manager.go` — unified peer table

**Deliverables:**
- Nodes find each other on LAN or Tailscale
- `meshnet peers` — show discovered nodes
- Heartbeat exchange every 30s

### Phase 3: Backend proxy (days 5-7)

**Files:**
- `internal/proxy/server.go` — HTTP server accepting task requests
- `internal/proxy/handler.go` — routes task to local backend, streams response
- `internal/proxy/client.go` — sends task requests to remote nodes
- `internal/transport/sse.go` — SSE streaming for responses

**Deliverables:**
- Node A can send a task to Node B
- Node B executes on its local backend
- Response streams back to Node A
- `meshnet serve` exposes backends to network

### Phase 4: Routing (days 7-9)

**Files:**
- `internal/router/matcher.go` — capability matching
- `internal/router/scorer.go` — rank candidates by reputation/latency/cost
- `internal/router/router.go` — unified routing decision

**Deliverables:**
- Tasks route to the best available node automatically
- Capability tags match against needs
- Reputation + latency weighting

### Phase 5: Ledger (days 9-12)

**Files:**
- `internal/ledger/receipt.go` — receipt structure + ed25519 signing
- `internal/ledger/chain.go` — append-only log, verification
- `internal/ledger/balance.go` — credit balance computation
- `internal/ledger/sync.go` — receipt exchange between peers (gossip)

**Deliverables:**
- Each task generates a co-signed receipt
- Receipts gossip to witnesses
- `meshnet balance` shows credits
- `meshnet ledger` shows receipt history

### Phase 6: Reputation (days 12-14)

**Files:**
- `internal/reputation/score.go` — compute reputation from receipts + events
- `internal/reputation/decay.go` — time-based decay
- `internal/reputation/events.go` — track completions, failures, quality ratings

**Deliverables:**
- Each node has a dynamic reputation score
- Score affects routing priority and earning multiplier
- `meshnet reputation` shows scores for all peers

### Phase 7: mesh integration (days 14-16)

**Files:**
- Modify `mesh/internal/backend/meshnet.go` — new backend type that delegates to the network
- Modify `mesh/internal/cli/autodetect.go` — include meshnet peers in detection

**Deliverables:**
- `mesh backends --mesh` shows network backends
- `delegate` tool transparently routes to meshnet
- Orchestrator uses remote backends seamlessly

### Phase 8: Dashboard TUI (days 16-17)

**Files:**
- `cmd/meshnet/dashboard.go` — bubbletea TUI
- Shows: peers (online/offline), balances, task history, reputation graph

---

## Security model

| Threat | Mitigation |
|--------|-----------|
| Impersonation | ed25519 signatures on all messages |
| Eavesdropping | Tailscale WireGuard encryption / mTLS on direct connections |
| Free-riding (consume without contributing) | Balance goes negative → rate limited → eventually blocked |
| Sybil attack (fake nodes for credits) | Reputation requires sustained uptime + quality work |
| Malicious responses (bad output for credits) | Consumer quality rating + assay scoring, disputes resolved by witnesses |
| Resource exhaustion (DoS) | Per-peer rate limits, reputation-gated access |

## Configuration

```toml
# ~/.meshnet/config.toml

[node]
display_name = "macbook-pro"
listen = "0.0.0.0:9876"

[discovery]
mode = "tailscale"  # "static" | "mdns" | "tailscale" | "bootstrap"
peers = []          # static peers (fallback)

[advertise]
backends = ["claude-code", "agent-local"]  # which backends to share
max_concurrent = 3                          # max simultaneous tasks from network

[economy]
min_balance = -50      # allow some debt before blocking
priority_cost = 0.5    # extra cost for priority routing
bootstrap_grant = 100  # initial credits for new nodes

[reputation]
min_score_to_serve = 30    # don't serve nodes below this score
min_score_to_consume = 10  # don't accept tasks from nodes below this
```

---

## CLI reference

```bash
meshnet init                    # generate identity + config
meshnet serve                   # start daemon (advertise + accept tasks)
meshnet status                  # show node info, peers, balance
meshnet peers                   # list known peers with scores
meshnet balance                 # show credit balance + history
meshnet ledger [--last N]       # show receipt chain
meshnet reputation [node_id]    # show reputation breakdown
meshnet config                  # edit config interactively
meshnet invite <peer>           # send join invitation to a peer
meshnet benchmark               # measure latency to all peers
```

---

## Future extensions

- **Marketplace UI** — web dashboard showing network topology, live task routing
- **Credit exchange** — trade FLUX credits for other tokens or fiat
- **Specialized pools** — "code review pool", "image gen pool" with dedicated pricing
- **Model caching** — nodes cache popular models, earn credits for cache hits
- **Privacy mode** — encrypted task payloads (only provider sees the prompt)
- **Federation** — multiple independent meshes can peer with each other
