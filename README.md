# Bash Configuration

Personal bash configuration files for a more productive terminal experience.

## Features

### Aliases (`02-aliases.sh`)
- **Navigation shortcuts**: `..`, `...`, `....` for quick directory traversal
- **Modern CLI tools**: Enhanced `ls`, `ll`, `lt` using `eza`
- **Docker shortcuts**: `dps`, `dcu`, `dcd`, `dcl` for common Docker commands
- **Homelab access**: Quick SSH and directory navigation

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
- **bat/batcat**: Syntax highlighting for `cat` ([installation guide](https://github.com/sharkdp/bat))

## Structure

Files are numbered to control load order:
- `02-aliases.sh` - Command aliases
- `03-functions.sh` - Shell functions
- `04-prompt.sh` - Prompt customization

## Contributing

This is a personal configuration repository, but feel free to fork and adapt to your needs.
