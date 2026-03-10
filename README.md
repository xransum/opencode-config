# opencode-config

Global configuration and agent rules for [opencode](https://opencode.ai).
Tracked here so the same rules and settings stay in sync across all devices.

## Contents

| File | Purpose |
|------|---------|
| `AGENTS.md` | Global agent rules -- coding standards, git policies, commit conventions |
| `opencode.json` | opencode app config (server port, model settings, etc.) |
| `update.sh` | Pull latest config from this repo |

Everything else in `~/.config/opencode/` (`node_modules/`, `package.json`,
`bun.lock`) is gitignored -- those are managed locally per device.

## Fresh install (new device)

Clone directly into the opencode config directory:

```bash
git clone https://github.com/xransum/opencode-config.git ~/.config/opencode
chmod +x ~/.config/opencode/update.sh
```

If `~/.config/opencode/` already exists on the device, move it out of the way
first or merge manually:

```bash
mv ~/.config/opencode ~/.config/opencode.bak
git clone https://github.com/xransum/opencode-config.git ~/.config/opencode
chmod +x ~/.config/opencode/update.sh
```

After cloning, install the opencode plugin (one-time, per device):

```bash
cd ~/.config/opencode
bun install
# or, if you don't have bun:
npm install
```

## Updating an existing device

Run the update script from anywhere:

```bash
~/.config/opencode/update.sh
```

Or manually:

```bash
cd ~/.config/opencode && git pull origin main
```

## Making changes

Edit `AGENTS.md` or `opencode.json`, then commit and push:

```bash
cd ~/.config/opencode
git add -p
git commit -m "chore(rules): ..."
git push origin main
```

Then run `update.sh` on any other devices to pull the changes down.

## Plugin install (one-time, per device)

The opencode plugin (`@opencode-ai/plugin`) is installed locally and is not
tracked in this repo. After cloning on a new device, or if `node_modules/` is
missing, run:

```bash
cd ~/.config/opencode
bun install   # preferred
# or
npm install
```

This only needs to be done once per device. The plugin version is pinned in
`package.json`, which is managed locally and excluded from version control.
