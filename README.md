

# stow-dotfiles

## Overview
A modular, symlink-managed dotfiles repository built with [GNU Stow](https://www.gnu.org/software/stow/). This setup centralizes configuration files for a streamlined Linux desktop and development environment, designed for reproducibility and easy maintenance.

## Included Configurations
- **Atuin** (`.config/atuin/config.toml`): Modern shell history manager with fuzzy search, session/workspace filtering, disabled auto-sync, and custom command exclusion rules for cleaner statistics.
- **Starship** (`.config/starship.toml`): Cross-shell prompt configured for a compact, single-line layout with the package module disabled and reduced scan timeout.
- **Topgrade** (`.config/topgrade.toml`): Universal upgrade tool set to auto-approve prompts (`assume_yes`), run `xbps` package cleanup post-upgrade, sync Emacs packages via `elpaca`, and manage containers with Podman.
- **KDE Plasma** (`.config/plasma-workspace/env/env.sh`): Desktop environment startup hook linked to `~/.profile` for consistent shell initialization.

## Requirements
- GNU Stow
- Atuin
- Starship
- Topgrade
- KDE Plasma / `plasma-workspace`
- Void Linux (`xbps`) is the primary target distro based on the configured cleanup commands. Other tools (`emacs`, `podman`) are optional but referenced in the configs.

## Installation
1. **Back up** any existing dotfiles or configuration files that may conflict with the symlinks in this repository.
2. Clone the repository into a hidden directory in your home folder (standard convention):
   ```bash
   git clone https://github.com/aadi58002/stow-dotfiles.git ~/.dotfiles
   ```
3. Navigate to the repository and apply the configurations using Stow:
   ```bash
   cd ~/.dotfiles
   stow .
   ```
   This will create relative symlinks in `~/.config/` and other target directories pointing to the files in `~/.dotfiles/`.

## Usage & Maintenance
- **Apply updates:** After pulling new changes to the repository, remove existing symlinks and re-apply them to ensure a clean state:
  ```bash
  git pull
  stow -R .
  stow .
  ```
- **Target specific modules:** You can selectively stow individual directories instead of the entire repo:
  ```bash
  stow atuin
  stow starship
  ```
- **Restore defaults:** If you need to revert all symlinks created by this repo:
  ```bash
  stow -D .
  ```

> ⚠️ **Note:** Always ensure your terminal and shell are properly sourced after updating prompt or history tool configurations. Run `source ~/.profile` or restart your terminal session to apply changes.
