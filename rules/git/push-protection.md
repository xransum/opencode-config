# Git Push and Branch Protection

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
