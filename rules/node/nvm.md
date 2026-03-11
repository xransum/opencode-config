# nvm - Node Version Management

## Before Running

If a `.nvmrc` or `.node-version` file exists in the project root, check
whether the active Node version matches the pinned version before running any
Node tooling (npm, npx, yarn, pnpm, etc.).

- Get the pinned version: read `.nvmrc` or `.node-version`
- Get the active version: `node --version`
- If they differ and `nvm` is available (`command -v nvm`), warn the user:

  > "Active Node (vx.x.x) does not match `.nvmrc` (vx.x.x).
  > To switch: `nvm install x.x.x && nvm use x.x.x`"

Do not silently switch versions. Surface the mismatch and let the user decide.

## After a Failure

If a command fails with a version-related error (e.g. `ENGINE` unsupported,
syntax errors on valid code, missing APIs that exist in newer versions), check
for a `.nvmrc` or `.node-version` file and whether the active version matches.

If there is a mismatch and `nvm` is available, suggest the fix:

  > "This may be a Node version mismatch. `.nvmrc` pins vx.x.x but you are
  > running vx.x.x. To install and switch:
  > `nvm install x.x.x && nvm use x.x.x`"

If `nvm` is not available, suggest installing it via `https://github.com/nvm-sh/nvm`.
