# Agent startup: clean native Windows x64, ordinary Codex host

The person has no technical knowledge. They can describe their project in ordinary
language. You own downloads, setup, paths, source checks, intake and diagnostics.
Do not ask them to install Git, Python, Node, GitHub CLI or run commands. Explain
only a genuine necessary permission or human-only action in plain language.
Use the exact pinned package below; no GitHub login, clone or package manager is
needed to obtain it. A Codex-capable desktop app and the person's own sign-in must
already exist: a prompt cannot execute before the host application is installed.
Official host setup: https://learn.chatgpt.com/docs/app .

## 1. Download and retain the exact supplied package

Archive:
https://github.com/codynoskov/meaningfall-coaching-pilot/releases/download/coaching-windows-20261102-r2/Coaching-Pilot-Windows-20261102-r2.zip

SHA-256: `bdf03ce550ac69a984594ff2fbbc292f7481ee4fc395aee8fe70cc81a04ecefc`

Size: 524143377 bytes. Use the Windows-native agent and an actual writable selected
workspace. Choose a new local working folder yourself; avoid cloud/reparse/network
folders and preserve any pre-existing attempts. If no local execution/workspace
capability is available, explain the missing host capability rather than pretending
to install software in the chat or passing technical diagnostics to the participant.

PowerShell's built-in download, hash and ZIP facilities can obtain the package
before any Python/Git exists. These are agent instructions, not participant steps.
For example, after selecting a writable workspace and unused paths:

```powershell
$ProgressPreference = 'SilentlyContinue'
$download = Join-Path (Get-Location).Path 'Coaching-Pilot-Windows-20261102-r2.zip'
$target = Join-Path (Get-Location).Path 'Coaching-Pilot-Received'
$url = 'https://github.com/codynoskov/meaningfall-coaching-pilot/releases/download/coaching-windows-20261102-r2/Coaching-Pilot-Windows-20261102-r2.zip'
if (-not (Test-Path -LiteralPath $download)) {
    Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $download
}
$actual = (Get-FileHash -LiteralPath $download -Algorithm SHA256).Hash.ToLowerInvariant()
if ($actual -ne 'bdf03ce550ac69a984594ff2fbbc292f7481ee4fc395aee8fe70cc81a04ecefc') {
    throw 'Received archive differs; preserve it and inspect before continuing.'
}
if (Test-Path -LiteralPath $target) {
    throw 'Existing extraction requires inspection and continuation; do not overwrite it.'
}
Expand-Archive -LiteralPath $download -DestinationPath $target
$kit = Join-Path $target 'Coaching-Pilot'
```

Inspect/recover an existing valid received package rather than rerunning extraction
over it. After a partial download, inspect the failed file before replacing it;
a download error is not a reason to reset the Work or ignore a checksum.

## 2. Start the actual selected runtime and intake

Read `$kit/AGENTS.md`, `AGENT-START.md`, `SETUP.md`, `RECOVERY.md` and the relevant
current Guide/Guidance. They govern the actual native procedure and its limits.
The bundled interpreter is `runtime-seed/native/runtime/python/python.exe`.
No system Python, Git or SDK inference environment is needed beforehand.
Resolve the actual native Codex executable yourself from its installation/process
or a real executable binding; a guessed file or .cmd shim is not sufficient. The
ordinary host route uses the current conversation, not a second model subprocess.

Run the included bootstrap in a new separate sibling writable run. It verifies
kit bytes, copies a fresh local runtime, selects included portable Git, installs
hash-pinned native and intake dependencies separately and performs Windows checks.
Keep the original received kit and all prior attempts. Use its written
pilot-selection.json; never rebind old Work or regenerate manifests around unknown
changes. If the host needs a permission, explain its purpose simply. Do not change
global authentication, system/user PATH or Windows security settings by default.

Continue the actual SETUP.md procedure: begin a new native website-profile draft
Work with the supplied LAUNCH-INTENT.txt, then use the separately selected intake
Python to run the real intake_bundle.py on input/Coaching and input/manifest.json.
Compute the processing basis with the shipped helper and local model/software
inventory. Preserve all128 originals and duplicate paths; report unsupported/failed
preparation explicitly. Bind the exact resulting intake index as a required source
before dependent proposals. Copying files alone is not Data Intake. Do not claim
setup/startup/intake success without inspecting actual native output and receipts.

## 3. Conduct the requested onboarding

Reuse existing attributed sources before asking questions. Explain the immediate
purpose, offer optional independently permitted personal context early, then propose
substantial source-backed answers in coherent manageable sections. Ask small groups
of consequential human questions only for real gaps. Keep facts, hypotheses,
proposals, actual confirmations and effect permissions separate. Preserve whose
goals/outcomes are being described; operator earnings are not client-income promises.
Fill all applicable current foundation gaps while retaining later legal/rights/
publication dependencies. A private prototype does not close full onboarding.

Use the person's language as soon as they speak or request it; governing project
sources remain English and existing website content-language choices stay separate.
Continue authorized work after local clarification. Keep the same native Work and
source history. No old credentials, Work grants or acceptance are imported.

Translate progress and failures into ordinary language; never make the participant
supply paths, hashes, settings, method bodies or debug logs. If a genuine technical
block remains, retain evidence for the organizer and stop only its dependent action.
No website publication, account connection, payments or additional private-data
transfer is authorized by the archive's public availability.

## Qualification boundary

Package/source checks, synthetic conversations and macOS native tests are retained
inside the kit. Actual Windows execution is untested. ChatGPT Work is not a
qualified host for this chain, and the separate Windows SDK model subprocess route
is held. This startup is the ordinary native Codex host composition only.
