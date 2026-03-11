# Running Nox Sessions

When a project uses nox (i.e. a `noxfile.py` is present), always run sessions
against the single primary/default Python only, not the full matrix. Do this
with the `-p` flag:

```
nox -p 3.11 -s <session>
```

This avoids spinning up redundant virtualenvs and burning tokens on identical
failures across interpreter versions. If a full matrix run is genuinely needed
(e.g. pre-release validation across all supported Pythons), tell the user to
run it themselves:

```
poetry run nox
```

Never run bare `nox` or `nox -s <session>` without a `-p` constraint unless
the user explicitly asks for a full matrix run.
