# Bash Configuration

Personal bash configuration files for a more productive terminal experience.

## Structure

Files are numbered to control load order:

| File | Purpose |
|------|---------|
| `bashrc` | Entry point (symlinked from `~/.bashrc`) |
| `00-shell-options.sh` | History, shell options, lesspipe, dircolors |
| `02-aliases.sh` | Command aliases |
| `03-functions.sh` | Shell functions |
| `04-prompt.sh` | Prompt customization |
| `05-completions.sh` | Tab completion (bash-completion, fzf, atuin, uv) |
| `06-exports.sh` | Environment variables |

## Installation

1. Clone this repository:
   ```bash
   git clone git@github.com:BeechcraftNV/bash-config.git ~/.bashrc.d
   ```

2. Symlink bashrc:
   ```bash
   ln -sf ~/.bashrc.d/bashrc ~/.bashrc
   ```

3. Reload:
   ```bash
   source ~/.bashrc
   ```

## Features

### Shell Options (`00-shell-options.sh`)
- History settings (append, dedup, size)
- Window size checking
- Lesspipe for non-text files
- Dircolors support

### Aliases (`02-aliases.sh`)
- **Navigation**: `..`, `...`, `....`, `.....`
- **File listing** (eza): `ls`, `ll`, `la`, `lt`, `l.`
- **Safer file ops**: `cp -iv`, `mv -iv`, `rm -I`
- **Disk/system info**: `duf`, `dfh`, `meminfo`, `psmem`, `pscpu`, `myip`, `ports`
- **APT management**: `aptup`, `aptupg`, `aptin`, `aptrm`, `aptclean`
- **Docker**: `dps`, `dcu`, `dcd`, `dcl`
- **Git**: Full suite (`g`, `ga`, `gc`, `gco`, `gst`, `gl`, `gp`, `gps`, etc.)
- **Utilities**: `clr`, `h`, `hgrep`, `weather`, `serve`
- **Printing**: `lp`, `lpq`, `printduplex`, `quickprint`

### Output Capture (`02-aliases.sh`)
Capture command output, display it, and optionally copy to clipboard:
- **`t`**: Saves output to `/tmp/out.txt`
- **`c`**: Saves to `/tmp/out.txt` + copies to clipboard
- **`tc`**: Saves to timestamped file + copies to clipboard

### Functions (`03-functions.sh`)
- **`dcp()`**: Navigate and manage Docker Compose projects
- **`git_branch()`**: Display current git branch in prompt
- **`proj()`**: Quickly jump to projects in common directories

### Custom Scripts (`bin/`)
- **`quote [category]`**: Fetch random quotes/jokes (ZenQuotes, JokeAPI, AdviceSlip)
  - Supports `--help` and `--version`.
  - Categories: `tech`, `advice`, or default.

### Helper Functions (`02-aliases.sh`)
- **`mkcd`**: Create directory and cd into it
- **`extract`**: Universal archive extractor
- **`bak`**: Backup file with timestamp
- **`findtext`**: Search text in files recursively
- **`quickprint`**: Quick print with copy count

### Prompt (`04-prompt.sh`)
- Two-line colorful prompt with git branch
- Shows: user, host, path, git branch
- Debian chroot and xterm title support

### Completions (`05-completions.sh`)
- Bash completion
- FZF key bindings
- Atuin shell history
- UV (Python) completions

### Exports (`06-exports.sh`)
- Environment variables (GEMINI_MODEL, ZED_ALLOW_EMULATED_GPU)
- npm global path
- Cargo/Rust environment

## Dependencies

Some features require these tools:
- **eza**: Modern `ls` replacement
- **fd-find**: Fast `find` alternative (`apt install fd-find`)
- **bat/batcat**: Syntax highlighting cat
- **wl-clipboard**: Wayland clipboard (`apt install wl-clipboard`)
- **fzf**: Fuzzy finder
- **atuin**: Shell history search

## Adding New Config

Drop a new `.sh` file in `~/.bashrc.d/`. Number prefix controls load order.
