# OncoKB Skills

This repository stores agent skills under `skills/`.

## Expose skills with GNU Stow

1. Install GNU Stow:

   ```bash
   brew install stow
   ```

2. Run the stow script from this repository root:

   ```bash
   bash scripts/stow-skills.sh
   ```

This links each skill package into `~/.agents/skills/`.

Whenever you add a new folder under `skills/`, rerun `bash scripts/stow-skills.sh` so the new skill is linked into `~/.agents/skills/`.
