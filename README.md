# Peter's Dot Files

***IMPORTANT*** set user.name and user.email in `.gitconfig` after installation

## Installation

  git clone git://github.com/pitr/config_files
  cd config_files
  rake install

## Environment

Mac OS X will work. UNIX-based OS should work (the only problem: EDITOR is Sublime Text).

Uses [starship](https://starship.rs/) for command prompt.

## Commands

### Fish

Adds ~/bin to PATH if it exists.

Adds ~/code to CDPATH. `c` is alias for cd.

Usual `ls`, `ll`, `l`, .., ... and other aliases.

Shortcuts for most used programs:

  g - git
  v - vim
  e - Sublime Text

### Git

Adds shortcuts like:

  g     # git status -sb
  gb    # git branch -a -v
  gc    # git commit -m
  ga    # git add
  gadd  # git add -u && git add . && git status
  gco   # git checkout
  gd    # git diff --word-diff (since git 1.7.2)
  gg    # git graph ...
  gpl   # git pull --rebase
  gps   # git push
  gup   # git up (install git-up gem first)
  gbc   # cleans up merged branches locally
  gpr   # open pull request in web browser

And so forth. Find all in [fish_variables](https://github.com/pitr/config_files/blob/master/config/fish/fish_variables)
