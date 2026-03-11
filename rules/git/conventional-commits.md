# Conventional Commits

All commit messages must follow the Conventional Commits 1.0.0 specification.

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

- Type and description are required. Everything else is optional.
- Description must be lowercase, imperative mood, no trailing period. Keep it under 72 characters.
- Body starts one blank line after the description. Use it when the why isn't obvious from the description alone.
- Footers start one blank line after the body. Format: `Token: value` or `Token #value`.

## Types

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

## Scope

Optional. A short noun in parentheses describing what area changed.

```
feat(posts): add python basics draft
fix(repl): move inline script to external src file
docs(intro-python): fix broken print() sentence
```

## Breaking Changes

Use `!` after the type/scope, or add a `BREAKING CHANGE:` footer.

```
feat(config)!: drop support for legacy front matter format

BREAKING CHANGE: posts without pin field will no longer render correctly
```
