# Current automatic Coaching startup for Codex

The participant speaks only ordinary language. The agent owns all technical steps.
First determine the actual OS and architecture. Supported package profiles are
macOS14+ Apple Silicon (the selected live-test machine) and native Windows x64.
Intel Mac and ChatGPT Work are not qualified here. A Codex-capable host and the
person's own sign-in must already exist; a prompt cannot install its own host
before any agent is running. No system Git/Python/Node/GitHub CLI is required.

Read distribution.json from this repository and retain the selected version, URL
and hashes. For Mac, obtain start-macos.sh and run it with the agent's chosen new
writable workspace. For Windows, obtain start-windows.ps1 and use its equivalent
working-root argument. The person must not run commands or pick technical paths.
Scripts come from the user's expressly selected GitHub source. They obtain an
immutable versioned archive and verify its exact SHA256 before extraction/execution.

Mac entry uses only stock curl, shasum, plutil and ditto before bundled Python is
available. It preserves executable modes. Windows uses stock PowerShell download,
hash and ZIP functions. Both then use the packaged bootstrap and launch_coaching.py
to prepare software, start/inspect the original native Work, run actual local file
intake and bind a stable checked acquisition index. Timing updates do not silently
change native source identity. Existing Work/grants/history are never reset.

If native Codex is not discoverable at a known real executable path, inspect its
actual installation yourself. Mac supports the host-only COACHING_CODEX_PATH
override; Windows has CodexPath. Never ask the participant to identify binaries
or change settings. Explain only a genuine required permission in simple words.
Keep native sandbox and integrity checks. Do not bypass Windows execution policy
or security controls globally; if .ps1 execution is blocked, use the script's
actual permitted PowerShell statements through the host without changing policy.

Inspect setup and launch-result.json before claiming success. Startup is not
completed onboarding or accepted meaning. Read the received AGENTS.md and Guide.
Reuse all permitted existing project sources and offer substantial recommended
answers in manageable coherent blocks. Ask only consequential missing human facts.
Explain why new question groups matter. Preserve draft/confirmed/hypothetical
status and whose goal or outcome is described. Use the person's language; governing
records remain English and product Content languages retain their own choices.

For personal onboarding, first use personal context actually delivered by the host
or another identified permitted source. Current host memory-use settings and
source availability matter. Do not scrape a disabled memory folder, enable global
controls, infer cross-client ChatGPT access or copy personal information into a
project implicitly. With sufficient permitted context, propose a filled personal
draft and request only confirmation/corrections. Without it, explain simply and
ask a small group of relevant questions. A clean computer may have no prior local
memories. Reading, personal capture, project disclosure and synchronization remain
separate effects. Do not infer sensitive traits or a complete personality profile.

Actual qualification status is in QUALIFICATION.md. Platform artifacts/entrypoints
are versioned; a new GitHub distribution never silently upgrades an existing Work.
Public availability of this owner-requested download authorizes no website
publication, accounts, payments or additional personal-data transfer. The private
Meaningfall Lab repository remains private.
