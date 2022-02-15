Dotfiles for zsh on multiple OSes
=================================

These are my dotfiles, based on Holman's (https://github.com/holman/dotfiles)

## Installation

```sh
sudo apt install git
git clone https://github.com/matthull/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
./basics
./install
./apps
```

## Apps to install manually
[https://vivaldi.com/download/]
Go to Settings->Default Applications and change browser to vivaldi

Open vim and run `:VundleInstall`

```
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

## Reloading
After changing any dotfiles, run the following to reload all scripts and run all installers.

```sh
rld
```

## Editing
- .symlink: Files with this extension are symlinked to home folder
- .strap: Installer scripts which should be setup to run only if component is not already installed
