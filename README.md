# dotfiles

new dotfiles WIP
see the old one on master branch
test

uses rotz

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/koca/dotfiles/refs/heads/main/setup/bootstrap | sh
```

### MacOS

#### Allow Terminal Permissions

Go to settings, Privacy & Security, Accessibility, and add Terminal to the list

#### Start the installation

```sh
rotz link macos/brew
rotz install
```

#### After installation

to set defaults and configure apps run:

```sh
./setup/mac/after
```
