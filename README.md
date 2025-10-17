## Installation

This dotfiles repository uses a configuration-driven installation system:

1. **Configure**: Edit `dotfiles.cfg` to enable/disable specific components
   - Set `export CFG_INSTALL_<COMPONENT>=true` to install a component
   - Set `export CFG_INSTALL_<COMPONENT>=false` to skip a component

2. **Install**: Run the installation script
   ```bash
   ./install_dotfiles
   ```

The `install_dotfiles` script will automatically run the install scripts in each directory based on what's enabled in `dotfiles.cfg`.

### Available Components

- `CFG_INSTALL_NVIM` - Install nvim.appimage
- `CFG_INSTALL_BASH_ALIASES` - Set up .bash_aliases
- `CFG_INSTALL_DIRCOLORS` - Set up .dircolors
- `CFG_INSTALL_XRESOURCES` - Set up .Xresources
- `CFG_INSTALL_FZF` - Install fzf fuzzy finder
- `CFG_INSTALL_VTAGS` - Install vtags (deprecated, now a neovim plugin)
- `CFG_INSTALL_URXVT` - Set up urxvt terminal
- `CFG_INSTALL_DELTA` - Install git-delta

### Backups

Existing configuration files are automatically backed up to `~/dotfiles_backup/` before installation.
