# pyenv - Python Version Management

## Before Running

If a `.python-version` file exists in the project root, check whether the
active Python version matches the pinned version before running any Python
tooling.

- Get the pinned version: read `.python-version`
- Get the active version: `python --version` or `python3 --version`
- If they differ and `pyenv` is available (`which pyenv`), warn the user:

  > "Active Python (x.x.x) does not match `.python-version` (x.x.x).
  > To switch: `pyenv install x.x.x && pyenv local x.x.x`"

Do not silently switch versions. Surface the mismatch and let the user decide.

## After a Failure

If a command fails with a version-related error (e.g. syntax errors on valid
code, `python_requires` not satisfied, import errors on stdlib modules that
exist in newer versions), check for a `.python-version` file and whether the
active version matches.

If there is a mismatch and `pyenv` is available, suggest the fix:

  > "This may be a Python version mismatch. `.python-version` pins x.x.x but
  > you are running x.x.x. To install and switch:
  > `pyenv install x.x.x && pyenv local x.x.x`"

If the pinned version is not installed yet, `pyenv install` will handle it.
If `pyenv` is not available, suggest installing it via the project's docs or
`https://github.com/pyenv/pyenv`.
