#!/bin/bash
# Agent-owned startup; the participant never runs shell commands.
set -euo pipefail
[ "$(/usr/bin/uname -s)" = Darwin ] && [ "$(/usr/bin/uname -m)" = arm64 ] || { echo 'This package requires an Apple Silicon Mac.' >&2; exit 2; }
root="${1:-$PWD/Coaching-Pilot-Test}"
mkdir -p "$root/downloads"
root="$(cd "$root" && pwd -P)"
registry="$root/distribution-current.json"
/usr/bin/curl -q --fail --location --silent --show-error 'https://raw.githubusercontent.com/codynoskov/meaningfall-coaching-pilot/main/distribution.json' -o "$registry"
url="$(/usr/bin/plutil -extract platforms.macos-arm64.url raw -o - "$registry")"
checksum="$(/usr/bin/plutil -extract platforms.macos-arm64.sha256 raw -o - "$registry")"
kit_checksum="$(/usr/bin/plutil -extract platforms.macos-arm64.kit_manifest_sha256 raw -o - "$registry")"
archive="$root/downloads/Coaching-Pilot-macos-arm64-r3.zip"
if [ ! -f "$archive" ]; then
  [ ! -e "$archive.download" ] || { echo 'Partial download retained; agent must inspect recovery.' >&2; exit 2; }
  /usr/bin/curl -q --fail --location --show-error "$url" -o "$archive.download"
  actual="$(/usr/bin/shasum -a 256 "$archive.download" | /usr/bin/awk '{print $1}')"
  [ "$actual" = "$checksum" ] || { echo 'Downloaded package differs; preserve and inspect.' >&2; exit 2; }
  /bin/mv "$archive.download" "$archive"
fi
actual="$(/usr/bin/shasum -a 256 "$archive" | /usr/bin/awk '{print $1}')"
[ "$actual" = "$checksum" ] || { echo 'Existing package basis differs; do not overwrite.' >&2; exit 2; }
kit="$root/received/Coaching-Pilot"
if [ ! -d "$kit" ]; then
  [ ! -e "$root/received" ] || { echo 'Partial extraction retained; agent must inspect.' >&2; exit 2; }
  mkdir "$root/received"
  /usr/bin/ditto -x -k "$archive" "$root/received"
fi
actual="$(/usr/bin/shasum -a 256 "$kit/KIT-MANIFEST.json" | /usr/bin/awk '{print $1}')"
[ "$actual" = "$kit_checksum" ] || { echo 'Received kit basis differs; retain old Work and inspect.' >&2; exit 2; }
python="$kit/runtime-seed/native/runtime/python/bin/python3"
codex="${COACHING_CODEX_PATH:-}"
if [ -z "$codex" ]; then
  for candidate in "$(command -v codex || true)" '/Applications/Codex.app/Contents/Resources/codex' "$HOME/Applications/Codex.app/Contents/Resources/codex" '/Applications/ChatGPT.app/Contents/Resources/codex' '/Applications/ChatGPT.app/Contents/Resources/codex-cli/CodexCLI.app/Contents/MacOS/codex' '/Applications/Codex.app/Contents/Resources/codex-cli/CodexCLI.app/Contents/MacOS/codex'; do
    if [ -f "$candidate" ] && [ -x "$candidate" ] && /usr/bin/file -b "$candidate" | /usr/bin/grep -q 'Mach-O'; then codex="$candidate"; break; fi
  done
fi
[ -n "$codex" ] || { echo 'Agent must identify its actual installed Codex executable; participant should not configure it.' >&2; exit 2; }
"$python" -B "$kit/bootstrap_coaching_macos.py" --kit "$kit" --local "$root/Run" --codex "$codex" > "$root/setup-result.json"
"$python" -B "$kit/launch_coaching.py" --selection "$root/Run/pilot-selection.json" > "$root/launch-result.json"
printf '%s\n' "Prepared project: $root/Run/Project" "Read AGENTS.md and launch-result.json; continue the person's onboarding in ordinary language."
