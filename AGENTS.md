# OncoKB Skills

If you are asked to add/edit a skill then add the skill to `skills/` and
in this repo.

All skill names and directories must start with the `oncokb-` prefix.

Please follow the `skills/oncokb-writing-for-agents` skill as a template.

As you make changes to the skills, please make sure double check there are no
conflicts with other skills.

## Stow layout

Skills use per-skill target subdirectories under `~/.agents/skills/`:

- `~/.agents/skills/<skill-name>/`

To stow all skills, run:

- `bash scripts/stow-skills.sh`
