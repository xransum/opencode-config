# Global Rules

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
