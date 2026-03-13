# Global Rules

---

## Plain ASCII Punctuation

Never use Unicode punctuation characters in any file you write or edit.
Always substitute the plain ASCII equivalent:

| Avoid | Use instead |
|-------|-------------|
| `"` `"` curly double quotes | `"` |
| `'` `'` curly single quotes | `'` |
| `—` em dash | `--` or rewrite the sentence |
| `–` en dash | `-` |
| `…` ellipsis | `...` |
| `·` middle dot | `-` or rewrite |
| `•` bullet point | use Markdown `- ` lists |
| `->` Unicode arrows | `->` |
| non-breaking space (U+00A0) | regular space |
| `«` `»` guillemets | `"` |
| `‹` `›` single guillemets | `'` |

This applies to prose, comments, commit messages, documentation, and all other
files. Code string literals are exempt when the value itself must contain a
specific character.

---

## Project Compliance Docs

Before making any non-trivial change to a project (adding features, refactoring,
modifying dependencies, changing tooling, editing CI, etc.), check the project
root for compliance and development documentation and read it first.

Common filenames to look for:

- `DEVELOPMENT.md` - coding standards, tooling setup, quality gates, contribution workflow
- `CONTRIBUTING.md` - contribution rules, branch and PR conventions
- `ARCHITECTURE.md` - structural decisions and module boundaries
- `STANDARDS.md` or `CODE_STANDARDS.md` - style and quality requirements
- `AGENTS.md` - project-specific rules for AI agents

If any of these exist, read them before planning or executing changes. Follow
whatever conventions they define - formatting, tooling commands, naming, test
requirements, and workflow steps all take precedence over general defaults.

---

## JSON Tool Parameters

When making function calls using tools that accept array or object parameters,
ensure those are structured using JSON. For example:

```json
[{"color": "orange", "options": {"key": true}}, {"color": "purple"}]
```

---

## No Emojis

Never use emojis in any output, file, comment, commit message, or communication
unless the user explicitly asks for them.

This applies to all responses, documentation, code comments, commit messages,
pull request descriptions, and any other generated text.

---

## Conventional Commits

All commit messages must follow the Conventional Commits 1.0.0 specification.

### Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

- Type and description are required. Everything else is optional.
- Description must be lowercase, imperative mood, no trailing period. Keep it under 72 characters.
- Body starts one blank line after the description. Use it when the why isn't obvious from the description alone.
- Footers start one blank line after the body. Format: `Token: value` or `Token #value`.

### Types

| Type | When to use |
|------|-------------|
| `feat` | introducing something new (post, feature, page) |
| `fix` | correcting a bug or broken behavior |
| `docs` | edits to existing posts, drafts, or documentation |
| `chore` | config changes, dependency updates, housekeeping |
| `style` | formatting only -- no behavior change |
| `refactor` | restructuring without changing behavior |
| `perf` | performance improvements |
| `test` | adding or updating tests |
| `ci` | CI/CD pipeline changes |
| `build` | build system or tooling changes |
| `revert` | reverting a previous commit |

### Scope

Optional. A short noun in parentheses describing what area changed.

```
feat(posts): add python basics draft
fix(repl): move inline script to external src file
docs(intro-python): fix broken print() sentence
```

### Breaking Changes

Use `!` after the type/scope, or add a `BREAKING CHANGE:` footer.

```
feat(config)!: drop support for legacy front matter format

BREAKING CHANGE: posts without pin field will no longer render correctly
```

---

## Pull Request Assignments and Labels

These rules apply only when working in repos owned by `xransum`. Do not assign
or label PRs in repos owned by other users or organizations.

When creating a pull request in an `xransum` repo:

1. Always assign the PR to `xransum` unless explicitly instructed otherwise,
   but only after confirming via the GitHub API that `xransum` is in the list
   of assignable collaborators for that repo.

2. Always apply labels from the repo's existing label set that best reflect the
   nature of the PR (e.g. `bug`, `enhancement`, `ci`, `dependencies`, `testing`,
   `documentation`, etc.). Never create new labels - only use what already exists.
   Apply multiple labels when appropriate.

---

## Git Push and Branch Protection

Never push directly to `main` (or any other protected branch) without explicit
user approval first. This applies even when the repository owner/admin role
would allow bypassing branch protection rules.

Before any `git push origin main` (or force push to any protected branch):
1. Stop and ask the user for confirmation.
2. Explain what will be pushed and why a direct push is necessary over a PR.
3. Only proceed if the user explicitly approves.

Exceptions (still require user confirmation, but may be presented as urgent):
- A broken release pipeline that needs an immediate hotfix to unblock CI/CD.
- A CI/config-only change with zero source impact that the user has already
  reviewed in full.

This rule exists because bypassing branch protection -- even as an admin --
circumvents review history, leaves no PR trail, and cannot be undone without
a force push.

---

## nvm - Node Version Management

### Before Running

If a `.nvmrc` or `.node-version` file exists in the project root, check
whether the active Node version matches the pinned version before running any
Node tooling (npm, npx, yarn, pnpm, etc.).

- Get the pinned version: read `.nvmrc` or `.node-version`
- Get the active version: `node --version`
- If they differ and `nvm` is available (`command -v nvm`), warn the user:

  > "Active Node (vx.x.x) does not match `.nvmrc` (vx.x.x).
  > To switch: `nvm install x.x.x && nvm use x.x.x`"

Do not silently switch versions. Surface the mismatch and let the user decide.

### After a Failure

If a command fails with a version-related error (e.g. `ENGINE` unsupported,
syntax errors on valid code, missing APIs that exist in newer versions), check
for a `.nvmrc` or `.node-version` file and whether the active version matches.

If there is a mismatch and `nvm` is available, suggest the fix:

  > "This may be a Node version mismatch. `.nvmrc` pins vx.x.x but you are
  > running vx.x.x. To install and switch:
  > `nvm install x.x.x && nvm use x.x.x`"

If `nvm` is not available, suggest installing it via `https://github.com/nvm-sh/nvm`.

---

## Blog Post Writing

These rules apply when writing or editing blog posts (Markdown files in `_posts/` or `_drafts/`).

### Character Set

All blog post content must use plain ASCII characters only. Do not use typographic or Unicode variants of standard punctuation. Specifically:

| Avoid | Use instead |
|-------|-------------|
| `\u2014` em dash | `--` or rewrite the sentence |
| `\u2013` en dash | `-` |
| `\u2018` `\u2019` curly single quotes | `'` |
| `\u201C` `\u201D` curly double quotes | `"` |
| `\u2026` ellipsis | `...` |
| `\u00B7` middle dot | `-` or rewrite |
| `\u2022` bullet point | use Markdown `- ` lists |
| `\u2192` right arrow | `->` |
| `\u00A0` non-breaking space | regular space |
| `\u00AB` `\u00BB` guillemets | `"` |
| `\u2039` `\u203A` single guillemets | `'` |

This applies to all prose, callouts, code comments, table content, and front matter values. Code blocks are exempt -- use whatever characters the code itself requires.

### Tone

- Write like a person, not a textbook. Avoid definitions that read like a glossary entry.
- Keep it personal and direct. First person is fine.
- Use contractions. "You don't need to" not "It is not necessary to".
- Avoid AI-sounding filler phrases: "it's worth noting", "it's important to remember", "in conclusion", "in summary", "delve into", "leverage", "utilize".
- Section openers should ground the reader in the *why* before jumping to the *what*.

---

## Running Nox Sessions

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

---

## Python Package Manager Detection

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

---

## Pre-Commit Before Committing

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

---

## pyenv - Python Version Management

### Before Running

If a `.python-version` file exists in the project root, check whether the
active Python version matches the pinned version before running any Python
tooling.

- Get the pinned version: read `.python-version`
- Get the active version: `python --version` or `python3 --version`
- If they differ and `pyenv` is available (`which pyenv`), warn the user:

  > "Active Python (x.x.x) does not match `.python-version` (x.x.x).
  > To switch: `pyenv install x.x.x && pyenv local x.x.x`"

Do not silently switch versions. Surface the mismatch and let the user decide.

### After a Failure

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

---

## rvm - Ruby Version Management

### Before Running

If a `.ruby-version` file or `Gemfile` with a `ruby` directive exists in the
project root, check whether the active Ruby version matches before running any
Ruby tooling (ruby, gem, bundle, rake, etc.).

- Get the pinned version: read `.ruby-version`, or parse `ruby 'x.x.x'` from `Gemfile`
- Get the active version: `ruby --version`
- If they differ and `rvm` is available (`which rvm`), warn the user:

  > "Active Ruby (x.x.x) does not match `.ruby-version` (x.x.x).
  > To switch: `rvm install x.x.x && rvm use x.x.x`"

Do not silently switch versions. Surface the mismatch and let the user decide.

### After a Failure

If a command fails with a version-related error (e.g. syntax errors, missing
methods, gem incompatibilities tied to a Ruby version), check for a
`.ruby-version` file or `Gemfile` ruby directive and whether the active version
matches.

If there is a mismatch and `rvm` is available, suggest the fix:

  > "This may be a Ruby version mismatch. `.ruby-version` pins x.x.x but you
  > are running x.x.x. To install and switch:
  > `rvm install x.x.x && rvm use x.x.x`"

If `rvm` is not available, suggest installing it via `https://rvm.io`.
