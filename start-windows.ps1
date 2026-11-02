# Agent-owned startup. No participant Git/Python install, terminal or settings work.
param([string]$WorkingRoot = (Join-Path (Get-Location).Path 'Coaching-Pilot-Test'), [string]$CodexPath = '')
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
if ($env:OS -ne 'Windows_NT' -or $env:PROCESSOR_ARCHITECTURE -ne 'AMD64') { throw 'Selected package requires native Windows x64.' }
New-Item -ItemType Directory -Force -Path (Join-Path $WorkingRoot 'downloads') | Out-Null
$root = (Resolve-Path -LiteralPath $WorkingRoot).Path
$registry = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/codynoskov/meaningfall-coaching-pilot/main/distribution.json'
$selected = $registry.platforms.'windows-amd64'
$archive = Join-Path $root 'downloads\Coaching-Pilot-windows-amd64-r3.zip'
if (-not (Test-Path -LiteralPath $archive)) {
    if (Test-Path -LiteralPath ($archive + '.download')) { throw 'Partial download retained; agent must inspect recovery.' }
    Invoke-WebRequest -UseBasicParsing -Uri $selected.url -OutFile ($archive + '.download')
    if ((Get-FileHash -LiteralPath ($archive + '.download') -Algorithm SHA256).Hash.ToLowerInvariant() -ne $selected.sha256) { throw 'Package integrity differs; preserve and inspect.' }
    Move-Item -LiteralPath ($archive + '.download') -Destination $archive
}
if ((Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash.ToLowerInvariant() -ne $selected.sha256) { throw 'Existing package basis differs; never overwrite old Work.' }
$received = Join-Path $root 'received'
$kit = Join-Path $received 'Coaching-Pilot'
if (-not (Test-Path -LiteralPath $kit)) {
    if (Test-Path -LiteralPath $received) { throw 'Partial extraction retained; agent must inspect.' }
    Expand-Archive -LiteralPath $archive -DestinationPath $received
}
if ((Get-FileHash -LiteralPath (Join-Path $kit 'KIT-MANIFEST.json') -Algorithm SHA256).Hash.ToLowerInvariant() -ne $selected.kit_manifest_sha256) { throw 'Received kit basis differs; retain old Work.' }
if (-not $CodexPath) {
    $command = Get-Command codex.exe -ErrorAction SilentlyContinue
    if ($command) { $CodexPath = $command.Source }
    else {
        $candidate = Join-Path $env:LOCALAPPDATA 'Programs\OpenAI\Codex\bin\codex.exe'
        if (Test-Path -LiteralPath $candidate) { $CodexPath = $candidate }
    }
}
if (-not $CodexPath) { throw 'Agent must identify its actual installed native Codex executable; participant should not configure it.' }
$python = Join-Path $kit 'runtime-seed\native\runtime\python\python.exe'
& $python -B -X utf8 (Join-Path $kit 'bootstrap_windows.py') --kit $kit --local (Join-Path $root 'Run') --codex $CodexPath | Set-Content -Encoding UTF8 (Join-Path $root 'setup-result.json')
if ($LASTEXITCODE -ne 0) { throw 'Setup held; preserve actual diagnostics and inspect.' }
& $python -B -X utf8 (Join-Path $kit 'launch_coaching.py') --selection (Join-Path $root 'Run\pilot-selection.json') | Set-Content -Encoding UTF8 (Join-Path $root 'launch-result.json')
if ($LASTEXITCODE -ne 0) { throw 'Work/intake held; preserve original Work and receipts.' }
Write-Output ('Prepared project: ' + (Join-Path $root 'Run\Project'))
