Dotfiles for zsh on multiple OSes
=================================

These are my dotfiles, based on Holman's (https://github.com/holman/dotfiles)

## Installation

```sh
git clone https://github.com/matthull/dotfiles ~/code/dotfiles
cd ~/code/dotfiles
source install
```

iTerm preferences are stored in the iterm folder and can be loaded via General->Preferences
screen in iTerm2.

OSX keybindings are found in the hotkeys folder and can be copied or symlinked to /Library/Preferences.

## Reloading
After changing any dotfiles, run the following to reload all scripts and run all installers.

```sh
rld
```

## Editing
- .symlink: Files with this extension are symlinked to home folder
- .strap: Installer scripts which should be setup to run only if component is not already installed
