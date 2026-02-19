# Bash Configuration

Personal bash configuration files for a more productive terminal experience.

## Structure

Files are numbered to control load order:

| File | Purpose |
|------|---------|
| `bashrc` | Entry point (symlinked from `~/.bashrc`) |
| `00-shell-options.sh` | History, shell options, lesspipe, dircolors |
| `02-aliases.sh` | Command aliases and clipboard helpers (`t`, `c`, `tc`) |
| `03-functions.sh` | Shell functions (dcp, proj, mkcd, extract, bak, findtext) |
| `04-prompt.sh` | Prompt customization |
| `05-completions.sh` | Tab completion (bash-completion, fzf, uv) |
| `06-exports.sh` | Environment variables and PATH |
| `07-capture.sh` | Output capture functions (`cap`, `blk`, `cblk`) |
| `90-nvm.sh` | NVM lazy loading |
| `91-atuin.sh` | Atuin shell history |
| `99-blesh.sh` | ble.sh (Bash Line Editor) |

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
- History settings (append, dedup, 1000/2000 line limits)
- Window size checking (`checkwinsize`)
- Lesspipe for non-text files in `less`
- Dircolors support

### Aliases (`02-aliases.sh`)
- **Navigation**: `..`, `...`, `....`, `.....`
- **File listing** (eza): `ls`, `ll`, `la`, `lt`, `l.`
- **Safer file ops**: `cp -iv`, `mv -iv`, `rm -I`
- **Disk/system info**: `duf`, `dfh`, `meminfo`, `psmem`, `pscpu`, `myip`, `ports`
- **APT management**: `aptup`, `aptupg`, `aptin`, `aptrm`, `aptclean`
- **Docker**: `dps`, `dcu`, `dcd`, `dcl`
- **Git**: Full suite (`g`, `ga`, `gc`, `gco`, `gst`, `gl`, `gp`, `gps`, etc.)
- **Utilities**: `clr`, `h`, `hgrep`, `weather`, `serve`, `ccat`, `bc`
- **Printing**: `lp`, `lpq`, `printduplex`, `printlandscape`, `pdf`
- **Quick capture** (tee to `/tmp`): `t` (display), `c` (display + clipboard), `tc` (display + clipboard + timestamped file)

### Functions (`03-functions.sh`)
- **`dcp [name]`**: Navigate to and start a Docker Compose project
- **`proj [name]`**: Jump to a project directory across `~/projects`, `~/code`, `/opt/docker/compose`
- **`git_branch`**: Emits `(branchname)` for use in PS1
- **`mkcd <dir>`**: Create directory and `cd` into it
- **`extract <file>`**: Universal archive extractor (tar, zip, rar, 7z, gz, bz2, etc.)
- **`bak <file>`**: Copy file to `file_YYYYMMDD-HHMMSS.bak`
- **`findtext <term> [pattern] [dir]`**: Recursive case-insensitive grep piped to `less -R`
- **`quickprint <file> [copies]`**: Print to the Brother DCP-L2550DW
- **`queueclear`**: Cancel all print jobs
- **`printtest`**: Print a CUPS test page

### Capture (`07-capture.sh`)
Three wrappers for capturing and highlighting command output. All preserve the command's exit code and capture both stdout and stderr.

- **`cap <cmd>`** — run a command, display output, and copy it to clipboard
  ```bash
  cap git diff HEAD~1
  cap cat /etc/hosts
  ```

- **`blk <cmd>`** — wrap output in full-width horizontal rules for visual separation
  ```bash
  blk df -h
  blk docker ps
  ```
  ```
  ────────────────────────────────────────────────────────────────
  Filesystem      Size  Used Avail Use% Mounted on
  ...
  ────────────────────────────────────────────────────────────────
  ```

- **`cblk <cmd>`** — visual delimiters + clipboard copy in one shot
  ```bash
  cblk kubectl get pods -A
  cblk systemctl status nginx
  ```
  Ideal for output you want to screenshot or paste — rules give clean boundaries, clipboard copy saves manual selection.

### Prompt (`04-prompt.sh`)
Two-line colorful prompt with git branch support:
```
steven at hostname in ~/projects/foo (main)
❯
```
- Green user, red host, yellow path, magenta git branch, cyan `❯`
- Debian chroot support
- Skips xterm title for WezTerm (avoids notification spam)

### Completions (`05-completions.sh`)
- System bash-completion
- fzf key bindings (Ctrl-R history, Ctrl-T file, Alt-C cd)
- `uv` (Python package manager) completions

### Exports (`06-exports.sh`)
- `GEMINI_MODEL`, `ZED_ALLOW_EMULATED_GPU`
- `~/.npm-global/bin` added to PATH
- PATH deduplication (preserves order)
- Ensures `~/.local/bin` is present

### NVM (`90-nvm.sh`)
Lazy-loads NVM on first use of `nvm`, `node`, `npm`, or `npx` to avoid ~100ms startup penalty.

### Atuin (`91-atuin.sh`)
Shell history search and sync. Replaces Ctrl-R with a fuzzy, filterable history UI.

### ble.sh (`99-blesh.sh`)
Bash Line Editor — syntax highlighting, enhanced completion menus, vim mode. Prints install instructions if not found.

## Dependencies

Some features require these tools:

| Tool | Purpose | Install |
|------|---------|---------|
| `eza` | Modern `ls` replacement | `apt install eza` |
| `fd-find` | Fast `find` alternative | `apt install fd-find` |
| `bat`/`batcat` | Syntax-highlighting `cat` | `apt install bat` |
| `wl-copy` | Wayland clipboard | `apt install wl-clipboard` |
| `fzf` | Fuzzy finder | `apt install fzf` |
| `atuin` | Shell history search/sync | [atuin.sh](https://atuin.sh) |
| `ble.sh` | Bash Line Editor | see `99-blesh.sh` for install cmd |
| `nvm` | Node Version Manager | [nvm.sh](https://github.com/nvm-sh/nvm) |

## Adding New Config

Drop a new `.sh` file in `~/.bashrc.d/`. The number prefix controls load order. No shebang needed — all files are sourced by `bashrc`.
