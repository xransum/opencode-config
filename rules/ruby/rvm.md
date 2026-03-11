# rvm - Ruby Version Management

## Before Running

If a `.ruby-version` file or `Gemfile` with a `ruby` directive exists in the
project root, check whether the active Ruby version matches before running any
Ruby tooling (ruby, gem, bundle, rake, etc.).

- Get the pinned version: read `.ruby-version`, or parse `ruby 'x.x.x'` from `Gemfile`
- Get the active version: `ruby --version`
- If they differ and `rvm` is available (`which rvm`), warn the user:

  > "Active Ruby (x.x.x) does not match `.ruby-version` (x.x.x).
  > To switch: `rvm install x.x.x && rvm use x.x.x`"

Do not silently switch versions. Surface the mismatch and let the user decide.

## After a Failure

If a command fails with a version-related error (e.g. syntax errors, missing
methods, gem incompatibilities tied to a Ruby version), check for a
`.ruby-version` file or `Gemfile` ruby directive and whether the active version
matches.

If there is a mismatch and `rvm` is available, suggest the fix:

  > "This may be a Ruby version mismatch. `.ruby-version` pins x.x.x but you
  > are running x.x.x. To install and switch:
  > `rvm install x.x.x && rvm use x.x.x`"

If `rvm` is not available, suggest installing it via `https://rvm.io`.
