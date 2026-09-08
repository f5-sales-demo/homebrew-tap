# Ghostty terminal automation

This tap pins the upstream Peekaboo 4.3.2 CLI and companion application for
controlled Ghostty desktop acceptance tests. It does not rename Ghostty, alter
bundle identifiers, replace Codex Computer Use, install profiles, or change MDM.

## Install and configure

```sh
brew install f5-sales-demo/tap/ghostty-automation
ghostty-automation setup
```

`setup` installs `f5-sales-demo/tap/peekaboo` and the
`f5-sales-demo/tap/peekaboo-app` cask, verifies their versions and Developer ID
identity, starts the app and Peekaboo's signed on-demand daemon, and waits for
its exact Bridge socket at `~/Library/Application Support/Peekaboo/daemon.sock`.
Approve Screen
Recording, Accessibility, and Event Synthesizing for Peekaboo when System
Settings prompts. The tool does not create a PPPC profile or alter device
management.

The generated Codex entry is enclosed by explicit ownership markers. Setup
refuses an existing unmanaged `[mcp_servers.peekaboo]` table and otherwise
preserves the rest of `~/.codex/config.toml` byte-for-byte. Restart Codex after
setup, enable, or disable, then confirm with `codex mcp list`.

Peekaboo 4.3.2 cannot initialize its `browser` tool through the GUI app's
`bridge.sock`, because browser sessions require an on-demand host. The managed
MCP entry therefore uses the daemon's explicit `daemon.sock`. `doctor` verifies
the signed `boo.peekaboo.peekaboo` identity, the `onDemand` host kind, browser
handoff capability, and all three permissions. This keeps all 26 pinned MCP
tools available without modifying or re-signing Peekaboo.

To enable Chrome page automation, open `chrome://inspect/#remote-debugging`,
enable remote debugging for the intended profile, and accept Chrome's prompt.
Then run `peekaboo browser connect --channel stable --foreground` once.

## Operations

```sh
ghostty-automation doctor
ghostty-automation doctor --json
ghostty-automation disable
ghostty-automation enable
GHOSTTY_SOURCE_DIR=/path/to/ghostty ghostty-automation test --lane xctest
ghostty-automation test --lane mcp
ghostty-automation uninstall
ghostty-automation uninstall --purge --revoke-tcc
```

`disable` creates the sentinel before changing the Codex entry. The proxy
rejects every `tools/call` while that sentinel exists. It terminates a recorded
child only after its PID, process start time, executable path, and SHA-256 still
identify the same process generation. It never uses broad process matching.

The audit stream is `~/Library/Logs/GhosttyAutomation/audit.jsonl`, mode 0600.
It contains only timestamps, coarse tool categories, bundle/PID/window IDs when
explicitly supplied, permission booleans, duration, outcome, and error code.
Arguments, typed text, clipboard data, screenshots, accessibility labels,
prompts, commands, window titles, child stderr, and MCP result content are not
recorded. Peekaboo receipt export remains disabled.

Uninstall disables the server first and removes only the managed Codex block,
managed proxy/state files, and installed formula/cask. `--purge` additionally
removes the sanitized audit log. `--revoke-tcc` resets only the
`boo.peekaboo.mac` and `boo.peekaboo.peekaboo` identities.

## Persistent runner policy

Run desktop acceptance serially on a dedicated Apple Silicon Mac with a
persistent, logged-in, unlocked Aqua session and retained TCC grants. Never run
untrusted fork code on that runner; require maintainer review first.

At job preflight, start Peekaboo.app with `--background-bridge-host`, wait for
the exact socket, run `doctor`, then execute XCTest and MCP lanes. Upload
`.xcresult`, cropped fixture screenshots, sanitized fixture JSONL, Ghostty logs,
and machine/permission diagnostics for 14 days.

Begin with an advisory check on trusted pull requests, default-branch pushes,
and nightly default-branch runs. Count only original, non-rerun default-branch
executions whose preflight and both test stages pass. Failure, timeout,
cancellation, or a Peekaboo version change resets the streak. Manual runs and
reruns do not count. After 20 consecutive qualifying passes, review artifacts
and manually promote the same check name to required; promotion does not alter
MDM.

## Pinned release evidence

| Artifact | SHA-256 |
| --- | --- |
| `peekaboo-macos-universal.tar.gz` | `a7f706a1847e9e8513fd6f2f0a8f02cbdafe8f07d2a2ca028f2213b06f185e08` |
| `Peekaboo-4.3.2.app.zip` | `5a9cca84a387f7dc2d6f4bc4aba7a5c08368a941cba63f06f7ad1f809c944628` |

The unmodified upstream archives are expected to have Team ID `FWJYW4S8P8`,
app bundle ID `boo.peekaboo.mac`, and CLI signing ID
`boo.peekaboo.peekaboo`.
