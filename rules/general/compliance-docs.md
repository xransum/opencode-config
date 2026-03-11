# Project Compliance Docs

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
