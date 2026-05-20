#!/usr/bin/env bash
set -euo pipefail

# Deploys a DevKin release: publishes a GitHub Release on homebrew-devkin
# (dmgs + notes), commits + pushes the regenerated cask, and tags the source
# repo. Run `scripts/build.sh <version>` in the DevKin source repo first.
#
# This script lives in the homebrew-devkin repo but runs from within the DevKin
# source tree, where homebrew-devkin is cloned at release/homebrew-devkin/.
# It therefore resolves the source root three levels up from its own location.

usage() {
  cat <<EOF >&2
Usage: release/homebrew-devkin/scripts/release.sh <version> <release-notes-file>
  e.g.  release/homebrew-devkin/scripts/release.sh 1.2.0 /tmp/devkin-notes.md
EOF
}

VERSION="${1:-}"
NOTES_FILE="${2:-}"
if [[ -z "$VERSION" || -z "$NOTES_FILE" ]]; then
  usage; exit 1
fi

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[A-Za-z0-9.-]+)?$ ]]; then
  echo "Error: version must look like X.Y.Z (optionally -prerelease)" >&2
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$ROOT"

TAP_DIR="release/homebrew-devkin"
TAP_REPO="lsh2613/homebrew-devkin"
ARM_DMG="release/build/DevKin-${VERSION}-arm64.dmg"
X64_DMG="release/build/DevKin-${VERSION}-x64.dmg"

# --- prechecks: fail before publishing anything ---
if [[ ! -f "$NOTES_FILE" ]]; then
  echo "Error: release notes file not found: $NOTES_FILE" >&2
  exit 1
fi

if [[ ! -f "$ARM_DMG" || ! -f "$X64_DMG" ]]; then
  echo "Error: dmgs not found — run scripts/build.sh $VERSION first:" >&2
  echo "  $ARM_DMG" >&2
  echo "  $X64_DMG" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Error: gh is not authenticated. Run once: gh auth login" >&2
  exit 1
fi

if gh release view "v$VERSION" -R "$TAP_REPO" >/dev/null 2>&1; then
  echo "Error: GitHub Release v$VERSION already exists on $TAP_REPO." >&2
  echo "Delete it first if you intend to re-release this version." >&2
  exit 1
fi

# --- publish GitHub Release (download URL must be live before the cask push) ---
echo "==> Publishing GitHub Release v$VERSION on $TAP_REPO"
gh release create "v$VERSION" -R "$TAP_REPO" \
  --title "DevKin v$VERSION" \
  --notes-file "$NOTES_FILE" \
  "$ARM_DMG" "$X64_DMG"

# --- commit + push the cask ---
echo "==> Committing + pushing cask (release: v$VERSION)"
git -C "$TAP_DIR" add Casks/devkin.rb
git -C "$TAP_DIR" commit -m "release: v$VERSION"
git -C "$TAP_DIR" push

# --- tag the source repo for the next release's changelog boundary ---
git tag -f "v$VERSION"

cat <<EOF

Released v$VERSION
  • GitHub Release : https://github.com/$TAP_REPO/releases/tag/v$VERSION
  • Cask           : pushed to $TAP_REPO (commit "release: v$VERSION")
  • Source tag     : v$VERSION (local — push with 'git push origin v$VERSION')

Still manual: commit the package.json + package-lock.json version bump.
EOF
