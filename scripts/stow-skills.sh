#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
TARGET_ROOT="$HOME/.agents/skills"

if ! command -v stow >/dev/null 2>&1; then
  echo "Error: GNU Stow is not installed." >&2
  echo "Install it first (for example, 'brew install stow' on macOS)." >&2
  exit 1
fi

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: Skills directory not found at $SKILLS_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_ROOT"

stowed_any=false
for package_path in "$SKILLS_DIR"/*; do
  if [ -d "$package_path" ]; then
    package_name="$(basename "$package_path")"
    package_target="$TARGET_ROOT/$package_name"
    mkdir -p "$package_target"
    stow --dir "$SKILLS_DIR" --target "$package_target" --restow "$package_name"
    echo "Stowed skill: $package_name -> $package_target"
    stowed_any=true
  fi
done

if [ "$stowed_any" = false ]; then
  echo "No skill packages found in $SKILLS_DIR"
  exit 1
fi

echo "Done. Skills are exposed under $TARGET_ROOT/<skill-name>/"
