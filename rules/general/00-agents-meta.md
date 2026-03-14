# Agents File is Auto-Generated

`AGENTS.md` is auto-generated from the rule files under `rules/`. Never edit
`AGENTS.md` directly -- changes will be overwritten the next time the build
script runs.

To add or modify a rule:
1. Create or edit the appropriate file under `rules/<category>/<rule-name>.md`.
2. Regenerate `AGENTS.md` by running:
   ```
   ./scripts/build-agents.sh
   ```

Rule files are sorted alphabetically by path when assembled, so directory and
file naming determines order. Use a numeric prefix (e.g. `00-`, `01-`) on a
filename if a rule must appear before others in the same directory.
