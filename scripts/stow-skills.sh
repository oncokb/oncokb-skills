#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/.agents/skills"
TARGET_DIR="$HOME/.agents/skills"

if ! command -v stow >/dev/null 2>&1; then
  echo "Error: GNU Stow is not installed." >&2
  echo "Install it first (for example, 'brew install stow' on macOS)." >&2
  exit 1
fi

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: Skills directory not found at $SKILLS_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

stowed_any=false
for package_path in "$SKILLS_DIR"/*; do
  if [ -d "$package_path" ]; then
    package_name="$(basename "$package_path")"
    stow --dir "$SKILLS_DIR" --target "$TARGET_DIR" --restow "$package_name"
    echo "Stowed skill: $package_name"
    stowed_any=true
  fi
done

if [ "$stowed_any" = false ]; then
  echo "No skill packages found in $SKILLS_DIR"
  exit 1
fi

echo "Done. Skills are exposed in $TARGET_DIR"
