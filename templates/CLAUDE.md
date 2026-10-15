# Claude Code Collaboration Rules

- When given a plan file in `docs/plans/*.md`, immediately activate and follow the `antigravity-executor` skill.
- Keep output concise, technical, and without introductory filler.
- Always pause at `[CHECKPOINT: User Review]` blocks to let the user review before starting the next phase.
- Recommend `/clear` after completing each phase to reset context and minimize token usage.
