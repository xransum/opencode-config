# Git Branch Deletion Safety

Never delete `master`, `main`, `develop`, or any other long-lived/default branch
without explicit, unambiguous confirmation from the user -- even if it appears
stale, behind, or orphaned.

Before deleting any branch:
1. List all branches proposed for deletion clearly and individually.
2. Call out any long-lived branches (e.g. `master`, `main`, `develop`) by name
   and explicitly ask the user to confirm each one separately.
3. Do not treat a general "yea" or "yes" as blanket approval to delete
   long-lived branches unless the user named them specifically.

If a long-lived branch is accidentally deleted and the remote still exists,
restore it immediately with:

```
git branch <branch> origin/<branch>
```
