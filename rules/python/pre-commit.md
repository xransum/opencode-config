# Pre-Commit Before Committing

Before creating or amending any git commit:

1. If a `noxfile.py` is present, check whether a `pre-commit` session is
   defined in it (e.g. `grep -q 'pre-commit' noxfile.py`).
   - If yes, run it via nox (with `-p` for the primary Python):
     ```
     nox -p 3.11 -s pre-commit
     # or
     poetry run nox -p 3.11 -s pre-commit
     ```
2. Otherwise, if a `.pre-commit-config.yaml` is present, run pre-commit
   directly using whichever of these works:
   ```
   pre-commit run --all-files
   # or
   poetry run pre-commit run --all-files
   ```

Fix all failures before committing. Never skip hooks with `--no-verify`
unless the user explicitly asks.
