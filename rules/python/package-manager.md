# Python Package Manager Detection

Before running any Python tooling commands (nox, pytest, mypy, ruff, black, etc.),
detect the project's package manager by inspecting the project root:

- If `uv.lock` exists, or `pyproject.toml` contains `[tool.uv]` -> use `uv run`
  - Examples: `uv run nox`, `uv run pytest`, `uv run mypy src/`
- If `poetry.lock` exists, or `pyproject.toml` contains `[tool.poetry]` -> use `poetry run`
  - Examples: `poetry run nox`, `poetry run pytest`, `poetry run mypy src/`
- If a `.venv/bin/<tool>` binary exists and neither of the above apply -> invoke
  it directly (e.g. `.venv/bin/nox`, `.venv/bin/pytest`)
- Otherwise fall back to the system PATH binary

Always detect before running - never assume a bare `nox` or `pytest` call will work.
