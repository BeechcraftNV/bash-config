# Bash Configuration

Personal bash configuration files for a more productive terminal experience.

## Features

### Aliases (`02-aliases.sh`)
- **Navigation shortcuts**: `..`, `...`, `....` for quick directory traversal
- **Modern CLI tools**: Enhanced `ls`, `ll`, `lt` using `eza` and `fd` for `fdfind`
- **Docker shortcuts**: `dps`, `dcu`, `dcd`, `dcl` for common Docker commands
- **Homelab access**: Quick SSH and directory navigation
### Output Capture (`02-aliases.sh`)
These tools capture command output, display it, and optionally save it or copy it to the clipboard. They support both piping and direct command execution (e.g., `ls | tc` or `tc ls -la`).
- **`t`**: Saves output to `/tmp/out.txt`.
- **`c`**: Saves output to `/tmp/out.txt` and copies it to the clipboard (`wl-copy`).
- **`tc`**: Saves output to a unique timestamped file in `/tmp/` and copies it to the clipboard. Ideal for capturing logs or command results for AI chat.

### Functions (`03-functions.sh`)
- **`dcp()`**: Navigate and manage Docker Compose projects in `/opt/docker/compose`
- **`git_branch()`**: Display current git branch in prompt
- **`proj()`**: Quickly jump to projects in common directories

### Prompt (`04-prompt.sh`)
- Colorful two-line prompt with git branch integration
- Shows: user, host, current path, and git branch
- Clean and readable color scheme

## Installation

1. Clone this repository:
   ```bash
   git clone git@github.com:BeechcraftNV/bash-config.git ~/.bashrc.d
   ```

2. Source the configuration files in your `~/.bashrc`:
   ```bash
   # Load custom bash configuration
   if [ -d ~/.bashrc.d ]; then
       for file in ~/.bashrc.d/*.sh; do
           [ -r "$file" ] && source "$file"
       done
   fi
   ```

3. Reload your bash configuration:
   ```bash
   source ~/.bashrc
   ```

## Dependencies

Some aliases require modern CLI tools:
- **eza**: Modern replacement for `ls` ([installation guide](https://github.com/eza-community/eza))
- **fd-find**: Fast, user-friendly alternative to `find` (`apt install fd-find`)
- **bat/batcat**: Syntax highlighting for `cat` ([installation guide](https://github.com/sharkdp/bat))
- **wl-clipboard**: Wayland clipboard utilities for the `c` alias (install via package manager: `apt install wl-clipboard`)

## Structure

Files are numbered to control load order:
- `02-aliases.sh` - Command aliases
- `03-functions.sh` - Shell functions
- `04-prompt.sh` - Prompt customization

## Contributing

This is a personal configuration repository, but feel free to fork and adapt to your needs.
